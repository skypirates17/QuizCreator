package com.quiz.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.quiz.service.IQuizService;
import com.quiz.utils.JSONParser;
import com.quiz.utils.Util;
import com.google.gson.Gson;

// jangolluan
@Controller
public class ApplicationController {

	private final static Logger logger = Logger.getLogger(ApplicationController.class);
	
	@Autowired
	private IQuizService quizService;
	
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
		
		String category = Util.toString(quizForm.get("CATEGORY"));
		String question = Util.toString(quizForm.get("QUESTION"));
		String correctAnswer = Util.toString(quizForm.get("CORRECT_ANSWER"));
		
		String title = "Required Fields";
		String message = "";
		int errortype = 3;
		if (Util.isNullOrEmpty(category)) {
			message = "Please Select Category.";
		} else if (Util.isNullOrEmpty(question)) {
			message = "Please Input Questions.";
		} else {
			// check if there are choices entered. There should be at least 2.
			int choicesCount = 0;
			boolean choicesExceedLength = false;
			for(int i=1; i<=5; i++){
				String choiceValue = Util.toString(quizForm.get("CHOICE_"+i));
				if (!Util.isNullOrEmpty(choiceValue)) {
					choicesCount++;
				}
				if (Util.toString(choiceValue, true).length() > 250) {
					choicesExceedLength= true;
				}
			}
			
			if (choicesCount <= 1) {
				message = "Choices should be at least 2.";
			} else if (choicesExceedLength) {
				message = "Each choices should be at least 250 characters.";
			} else if (Util.isNullOrEmpty(correctAnswer)) {
				message = "Please Select the Correct Answer.";
			} else if (Util.isNullOrEmpty(Util.toString(quizForm.get(correctAnswer)))) {
				message = "Selected correct answer has no values.";
			} else {
				try {
					title = "Success";
					message = "Question successfully saved.";
					errortype = 2;
					quizService.saveQuestion(quizForm);
				} catch (Exception e) {
					title = "Error!";
					message = "Problem encountered while sending emails.";
					errortype = 4;
					logger.error("",e);
				}		
			}
		}
		
		display.put("TITLE", title);
		display.put("MESSAGE", message);
		display.put("ERRORTYPE", errortype);
		return new Gson().toJson(display);
	}
}
