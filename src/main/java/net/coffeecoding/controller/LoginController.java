package net.coffeecoding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
