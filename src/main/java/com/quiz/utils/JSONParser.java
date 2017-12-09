package com.quiz.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class JSONParser {

	private static String sample = "";
	// fields
	private static final String NAME = "name";
	private static final String VALUE = "value";
	private static final String[] quizFields 
			= new String[] {"CATEGORY", "SUB_CATEGORY", "QUESTION", "CHOICE_1", "CHOICE_1", "CHOICE_1", "CHOICE_1", "CHOICE_1", "CORRECT_ANSWER", "ANSWER_EXPLAINATION"};
	
	private static final String[] playfields = null;
	
	public static Map<String, Object> getQuizForm(String strJson) {
		Map<String, Object> map = new HashMap<>();
		List<String> answer = new ArrayList<String>();
		
		JSONArray jsonArr = new JSONArray(strJson);
		Iterator<Object> iterator = jsonArr.iterator();
		while (iterator.hasNext()) {
			JSONObject jsonObject = (JSONObject) iterator.next();
			String fieldName = (String) jsonObject.get(NAME);
			String value = (String) jsonObject.get(VALUE);
			map.put(fieldName, value);
		}
		return map;
	}
}
