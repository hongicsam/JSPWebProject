<%@page import="SUAProject.SUAProjectDAO"%>
<%@page import="SUAProject.SUAProjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String id = request.getParameter("id");
String pass = request.getParameter("pass1");
String name = request.getParameter("name");
String tel = request.getParameter("mobile1") + "-" + 
			 request.getParameter("mobile2") + "-" + 
			 request.getParameter("mobile3");
String mobile = request.getParameter("mobile1") + "-" + 
			 	request.getParameter("mobile2") + "-" + 
			 	request.getParameter("mobile3");
String email = request.getParameter("email1") + "@" + 
			   request.getParameter("email2");
String mailing = request.getParameter("mailing");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

String sms = request.getParameter("sms");

//DTO객체에 저장하기
SUAProjectDTO dto = new SUAProjectDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setEmail(email);
dto.setMailing(mailing);
dto.setZipcode(zipcode);
dto.setAddr1(addr1);
dto.setAddr2(addr2);

//DAO객체생성 및 insert처리
SUAProjectDAO dao = new SUAProjectDAO(application);
int result = dao.registInsert(dto);
if(result == 1){
	out.println("입력성공");
}else{
	out.println("입력실패");
}
%>