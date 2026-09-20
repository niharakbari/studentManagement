package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String doLogin(@RequestParam String username,
			              @RequestParam String password,
			              HttpSession session,
			              Model model) {

		// Very simple hard-coded login suitable for a student project.
		if ("admin".equalsIgnoreCase(username) && "admin123".equals(password)) {
			session.setAttribute("loggedInUser", username);
			return "redirect:/dashboard";
		}

		model.addAttribute("error", "Invalid username or password. Try admin / admin123.");
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/login";
	}
}

