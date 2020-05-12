<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

function goBack() {

	window.history.back();
}

// 전화번호 입력시 '-' 표시 붙여주기
function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

function chkForm()
       {
        var passwd = document.getElementById("passwd").value;
        var passwdchk = document.getElementById("passwdchk").value;
        var userForm = document.getElementById("userForm");

           if ( passwd == passwdchk)
             {
        	   alert("비밀번호가 일치합니다");
        	   return true;
             }
    
           else
             {
                  alert("비밀번호가 일치하지 않습니다");
                  userForm.passwdchk.focus();
                  return false;
             }
            
       }
</script>

<!-- 
function validate(element,min,max) {              
    var len = element.value.length ;
  if ((len<min)||(len>max)) {
          alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다' ) ;
          element.style.borderColor="#FF0000";
          // 입력 필드의 경계선을 빨강으로 설정함
          element.focus();
          // 입력 필드로 포커스를 이동
  } 
   else  {
          element.style.borderColor="#ffffff";
          // 입력 필드의 경계선을 흰색으로 설정
 	}
}; 
 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 추가</title>
</head>
<body>

<div>
 <table border="1" style="width:1050px">
 <tr>
 	<td>Site name</td>
 	<td></td>
 	<td>Writer</td>
 	<td></td>
 	<td>Date</td>
 	<td></td>
 	<td>Version</td>
 	<td>V 1.0</td>
 	<tr>
 	<td>Step ID</td>
 	<td>회원 관리</td>
 	<td>Scene</td>
 	<td>회원 관리 화면</td>
 	<td>Part</td>
 	<td>User Page</td>
 	<td>Page</td>
 	<td></td>
 	<tr>
 </table>
</div>
<br><br>

<div style="border: 1px solid; width:1030px; padding:10px;">
<div style="width:1030px; height:60px; background-color:grey;">
 <span style="display:inline-block; margin-left:10px; margin-top:10px; padding-top:5px; height:5px">Menu</span>&nbsp;&nbsp;
 <span><a href="#" style="text-decoration:none; color:black; font-weight:bold">회원관리</a></span>&nbsp;&nbsp;
 <span><a href="#" style="text-decoration:none; color:black; font-weight:bold;">인사</a></span>
</div>

	<center>
		<h3>회원 추가</h3>
		<br>

		<form action="register_ok" method="post" id="userForm" onsubmit="return chkForm()">
			<table style="cellpadding=0 cellspacing=0 width=500" border=1>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">아이디</td>
					<td align="center" width="350" height="30"><input type="text" name="userId" style="width:320px;height:20px;" placeholder="10자이하 입력" maxlength="10" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">비밀번호</td>
					<td align="center"><input type="password" class="pw" id="passwd" name="passwd" width="350" style="width:320px; height:20px;" placeholder="글자,문자로 8~12자 사이" maxlength="12" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">비밀번호확인</td>
					<td align="center" width="350" height="30"><input type="password" class="pw" id="passwdchk"  name="passwdchk" style="width:320px;height:20px;" placeholder="비밀번호확인" maxlength="12" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">이름</td>
					<td align="center" width="350" height="30"><input type="text" name="username" style="width:320px;height:20px;" maxlength="30" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">생년월일</td>
					<td align="center" width="350" height="30"><input type="date" id="birth" name="birth" style="width:320px;height:20px;" placeholder="YYYY-MM-DD로 입력" max="9999-12-31" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">연락처</td>
					<td align="center" width="350" height="30"><input type="text" name="phone" style="width:320px;height:20px;" placeholder="010-XXXX-XXXX 형식에 맞게 입력" maxlength="13" pattern="(010)-\d{3,4}-\d{4}" onKeyup="inputPhoneNumber(this);" required /></td>
				<tr>
					<td align="center"style="background-color:grey;" width="150" height="30">이메일</td>
					<td align="center"><input type="email" name="email" style="width:320px;height:20px;" maxlength="30" /></td>
				<tr>
					<td align="center" bgcolor='grey'>성별</td>
					<td align="left" width="350" height="30">
					남성<input type="radio" name="sex" value="true" checked />
					여성<input type="radio" name="sex" value="false"/></td>
				
			</table>
			<br>
			<td style="colspan:2">
			<input type="submit" id="registerUser" value="회원등록" />&nbsp;&nbsp;&nbsp;
			<input type="button" value="목록" onClick="goBack();" />
			</td>
		</form>
		
</body>
</html>
