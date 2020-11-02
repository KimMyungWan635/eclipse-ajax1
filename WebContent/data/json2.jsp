<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>


<%
	JSONArray jsonArray = new JSONArray();

	JSONObject obj1 = new JSONObject();
	obj1.put("name", "name111111111");
	obj1.put("publisher", "pyblis1111");
	obj1.put("author", "author11111");
	obj1.put("price", "price11111111");
	
	JSONObject obj2 = new JSONObject();
	obj2.put("name", "name2");
	obj2.put("publisher", "pyblis2");
	obj2.put("author", "author2");
	obj2.put("price", "price2");
		
	JSONObject obj3 = new JSONObject();
	obj3.put("name", "name3");
	obj3.put("publisher", "pyblis3");
	obj3.put("author", "author3");
	obj3.put("price", "price3");
		
	JSONObject obj4 = new JSONObject();
	obj4.put("name", "name4");
	obj4.put("publisher", "pyblis4");
	obj4.put("author", "author4");
	obj4.put("price", "price4");
	
	
	jsonArray.add(obj1);
	jsonArray.add(obj2);
	jsonArray.add(obj3);
	jsonArray.add(obj4);
	
	out.println(jsonArray);
	
	
	
%>