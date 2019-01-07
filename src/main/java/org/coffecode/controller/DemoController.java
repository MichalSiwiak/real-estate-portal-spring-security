package org.coffecode.controller;

import org.coffecode.entity.Flat;
import org.coffecode.service.FlatService;
import org.coffecode.service.UsersService;
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
public class DemoController {

    @Autowired
    private FlatService flatService;
    @Autowired
    private UsersService usersService;

    @GetMapping("/")
    public String showHome() {

        return "home";
    }

    @GetMapping("/flats")
    public String getAllFlats(Model theModel) {

        List<Flat> topics = flatService.getFlats();
        theModel.addAttribute("flats", topics);

        return "flats-form";
    }

    @RequestMapping(value = "/image-manual-response/{imageId}", method = RequestMethod.GET)
    public void getImageAsByteArray2(HttpServletResponse response, @PathVariable int imageId) throws IOException {
        Flat flat = flatService.getFlat(imageId);
        byte[] byteArray = flat.getImage();
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }

    @PostMapping("/singleFileUpload")
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content,
                                   @RequestParam("price") int price,
                                   @RequestParam("surface") int surface,
                                   @RequestParam("rooms") int rooms,
                                   @RequestParam("city") String city,
                                   Principal principal,
                                   Model model) throws IOException {
        if (file.getOriginalFilename().isEmpty()) {
            model.addAttribute("msg", "Please select a valid file!");
        } else if (file.getSize() > 5242880) {
            model.addAttribute("msg", "File can not be larger than 5 MB!");
        } else if (!file.getContentType().equals("image/jpeg")) {
            model.addAttribute("msg", "Please select a valid format!");
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
            model.addAttribute("msg", "File uploaded successfully.");
            System.out.println("DONE");
        }
        return "home";
    }
}
