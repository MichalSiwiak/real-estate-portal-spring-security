<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>coffeecoding.net</title>
    <meta name="description"
          content="Free open source projects present different java solutions using spring, hibernate and other popular frameworks.">
    <meta name="keywords"
          content="java, spring, hibernate, apache, tomcat, coding, programmer, linux, google cloud platform, open source, bootstrap, mysql, java ideas">
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.standalone.min.css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/now-ui-kit.css" type="text/css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/style.css" type="text/css">
    <link rel="icon" href="resources/img/favicon.png">
    <!-- PAGE scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
</head>


<body class="bg-light text-dark">
<div id="wrap">
    <div id="main" class="clear-top">


        <div class="collapse" id="navbarHeader">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 py-4">
                        <h4>About</h4>
                        <p class="text-info">Free open source projects present different java solutions using spring,
                            hibernate
                            and other popular frameworks.</p>
                    </div>
                    <div class="col-md-3 offset-md-1 py-4">
                        <h4>Contact</h4>
                        <ul class="list-unstyled">
                            <li>
                                <a href="https://pl.linkedin.com/in/michalsiwiak" class="text-secondary"
                                   target="_blank">Follow
                                    on LinkedIn</a>
                            </li>
                            <li>
                                <a href="mailto:info@coffeecoding.net" target="_top" class="text-secondary">Email me</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="navbar sticky-top navbar-dark bg-info">
            <div class="container d-flex justify-content-between">
                <a href="https://www.coffeecoding.net/" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-home fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">
                    HOME
                </text>
                </a>
                <a href="https://github.com/MichalSiwiak/real-estate-portal-spring-security" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-git-square fa-fw d-inline-block lead fa-2x"></i>&nbsp;&nbsp;<text class="">SOURCE
                    CODE
                </text>
                </a>
                <a href="${pageContext.request.contextPath}/demo" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-desktop fa-2x fa-fw lead d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">DEMO VIEW
                </text>
                </a>
                <a href="https://coffeecoding.net/resources/img/cv_msiwiak.pdf"
                   class="navbar-brand d-flex align-items-center" target="_blank"><i
                        class="fa fa-address-card fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">RESUME
                </text>
                </a>
                <a href="/contact" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-envelope fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">CONTACT
                </text>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"><span
                        class="navbar-toggler-icon"></span></button>
            </div>
        </div>


        <div class="text-center mb-3 py-1 bg-info"
             style="	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
            <div class="container">
                <div class="row">
                    <div class="m-0 mt-2 col-md-8 p-2">
                        <h1 class="text-left mt-5"> Real Estate Portal</h1>
                    </div>
                    <div class="col-md-4 w-25"><img class="card-img-top" src="resources/img/house.jpg"
                                                    alt="Card image cap"
                                                    width="600"></div>
                </div>
            </div>
        </div>


        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h5>This application presents portal implementation of selling flats using spring mvc, spring
                            security and spring data. The application saves each advertisement in the database with a photo of the apartment
                            as blob format. When the user saves a photo, a thumbnail of the image is created for display
                            on the home page.</h5>
                        <h5><b>To add a new advertisement the user must be logged in.</b></h5>
                        <h5>The application supports operations:</h5>
                        <h5>
                            <ul>
                                <li>creating new user using spring security database,</li>
                                <li>logging to portal using spring security database,</li>
                                <li>resetting the user password if it is forgotten and sending new e-mail,</li>
                                <li>adding a new house advertisement,</li>
                                <li>viewing advertisements for sale of apartments,</li>
                                <li>filtering advertisements by price range, city and title.</li>
                            </ul>
                        </h5>
                        <h5><b>Back End: </b>Java, Spring MVC, Spring Data, Hibernate, MySQL.</h5>
                        <h5><b>Front End: </b>HTML, CSS, JSP.</h5>
                        <h5><b>Database schema: </b></h5>
                        <img src="resources/img/schema.png">
                        <h5>To run application: git clone
                            https://github.com/MichalSiwiak/real-estate-portal-spring-security.git,
                            upload and run application using tomcat application server or similar.</h5>
                        <h5>Demo View: <a href="https://www.coffeecoding.net/flats/demo">https://www.coffeecoding.net/flats/demo</a>
                        </h5>
                        <h5>Controller class:</h5>
                    </div>
                </div>
                <pre><code class="java">
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
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.*;
import java.util.List;

import static java.util.stream.Collectors.toList;


@Controller
public class FlatsController {

    @Autowired
    private FlatService flatService;
    @Autowired
    private UsersService usersService;


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
        model.addAttribute("flats", flats);

        Filter filter = new Filter();
        model.addAttribute("filter", filter);

        List<String> cities = flatService.findDistinctByCity();
        model.addAttribute("cities", cities);


        model.addAttribute("max", flatService.findMaxPrice());
        model.addAttribute("min", flatService.findMinPrice());
        model.addAttribute("maxFilter", flatService.findMaxPrice());
        model.addAttribute("minFilter", flatService.findMinPrice());

        return "flats-list-form";
    }

    @PostMapping("/demo")
    public String submitFilters(@ModelAttribute("filter") Filter filter, Model model) {

        List<Flat> flats = flatService.getFlats();
        List<Flat> byTitleLike = flats;
        List<Flat> byCityEquals = flats;

        if (!filter.getTitle().equals(""))
            byTitleLike = flatService.findByTitleLike(filter.getTitle());

        List<String> cities = flatService.findDistinctByCity();
        cities.add("All");
        model.addAttribute("cities", cities);
        model.addAttribute("selected", filter.getCity());


        if (!(filter.getCity().equals("All") || filter.getCity().equals("")))
            byCityEquals = flatService.findByCityEquals(filter.getCity());

        model.addAttribute("max", flatService.findMaxPrice());
        model.addAttribute("min", flatService.findMinPrice());
        int minFilter = Integer.parseInt(filter.getPriceRange().split(" - ")[0]);
        int maxFilter = Integer.parseInt(filter.getPriceRange().split(" - ")[1]);
        model.addAttribute("minFilter", minFilter);
        model.addAttribute("maxFilter", maxFilter);
        List<Flat> byPriceBetween = flatService.findByPriceBetween(minFilter, maxFilter);

        List<Flat> common;

        common = flats
                .stream()
                .filter(byTitleLike::contains)
                .filter(byCityEquals::contains)
                .filter(byPriceBetween::contains)
                .collect(toList());

        model.addAttribute("flats", common);

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

        File[] files = new File("/opt/tomcat/webapps/flats/resources/data/flats").listFiles();
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


        for (int i = 0; i < 100; i++) {

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

            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "jpg", byteArrayOutputStream);
            byteArrayOutputStream.flush();
            resizedImageByteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return resizedImageByteArray;
    }

}
</code></pre>
                <h5 class="mb-3">FlatDAO implementation class:</h5>
                <pre><code class="java">
package net.coffeecoding.dao;

import net.coffeecoding.entity.Flat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FlatDAOImpl implements FlatDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Flat> getFlats() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> theQuery =
                currentSession.createQuery("SELECT f from Flat f",
                        Flat.class);
        List<Flat> flats = theQuery.getResultList();
        return flats;
    }

    @Override
    public Flat getFlat(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Flat flat = currentSession.get(Flat.class, id);
        return flat;
    }

    @Override
    public void saveFlat(Flat flat) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(flat);
    }

    @Override
    public void deleteFlat(Flat flat) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(flat);
    }

    @Override
    public List<String> findDistinctByCity() {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<String> query =
                currentSession.createQuery("select DISTINCT(f.city) from Flat f",
                        String.class);
        List<String> cities = query.getResultList();
        return cities;
    }

    @Override
    public List<Flat> findByCityEquals(String cityName) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where f.city = :cityName ",
                        Flat.class);
        query.setParameter("cityName", cityName);
        List<Flat> flats = query.getResultList();

        return flats;
    }

    @Override
    public List<Flat> findByTitleLike(String title) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where lower(f.title) like lower(concat('%', :title,'%'))",
                        Flat.class);
        query.setParameter("title", title);
        List<Flat> flats = query.getResultList();
        return flats;
    }

    @Override
    public List<Flat> findByPriceBetween(int minPrice, int maxPrice) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where f.price BETWEEN :minPrice AND :maxPrice ",
                        Flat.class);
        query.setParameter("minPrice", minPrice);
        query.setParameter("maxPrice", maxPrice);
        List<Flat> flats = query.getResultList();

        return flats;
    }

    @Override
    public int findMaxPrice() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Integer> query =
                currentSession.createQuery("SELECT MAX(f.price) FROM Flat f",
                        Integer.class);
        if (query.getSingleResult() != null)
            return query.getSingleResult();
        else
            return 0;
    }

    @Override
    public int findMinPrice() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Integer> query =
                currentSession.createQuery("SELECT MIN(f.price) FROM Flat f",
                        Integer.class);
        if (query.getSingleResult() != null)
            return query.getSingleResult();
        else
            return 0;
    }
}

                      </code></pre>
                <h5 class="mb-3">Flat service implementation class:</h5>
                <pre><code class="java">
package net.coffeecoding.service;

import net.coffeecoding.dao.FlatDAO;
import net.coffeecoding.entity.Flat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FlatServiceImpl implements FlatService {

    @Autowired
    private FlatDAO flatDAO;

    @Override
    @Transactional
    public List<Flat> getFlats() {
        return flatDAO.getFlats();
    }

    @Override
    @Transactional
    public Flat getFlat(int id) {
        return flatDAO.getFlat(id);
    }

    @Override
    @Transactional
    public void saveFlat(Flat flat) {
        flatDAO.saveFlat(flat);
    }

    @Override
    @Transactional
    public void deleteFlat(Flat flat) {
        flatDAO.deleteFlat(flat);
    }

    @Override
    @Transactional
    public List<String> findDistinctByCity() {
        return flatDAO.findDistinctByCity();
    }

    @Override
    @Transactional
    public List<Flat> findByCityEquals(String cityName) {
        return flatDAO.findByCityEquals(cityName);
    }

    @Override
    @Transactional
    public List<Flat> findByTitleLike(String title) {
        return flatDAO.findByTitleLike(title);
    }

    @Override
    @Transactional
    public List<Flat> findByPriceBetween(int minPrice, int maxPrice) {
        return flatDAO.findByPriceBetween(minPrice, maxPrice);
    }

    @Override
    @Transactional
    public int findMaxPrice() {
        return flatDAO.findMaxPrice();
    }

    @Override
    @Transactional
    public int findMinPrice() {
        return flatDAO.findMinPrice();
    }
}
                     </code></pre>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/highlight.min.js"></script>
                <script>
                    hljs.initHighlightingOnLoad();
                </script>
            </div>
        </div>


    </div>
</div>


<footer class="footer bg-dark text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>© Copyright 2018 coffeecoding.net - All rights reserved.<br>Contact: info@coffeecoding.net<br>Warsaw PL<br><a
                href="https://www.coffeecoding.net/">Visit the homepage</a>
        </p>
    </div>
</footer>


</body>
</html>