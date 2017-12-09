package com.quiz.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.quiz.utils.JSONParser;
import com.quiz.utils.Util;
import com.google.gson.Gson;

@Controller
public class ApplicationController {

	private final static Logger logger = Logger.getLogger(ApplicationController.class);
	
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.debug("START===========");
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = { "/saveQuestion" }, method = { RequestMethod.POST })
	@ResponseBody
	public String sendMessage(HttpServletRequest request, HttpServletResponse response, @RequestParam String form) {
		Map<String, Object> display = new HashMap<>();
		Map<String, Object> quizForm = JSONParser.getQuizForm(form);

		
		
		return new Gson().toJson(display);
	}
}
