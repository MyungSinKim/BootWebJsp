package com.example.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.web.domain.SearchForm;

@Controller
public class HelloController {

	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String hello(ModelMap model) {
		return "index.jsp";
	}
	@RequestMapping(value="/calendar.do", method=RequestMethod.GET)
	public String calendar(ModelMap model) {
		return "calendar.jsp";
	}
	@RequestMapping(value="/chartLine.do", method=RequestMethod.GET)
	public String chartLine(ModelMap model
			,@ModelAttribute("form") SearchForm searchForm) {
		return "chartLine.jsp";
	}
}
