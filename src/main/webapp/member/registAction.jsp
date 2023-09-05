<%@page import="regist.RegistDAO"%>
<%@page import="regist.RegistDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass1");
String name = request.getParameter("name");
String tel = request.getParameter("tel1") + "-" + 
			 request.getParameter("tel2") + "-" + 
			 request.getParameter("tel3");
String mobile = request.getParameter("mobile1") + "-" + 
				request.getParameter("mobile2") + "-" + 
				request.getParameter("mobile3");
String email = request.getParameter("email_1") + "@" + 
			   request.getParameter("email_2");
String mailing = request.getParameter("mailing");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

RegistDTO dto = new RegistDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setMailing(mailing);
dto.setZipcode(zipcode);
dto.setAddr1(addr1);
dto.setAddr2(addr2);

RegistDAO  dao = new RegistDAO(application);
int result = dao.registInsert(dto);
if(result == 1){
	out.println("입력성공");
}else{
	out.println("입력실패");
}
%>