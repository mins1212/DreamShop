package com.portfolio.dreamshop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.dreamshop.service.UserService;
@Controller
public class UserController {
	
	@Resource
	UserService userService;
	
	@RequestMapping(value="/")
	public String test(Model model) {
		String asd = userService.getUser();
		model.addAttribute("asd", asd);
		
		return "tiles/test";
	}
}