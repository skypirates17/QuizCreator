package com.quiz.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quiz.mapper.QuizMapper;
import com.quiz.service.IQuizService;
import com.quiz.utils.Util;

@Transactional
@Service
public class QuizService implements IQuizService{

	private final static Logger logger = Logger.getLogger(QuizService.class);
	
	@Autowired
	private QuizMapper quizMapper;
	
	@Override
	public void saveQuestion(Map<String, Object> paramMap) {
		// save question
		paramMap.put("CREATE_DATE", new Date());
		int questionId = quizMapper.insertQuestion(paramMap);
		
		// save choices
		logger.debug("ID is ====>" + questionId);
		paramMap.put("QUESTION_ID", questionId);
		List<Map<String, Object>> lstChoices = new ArrayList<>();
		for (int i=1; i<=5; i++) {
			Map<String, Object> map = new HashMap<>();
			
			String choiceValue = Util.toString(paramMap.get("CHOICE_" + i));
			if (Util.isNullOrEmpty(choiceValue)) {
				continue;
			}
			map.put("CHOICE", choiceValue);
			
			// check if the correct answer
			String strCorrectAnswer = String.valueOf(paramMap.get("CORRECT_ANSWER"));
			map.put("CORRECT_ANSWER", ("CHOICE_" + i).equalsIgnoreCase(strCorrectAnswer));
			
			lstChoices.add(map);
		}
		paramMap.put("LIST_CHOICES", lstChoices);
		quizMapper.insertChoices(paramMap);
	}

}
