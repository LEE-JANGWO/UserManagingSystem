<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">

//전화번호 입력시 '-' 표시 붙여주기
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

</script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세</title>
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
		<h3>회원 상세 보기</h3>
		<br>

		<form action="http://localhost:8080/HRSystem/user/modify" method="post">
		<input name="id" type="hidden" value="${user.id}" />
			<table style="cellpadding=0 cellspacing=0 width=500" border=1>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">아이디</td>
					<td align="left" width="350" height="30">&nbsp;&nbsp;&nbsp;&nbsp;${user.userId}</td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">비멀번호</td>
					<td align="center" width="350" height="30">
					<input type="password" name="userId" style="width:320px;height:20px;background-color:grey;" value="${user.passwd}" readonly/></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">이름</td>
					<td align="center" width="350" height="30"><input type="text" name="username" style="width:320px;height:20px;" value="${user.username}" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">생년월일</td>
					<td align="center" width="350" height="30"><input type="date" name="birth" style="width:320px;height:20px;" value="${user.birth}" placeholder="YYYY-MM-DD로 입력" max="9999-12-31" required /></td>
				<tr>
					<td align="center" style="background-color:grey;" width="150" height="30">연락처</td>
					<td align="center" width="350" height="30"><input type="text" name="phone" style="width:320px;height:20px;" value="${user.phone}" placeholder="010-XXXX-XXXX 형식에 맞게 입력" maxlength="13" pattern="(010)-\d{3,4}-\d{4}" onKeyup="inputPhoneNumber(this);" required /></td>
				<tr>
					<td align="center"style="background-color:grey;" width="150" height="30">이메일</td>
					<td align="center"><input type="email" name="email" style="width:320px;height:20px;" value="${user.email}" maxlength="30" /></td>
				<tr>
					<td align="center" bgcolor='grey'>성별</td>
					<td align="center" width="350" height="30">
					남성<input type="radio" name="sex" value="true" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					여성<input type="radio" name="sex" value="false"/></td>
			</table>
			<br>
			<input type="submit" value="수정" ></input>&nbsp;&nbsp;
			<input type="submit" value="삭제" formaction="http://localhost:8080/HRSystem/user/deleteUser"></input>&nbsp;&nbsp;
			<input type="button" value="목록" onClick="history.back()"></input>
			</form>
</body>
</html>
