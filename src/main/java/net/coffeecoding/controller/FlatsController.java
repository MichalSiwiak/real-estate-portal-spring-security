package net.coffeecoding.controller;


import net.coffeecoding.entity.Flat;
import net.coffeecoding.model.Filter;
import net.coffeecoding.refresh.Cities;
import net.coffeecoding.service.FlatService;
import net.coffeecoding.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.*;
import java.util.List;


@Controller
public class FlatsController {

    @Autowired
    private FlatService flatService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private ServletContext servletContext;


    @GetMapping("/new-flat")
    public String newFlat() {
        return "new-flat-form";
    }

    @GetMapping("/flat")
    public String showFlat(@RequestParam("id") int id, Model model) {
        if (id != 0) {
            Flat flat = flatService.getFlat(id);
            model.addAttribute("flat", flat);
            return "flat-form";
        } else {
            return "redirect:/demo";
        }
    }

    @GetMapping("/demo")
    public String getAllFlats(Model model) {
        List<Flat> flats = flatService.getFlats();
        Filter filter = new Filter();
        filter.setMinPrice(flatService.findMinPrice());
        filter.setMaxPrice(flatService.findMaxPrice());
        List<String> cities = flatService.findDistinctByCity();
        model.addAttribute("cities", cities);
        model.addAttribute("flats", flats);
        model.addAttribute("filter", filter);
        return "flats-list-form";
    }

    @PostMapping("/demo")
    public String submitFilters(@ModelAttribute("filter") Filter filter) {

        List<Flat> byCityEquals;
        if (filter.getCity() == "All")
            byCityEquals = flatService.getFlats();
        else
            byCityEquals = flatService.findByCityEquals(filter.getCity());

        List<Flat> byTitleLike;
        if (filter.getTitle() == "")
            byTitleLike = flatService.getFlats();
        else
            byCityEquals = flatService.findByTitleLike(filter.getTitle());

        List<Flat> byPriceBetween = flatService.findByPriceBetween(filter.getMinPrice(), filter.getMaxPrice());


        System.out.println(filter.toString());


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

    @RequestMapping(value = "/flat-avatar/{imageId}", method = RequestMethod.GET)
    public void getAvatarOfFlat(HttpServletResponse response, @PathVariable int imageId) throws IOException {
        Flat flat = flatService.getFlat(imageId);
        byte[] byteArray = flat.getAvatar();
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }

    @PostMapping("/uploadFlat")
    public String submitFlat(@RequestParam("file") MultipartFile file,
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
            flat.setAvatar(resizeImage(file.getBytes(), 150, 100));
            flat.setUsers(usersService.getUser(principal.getName()));
            flatService.saveFlat(flat);
            model.addAttribute("success", "File uploaded successfully.");
        }
        return "new-flat-form";
    }

    @RequestMapping(value = "/refresh", produces = MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.GET)
    public ResponseEntity<String> refresh() throws IOException {

        List<Flat> flats = flatService.getFlats();
        for (Flat flat : flats) {
            flatService.deleteFlat(flat);
        }

        File[] files = new File("/home/michal/Pobrane/flats").listFiles();
        Map<Integer, String> titles = new HashMap<>();
        Map<Integer, String> contents = new HashMap<>();

        titles.put(0, "A three-room apartment");
        titles.put(1, "Centrum tenement house, brick, close to Medical Academy, public transport");
        titles.put(2, "I will sell a flat - 98 sq m. Convenient location");
        titles.put(3, "House at an attractive price in the unfinished state");
        titles.put(4, "Apartment 3 rooms center 465 000");
        titles.put(5, "A three-room apartment with an area of 78.63 sq m, located on the Eko-Park estate");
        titles.put(6, "Amazing Apartment Center 108m2");
        titles.put(7, "GOOD COMMUNICATION THE ENVIRONMENT OF THE COMFORTABLE SEATS");
        titles.put(8, "A GARDEN AND A MODERN CAPACITY PURPOSE");
        titles.put(9, "Spacious 46 sq m renovated apartment");
        titles.put(10, "A PRESTIGIOUS PLACE PERFECT FOR THE REST OF GREEN HOUSING");
        titles.put(11, "300m2 in one level, 2 terraces, garage and cell included");
        titles.put(12, "I will sell the house directly");
        titles.put(13, "DIRECTLY FREELANDED HOUSE");
        titles.put(14, "The perfect investment");

        contents.put(0, "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
        contents.put(1, "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.");
        contents.put(2, "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.");
        contents.put(3, "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).");
        contents.put(4, "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.");


        for (int i = 0; i < 200; i++) {

            Flat flat = new Flat();
            byte[] image = Files.readAllBytes(files[new Random().nextInt(files.length)].toPath());

            flat.setCity(Cities.randomCities().toString());
            flat.setTitle(titles.get(new Random().nextInt(14)));
            flat.setContent(contents.get(new Random().nextInt(4)));
            flat.setRooms(randInt(1, 10));
            flat.setSurface(randInt(30, 100));
            flat.setPrice(randInt(1, 10) * 113000);
            flat.setDate(new Timestamp(new Date().getTime()));
            flat.setImage(image);
            flat.setAvatar(resizeImage(image, 150, 100));
            flat.setUsers(usersService.getUser("admin"));

            flatService.saveFlat(flat);

        }

        return new ResponseEntity<>("Successfully refreshed database!", HttpStatus.OK);
    }

    private int randInt(int min, int max) {
        Random random = new Random();
        int randomNum = random.nextInt((max - min) + 1) + min;
        return randomNum;
    }

    private byte[] resizeImage(byte[] byteArray, int width, int height) {

        byte[] resizedImageByteArray = new byte[0];

        try {
            BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(byteArray));
            int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

            BufferedImage bufferedImage = new BufferedImage(width, height, type);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(originalImage, 0, 0, width, height, null);
            g.dispose();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "jpg", baos);
            baos.flush();
            resizedImageByteArray = baos.toByteArray();
            baos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return resizedImageByteArray;
    }


}