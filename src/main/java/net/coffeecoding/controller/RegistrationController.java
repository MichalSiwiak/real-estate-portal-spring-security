package net.coffeecoding.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import net.coffeecoding.entity.Users;
import net.coffeecoding.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import net.coffeecoding.user.User;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserDetailsManager userDetailsManager;
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    private Logger logger = Logger.getLogger(getClass().getName());
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private UsersService usersService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showRegistrationForm")
    public String showMyLoginPage(Model theModel) {
        theModel.addAttribute("user", new User());
        return "registration-form";
    }

    @GetMapping("/remind-password")
    public String remindPasswordGET() {
        return "remind-password-form";
    }


    @PostMapping("/remind-password")
    public String remindPasswordPOST(@RequestParam("email") String email, Model model) {

        boolean userExists = doesUserExist(email);

        if (userExists) {
            Users user = usersService.getUser(email);
            String newPassword = String.valueOf(user.hashCode());
            String encodedPassword = passwordEncoder.encode(newPassword);
            encodedPassword = "{bcrypt}" + encodedPassword;
            user.setPassword(encodedPassword);
            usersService.saveUser(user);

            try {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("info@coffeecoding.net");
                message.setTo(email);
                message.setSubject("Real Estate Portal");
                message.setText("Your new password is: " + newPassword);
                emailSender.send(message);
            } catch (Exception e) {
                model.addAttribute("error", "Some error occurred.");
            }
            model.addAttribute("success", "The new password has been sent to your email.");
        } else {
            model.addAttribute("error", "E-mail is not assigned to any user.");
        }


        return "remind-password-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("user") User user,
            BindingResult theBindingResult,
            Model theModel, @RequestParam("repassword") String repassword) {

        String userName = user.getUserName();
        logger.info("Processing registration form for: " + userName);

        if (theBindingResult.hasErrors()) {
            theModel.addAttribute("user", new User());
            theModel.addAttribute("registrationError", "User name/password can not be empty.");
            logger.warning("User name/password can not be empty.");
            return "registration-form";
        }

        boolean userExists = doesUserExist(userName);

        if (userExists) {
            theModel.addAttribute("user", new User());
            theModel.addAttribute("registrationError", "User name already exists.");
            logger.warning("User name already exists.");
            return "registration-form";
        }

        if (!user.getPassword().equals(repassword)) {
            theModel.addAttribute("user", new User());
            theModel.addAttribute("registrationError", "Passwords must be the same.");
            logger.warning("Passwords must be the same.");
            return "registration-form";
        }

        String encodedPassword = passwordEncoder.encode(user.getPassword());
        encodedPassword = "{bcrypt}" + encodedPassword;
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_USER");
        org.springframework.security.core.userdetails.User tempUser = new org.springframework.security.core.userdetails.User(userName, encodedPassword, authorities);
        userDetailsManager.createUser(tempUser);
        logger.info("Successfully created user: " + userName);
        return "registration-confirmation";
    }

    private boolean doesUserExist(String userName) {
        logger.info("Checking if user exists: " + userName);
        boolean exists = userDetailsManager.userExists(userName);
        logger.info("User: " + userName + ", exists: " + exists);
        return exists;
    }
}
