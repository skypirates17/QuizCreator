package com.quiz.mapper;

import java.util.Map;

public interface QuizMapper {

	int insertQuestion(Map<String, Object> paramMap);
	
	void insertChoices(Map<String, Object> paramMap);
}
