<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	StringBuffer xmlData = new StringBuffer();
	try	{
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/ubuntu");
		
		conn = dataSource.getConnection();
		
		String sql = "select * from book";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		xmlData.append( "<books>" );
		while( rs.next())	{
			xmlData.append("<book>");
			xmlData.append("<name>").append(rs.getString("name")).append("</name>");
			xmlData.append("<publisher>").append(rs.getString("publisher")).append("</publisher>");
			xmlData.append("<author>").append(rs.getString("author")).append("</author>");
			xmlData.append("<price>").append(rs.getString("price")).append("</price>");
			
			xmlData.append("</book>");
		}
		xmlData.append("</books>");
		
	}catch(NamingException e)	{
		System.out.println("에러 : " + e.getMessage());
		
	}catch(SQLException e)	{
		System.out.println("에러 : " + e.getMessage());
		
	}finally	{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	} 
		
	out.println(xmlData);
	
%>

