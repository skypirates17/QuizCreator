package com.test.quiz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.quiz.service.IQuizService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:dispatcher-servlet.xml"})
public class TestQuizService {
	
	private final Logger logger = Logger.getLogger(TestQuizService.class);
		
	@Autowired
	private IQuizService quizService;

	@Test
	public void testSaveQuestion() {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("QUESTION", "sample question"); 
		paramMap.put("CATEGORY", "1"); 
		paramMap.put("SUB_CATEGORY", "2"); 
		paramMap.put("ANSWER_EXPLAINATION", "sample explaination");
		
		paramMap.put("CHOICE_1", "zzzzz");
		paramMap.put("CHOICE_2", "xxxxx");
		paramMap.put("CHOICE_3", "vvvvv");
		paramMap.put("CHOICE_4", "wwwwww");
		paramMap.put("CHOICE_5", "yyyyy");
		
		paramMap.put("CORRECT_ANSWER", "CHOICE_5");
		quizService.saveQuestion(paramMap);
	}
	
}
