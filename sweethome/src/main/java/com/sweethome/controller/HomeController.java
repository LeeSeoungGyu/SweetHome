package com.sweethome.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		return "home";
	}
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)

	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
	try {
		reponse.sendRedirect("/resources/favicon.ico");
	} catch (IOException e) {
		e.printStackTrace();
		}
	}
}
