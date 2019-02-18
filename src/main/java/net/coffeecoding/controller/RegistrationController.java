package net.coffeecoding.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
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
            model.addAttribute("success", "The password has been sent to the email.");
        } else {
            model.addAttribute("error", "E-mail is not assigned to any user.");
        }

        return "remind-password-form";
    }


    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("user") User user,
            BindingResult theBindingResult,
            Model theModel) {

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
