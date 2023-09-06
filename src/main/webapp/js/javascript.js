function agreeCheck(){
	var agreement = document.querySelector("input[name='agreement1']");
	
	if (!agreement.checked) {
		alert("이용약관과 개인정보취급방침에 동의하셔야 다음 페이지로 이동하실 수 있습니다.");
		return false;
	}else {
		return true;
	}
}

function formValidate(frm){
	if(frm.id.value==""){
		alert("아이디를 입력해주세요.");
		frm.id.focus();
		return false;
	}
	
	if(!(frm.id.value.length>=4 && frm.id.value.length<=12)){
        alert("아이디는 4~12자 사이만 가능합니다.");
        frm.id.value = '';
        frm.id.focus();
        return false;
    }
    
    for(var i=0 ; i<frm.id.value.length ; i++){
        if(!((frm.id.value[i]>='a' && frm.id.value[i]<='z') ||
            (frm.id.value[i]>='A' && frm.id.value[i]<='Z') ||
            (frm.id.value[i]>='0' && frm.id.value[i]<='9'))){
            alert("아이디는 영문 및 숫자의 조합만 가능합니다.");
            frm.id.value='';
            frm.id.focus();
            return false; 
        }
    }
    
    if(frm.pass1.value==''){
        alert("패스워드를 입력해주세요.");
        frm.pass1.focus();
        return false;
    }
    
    if(!(frm.pass1.value.length>=4 && frm.pass1.value.length<=12)){
        alert("패스워드는 4~12자 사이만 가능합니다.");
        frm.pass1.value = '';
        frm.pass1.focus();
        return false;
    }
    
    for(var i=0 ; i<frm.pass1.value.length ; i++){
        if(!((frm.pass1.value[i]>='a' && frm.pass1.value[i]<='z') ||
            (frm.pass1.value[i]>='A' && frm.pass1.value[i]<='Z') ||
            (frm.pass1.value[i]>='0' && frm.pass1.value[i]<='9'))){
            alert("패스워드는 영문 및 숫자의 조합만 가능합니다.");
            frm.pass1.value='';
            frm.pass1.focus();
            return false; 
        }
    }
    
    if(frm.pass2.value==''){
        alert("패스워드 확인을 입력해주세요.");
        frm.pass2.focus();
        return false;
    }
    
    if(frm.pass1.value!=frm.pass2.value){
        alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
        frm.pass1.value = '';
        frm.pass2.value = '';
        frm.pass1.focus();
        return false;
    }
    
     if(frm.name.value==''){
        alert("이름을 입력해주세요.");
        frm.name.focus();
        return false;
    }
    
    if(frm.mobile1.value==''){
        alert("핸드폰 번호를 입력해주세요.");
        frm.mobile1.focus();
        return false;
    }else if(frm.mobile2.value==''){
        alert("핸드폰 번호를 입력해주세요.");
        frm.mobile2.focus();
        return false;
    }else if(frm.mobile3.value==''){
        alert("핸드폰 번호를 입력해주세요.");
        frm.mobile3.focus();
        return false;
    }
    
    if(frm.email_1.value==''){
        alert("이메일을 입력해주세요.");
        frm.email_1.focus();
        return false;
    }else if(frm.email_2.value==''){
        alert("이메일을 입력해주세요.");
        frm.email_2.focus();
        return false;
    }
	
	if(frm.open_email.checked){
		frm.open_email_value.value = 'o';
	}
	
    if(frm.zipcode.value==''){
        alert("우편번호를 입력해주세요.");
        frm.zipcode.focus();
        return false;
    }

    frm.submit();
    
}

function id_check_person(frm){
    if(frm.id.value==''){
        alert("아이디를 입력후 중복확인 해주세요.");
        frm.id.focus();
    }
    else{
		if(!(frm.id.value.length>=4 && frm.id.value.length<=12)){
	        alert("아이디는 4~12자 사이만 가능합니다.");
	        frm.id.value = '';
	        frm.id.focus();
	        return false;
	    }
	    
	    for(var i=0 ; i<frm.id.value.length ; i++){
	        if(!((frm.id.value[i]>='a' && frm.id.value[i]<='z') ||
	            (frm.id.value[i]>='A' && frm.id.value[i]<='Z') ||
	            (frm.id.value[i]>='0' && frm.id.value[i]<='9'))){
	            alert("아이디는 영문 및 숫자의 조합만 가능합니다.");
	            frm.id.value='';
	            frm.id.focus();
	            return false; 
	        }
	    }
        window.open('registIdOverlap.jsp?id=' + frm.id.value, 'idOver', 'width=500,height=300');
        frm.id.readOnly = true;
    }
}

function focusMove(thisObj, nextName, inputLen){
    var strLen = thisObj.value.length;
    if(strLen >= inputLen){
        eval('document.myform.'+ nextName).focus();
    }  
}

function email_input(frm){
    var choiceDomain = frm.last_email_check.value;
    if(choiceDomain==''){
        frm.email_1.value = '';
        frm.email_2.value = '';
        frm.email_1.focus();
    }
    else if(choiceDomain=='직접입력'){
        frm.email_2.value = '';
        frm.email_2.readOnly = false;
        frm.email_2.focus();
    }
    else{
        frm.email_2.value = choiceDomain;
        frm.email_2.readOnly = true;
    }
}   
