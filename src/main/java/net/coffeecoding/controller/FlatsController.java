package net.coffeecoding.controller;


import net.coffeecoding.entity.Flat;
import net.coffeecoding.service.FlatService;
import net.coffeecoding.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


@Controller
public class FlatsController {

    @Autowired
    private FlatService flatService;
    @Autowired
    private UsersService usersService;

    @GetMapping("/new-flat")
    public String showHome() {
        return "new-flat-form";
    }

    @GetMapping("/flat")
    public String viewNewFlat(@RequestParam("id") int id, Model model) {
        if (id != 0) {
            Flat flat = flatService.getFlat(id);
            model.addAttribute("flat", flat);
            System.out.println(id);
            return "flat-form";
        } else {
            return "/flats";
        }
    }

    @GetMapping("/demo")
    public String getAllFlats(Model theModel) {
        List<Flat> topics = flatService.getFlats();
        theModel.addAttribute("flats", topics);
        return "flats-list-form";
    }

    @RequestMapping(value = "/flat-image/{imageId}", method = RequestMethod.GET)
    public void getImageOfFlat(HttpServletResponse response, @PathVariable int imageId) throws IOException {
        Flat flat = flatService.getFlat(imageId);
        byte[] byteArray = flat.getImage();
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }

    @PostMapping("/uploadFlat")
    public String uploadFlat(@RequestParam("file") MultipartFile file,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content,
                                   @RequestParam("price") int price,
                                   @RequestParam("surface") int surface,
                                   @RequestParam("rooms") int rooms,
                                   @RequestParam("city") String city,
                                   Principal principal,
                                   Model model) throws IOException {
        if (file.getOriginalFilename().isEmpty()) {
            model.addAttribute("error", "Please select a valid file!");
        } else if (file.getSize() > 5242880) {
            model.addAttribute("error", "File can not be larger than 5 MB!");
        } else if (!file.getContentType().equals("image/jpeg")) {
            model.addAttribute("error", "Please select a valid format!");
        } else {
            Flat flat = new Flat();
            flat.setTitle(title);
            flat.setContent(content);
            flat.setDate(new Timestamp(new Date().getTime()));
            flat.setPrice(price);
            flat.setSurface(surface);
            flat.setRooms(rooms);
            flat.setCity(city);
            flat.setImage(file.getBytes());
            flat.setUsers(usersService.getUser(principal.getName()));
            flatService.saveFlat(flat);
            model.addAttribute("success", "File uploaded successfully.");
        }
        return "new-flat-form";
    }
}