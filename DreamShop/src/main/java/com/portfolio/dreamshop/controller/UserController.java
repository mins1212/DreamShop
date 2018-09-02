package com.portfolio.dreamshop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.dreamshop.service.UserService;

@Controller
public class UserController {
	
	@Resource
	UserService userService;
	
	@RequestMapping(value="/")
	public String test() {
		String a = userService.getUser();
		ModelAndView mv = new ModelAndView();
		mv.addObject("a",a);
		return "tiles/test";
	}
}