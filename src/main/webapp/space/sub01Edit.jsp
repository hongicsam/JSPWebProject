<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP최상단에 인클루드 하여 로그인 정보가 없다면 즉시
로그인 페이지로 이동시킨다.  -->
<%@ include file="./IsLoggedIn.jsp"%>  

<%
//게시판 테이블 파라미터 받아오기
String num = request.getParameter("num");

Map<String, Object> param = new HashMap<String, Object>();
param.put("tname", tname);

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num, param);
String sessionId = session.getAttribute("UserId").toString();

String tname = request.getParameter("tname");

if (!sessionId.equals(dto.getId())) {  
	//작성자가 아니라면 진입할 수 없도록 하고 뒤로 이동한다. 
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}

dao.close();
%>
    
<%@ include file="../include/global_head.jsp" %>
<script type="text/javascript">
/* 글쓰기 페이지에서 제목과 내용이 입력되었는지 검증하는 JS코드 */
function validateForm(form) { 
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항<p>
				</div>
				<div>
<!-- 게시판 들어가는 부분s -->
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">

<input type="hidden" name="tname" value="<%=tname %>" />
      
    <table class="table table-bordered" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" value="<%= dto.getTitle() %>"/>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%= dto.getContent() %></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" onclick="location.href='sub01View.jsp';">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='sub01List.jsp';">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
<!-- 게시판 들어가는 부분e -->
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>