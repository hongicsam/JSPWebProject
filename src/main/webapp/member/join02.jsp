<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script type="text/javascript" src="../js/javascript.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function zipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            
            let frm = document.myform;
            frm.zipcode.value = data.zonecode;
            frm.addr1.value = data.address;
            frm.addr2.focus();
        }
    }).open();
}
</script>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<form name="myform" action="registAction.jsp" method="post" onsubmit="retrun formValidate(this);">
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id"  value="" class="join_input" />&nbsp;<a onclick="id_check_person(this.form);" style="cursor:hand;"><img src="../images/btn_idcheck.gif" alt="중복확인"/></a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass1" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" onkeyup="focusMove(this,'tel2',3);"/>&nbsp;-&nbsp;
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" onkeyup="focusMove(this,'tel3',4);"/>&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" onkeyup="focusMove(this,'mobile2',3);"/>&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" onkeyup="focusMove(this,'mobile3',4);"/>&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
							<input type="text" name="email_1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
							<input type="text" name="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
							<select name="last_email_check" onChange="email_input(this.form);" class="pass" id="last_email_check2" >
								<option selected="" value="">선택해주세요</option>
								<option value="직접입력" >직접입력</option>
								<option value="hanmail.net" >hanmail.net</option>
								<option value="nate.com" >nate.com</option>
								<option value="naver.com" >naver.com</option>
								<option value="yahoo.com" >yahoo.com</option>
								<option value="daum.net" >daum.net</option>
								<option value="gmail.com" >gmail.com</option>
							</select>
							<input type="checkbox" name="open_email" value="1">
							<span>이메일 수신동의</span>
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zipcode" value=""  class="join_input" style="width:50px;" />
						<a href="javascript:void(0);" title="새 창으로 열림" onclick="zipFind();" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>
				<p style="text-align:center; margin-bottom:20px"><a onclick='formValidate(document.querySelector("form"));' href="javascript:void(0);<!-- join02.jsp -->"><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
				</form>	
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
