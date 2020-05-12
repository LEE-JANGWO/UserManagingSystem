<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">

function chkCheckedBoxes(chkForm) {

	var chk = document.userCheck;
	var checked_items = 0;

	for(i=0; i < chk.elements.length; i++) {
		
    if (theForm.chkBox.checked[i] == false) {
      alert ('하나 이상을 선택해주세요');
      return false;
    } else{
        alert('삭제하시겠습니까');
       return true;
    }
}
  
}
</script> 

<style>
ul {
	list-style:none;
	float:left;
	display:inline;
}
ul li {
	float:left;
}
ul li a {
	float:left;
	padding:4px;
	margin-right:3px;
	width:15px;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
}
ul li a:hover, ul li a:focus {
	color:#fff;
	border:1px solid #000000;
	background-color:#D3D3D3;
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

<link rel="stylesheet"
	href="<c:url value= "/resources/styleSheet/css/bootstrap.min.css" />">
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
 <span><a href="/HRSystem/user/list/pageNum=1" style="text-decoration:none; color:black; font-weight:bold">회원관리</a></span>&nbsp;&nbsp;
 <span><a href="/HRSystem/HR/list/pageNum=1" style="text-decoration:none; color:black; font-weight:bold;">인사</a></span>
</div>
<br>
<div style="border: 1px solid; padding:0;">
	<span style="display:inline-block; margin-left:10px; padding-top:8px; font-weight:bold;">회원관리</span>
	<hr align="left" style="width:50%">
	<div>
	<form action="http://localhost:8080/HRSystem/user/list/search" method="post" >
	<table border='1' style="width:1000px">
	<tr>
		<td style="background-color:grey; margin:0; padding:0; width:100px; font-weight:bold" align="center">회원 조회</td>
		<td style="width:150px">
		<select name="search" style="width:150px;margin-right:10px">
  		<option disabled>조회 항목 선택</option>
    	<option value="userId">아이디</option>
   	    <option value="username">이름</option>
    	<option value="email">이메일</option>
		</select>
		</td>
		<td><input name="keyword" type="text"placeholder="조회할 정보를 입력하세요" style=width:400px;></td>
		<tr>
		</table>
		<table width="1000px" >
		<tr>
		<td style="padding-left:10px; font-weight:bold"><h4>회원정보 리스트</h4></td>
		<td align="right">
		<input type="submit" id="btnSearch" id="btnSearch" value="조회" />
		</td>
		</table>
	</form>

	<form action = "http://localhost:8080/HRSystem/user/delChk" method="post" name="userCheck" onsubmit="return chkCheckedBoxes(this)"> 
	<table id="userTbl" border="1" cellpadding="0" cellspacing="0" width="1000">
		<thead>
			<tr>
				<th bgcolor="grey" width="30" style="text-align: center"><input
					type="checkbox" id="parent" onClick="checkAll()" /></th>
				<th class="text-center" bgcolor="grey" width="30"></th>
				<th class="text-center" bgcolor="grey" width="150">아이디</th>
				<th class="text-center" bgcolor="grey" width="100">이름</th>
				<th class="text-center" bgcolor="grey" width="150">이메일</th>
				<th class="text-center" bgcolor="grey" width="200">연락처</th>
				<th class="text-center" bgcolor="grey" width="150">생년월일</th>
				<th class="text-center" bgcolor="grey" width="100">성별</th>
				<th class="text-center" bgcolor="grey" width="200">가입 일자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td class="chk" align="center" width="30"><input type="checkbox"
						id="child_chkbx"  name="chkBox" value="${user.id}"/></td>
					<td align="center" width="30">${user.id}</td>
					<td align="center" width="150" id="userId"
						onclick="location.href='http://localhost:8080/HRSystem/user/oneView/${user.userId}'"
						style="cursor: pointer">${user.userId}</td>
					<td align="center" width="100">${user.username}</td>
					<td align="center" width="150">${user.email}</td>
					<td align="center" width="200">${user.phone}</td>
					<td align="center" width="150">${user.birth}</td>
					<td align="center" width="100">
					<c:choose>
						<c:when test="${user.sex eq true}">
								<c:out value="남" />
						</c:when>
						<c:when test="${user.sex eq false}">
								<c:out value="여" />
						</c:when>
					</c:choose>
					</td>
					<td align="center" width="200">${user.joindate}</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	
	<table style="width:1000px">
	<tr>
	<td>
		<input type="submit" id="chkdel"  value="선택삭제"></input>
		<input type="button" onclick="location.href='http://localhost:8080/HRSystem/user/register'" value="회원추가"></input>
	</td>
	<!-- 페이지 번호 출력 -->
	<td style="align:right">
	<ul>
	<li><a href="pageNum=1">&#60;&#60;</a></li>
	<li><a href="pageNum=${before}">&#60;</a></li>
    <li><c:forEach begin="${pageBegin}" end="${pageEnd}" var="i">
    <a href="pageNum=${i}">${i}</a>
	</c:forEach></li>
   	<li><a href="pageNum=${next}">&#62;</a></li>
    <li><a href="pageNum=${fin}">&#62;&#62;</a></li>
   	</ul>
	</td>
</table>
</form>
</div>
</div>
</div>


	<script src="../../resources/styleSheet/css/js/jquery3-1.1.min.js"></script>
	<script src="../../resources/styleSheet/css/js/bootstrap.min.js"></script>

	<script>
	// 전체 선택 / 해제
		function checkAll() {

			console.log('checkAll');

			
			var parent = document.getElementById("parent");
			var input = document.getElementsByTagName("input");
			
			if (parent.checked === true) {
				for (var i = 0; i < input.length; i++) {

					console.log(input[i]);
					
					if(input[i].type == "checkbox" && input[i].id == "child_chkbx"  && input[i].checked == false){

						input[i].checked = true;
					}
				}
			}
			else if (parent.checked === false) {
				for (var i = 0; i < input.length; i++) {
					if(input[i].type == "checkbox" && input[i].id == "child_chkbx"  && input[i].checked == true){

						input[i].checked = false;
					}
				}
			}
		}
	</script>
</body>
</html>

