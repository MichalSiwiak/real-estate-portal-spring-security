package net.coffeecoding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.logging.Logger;

@Controller
public class LoginController {


	@GetMapping("/loginPage")
	public String showMyLoginPage() {
		return "login-form";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {

		return "access-denied";

	}



	@GetMapping("/error")
	public String showErrorPage() {
		return "error-page";
	}
}
