package com.portfolio.dreamshop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.portfolio.dreamshop.service.UserService;
@Controller
public class UserController {
	
	@Resource
	UserService userService;
	
	@RequestMapping(value="/")
	public String test(Model model) {
		String asd = userService.getUser();
		model.addAttribute("asd", asd);
		
		return "main/main";
	}
}