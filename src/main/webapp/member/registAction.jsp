<%@page import="utils.JSFunction"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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
String mailing = request.getParameter("open_email_value");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

MemberDTO dto = new MemberDTO();
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

MemberDAO  dao = new MemberDAO(application);
int result = dao.registInsert(dto);
if(result == 1){
	out.println("<script>alert('회원가입에 성공하셧습니다.'); location.href='login.jsp';</script>");
}else{
	JSFunction.alertBack("회원가입에 실패하셧습니다.", out);
}
%>