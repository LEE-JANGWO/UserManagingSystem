<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
/*
body
{
    width: 700px;
    margin: 100px auto 0 auto;
    font-family: Arial, Helvetica;
    font-size: small;
	background: #444;
}
*/
/* ------------------------------------------------- */
#tabs {
	overflow: hidden;
	width: 1000px;
	margin: 0;
	padding: 0;
	list-style: none;
}

#tabs li {
	float: left;
	margin: 0 .5em 0 0;
}

#tabs a {
	position: relative;
	background: #D3D3D3;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#ddd));
	background-image: -webkit-linear-gradient(top, #fff, #ddd);
	background-image: -moz-linear-gradient(top, #fff, #ddd);
	background-image: -ms-linear-gradient(top, #fff, #ddd);
	background-image: -o-linear-gradient(top, #fff, #ddd);
	background-image: linear-gradient(to bottom, #fff, #ddd);
	padding: .7em 3.5em;
	float: left;
	text-decoration: none;
	color: #444;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .8);
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
	border-radius: 5px 0 0 0;
	-moz-box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
	-webkit-box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
	box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
}

#tabs a:hover, #tabs a:hover::after, #tabs a:focus, #tabs a:focus::after
	{
	background: black;
}

#tabs a:focus {
	outline: 0;
}

#tabs a::after {
	content: '';
	position: absolute;
	z-index: 1;
	top: 0;
	right: -.5em;
	bottom: 0;
	width: 1em;
	background: #ddd;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#ddd));
	background-image: -webkit-linear-gradient(top, #fff, #ddd);
	background-image: -moz-linear-gradient(top, #fff, #ddd);
	background-image: -ms-linear-gradient(top, #fff, #ddd);
	background-image: -o-linear-gradient(top, #fff, #ddd);
	background-image: linear-gradient(to bottom, #fff, #ddd);
	-moz-box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
	-webkit-box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
	-webkit-transform: skew(10deg);
	-moz-transform: skew(10deg);
	-ms-transform: skew(10deg);
	-o-transform: skew(10deg);
	transform: skew(10deg);
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
	border-radius: 0 5px 0 0;
}

#tabs #current a, #tabs #current a::after {
	background: #fff;
	z-index: 3;
}

/* ------------------------------------------------- */
#content {
	background: #fff;
	padding: 2em;
	height: 220px;
	position: relative;
	z-index: 2;
	-moz-border-radius: 0 5px 5px 5px;
	-webkit-border-radius: 0 5px 5px 5px;
	border-radius: 0 5px 5px 5px;
	-moz-box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
	-webkit-box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
	box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
}

#content h2, #content h3, #content p {
	margin: 0 0 15px 0;
}

/* ------------------------------------------------- */
#about {
	color: #D3D3D3;
}

#about a {
	color: #D3D3D3;
}
</style>


<script type="text/javascript">
	//전화번호 입력시 '-' 표시 붙여주기
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
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
	<br>
	<br>
	<div style="border: 1px solid; width: 1030px; padding: 10px;">
		<div style="width: 1030px; height: 60px; background-color: grey;">
			<span
				style="display: inline-block; margin-left: 10px; margin-top: 10px; padding-top: 5px; height: 5px">Menu</span>&nbsp;&nbsp;
			<span><a href="#"
				style="text-decoration: none; color: black; font-weight: bold">회원관리</a></span>
			&nbsp;&nbsp; <span><a href="#"
				style="text-decoration: none; color: black; font-weight: bold;">인사</a></span>
		</div>
	</div>
	<center>
		<h3>인사 기본 상세 보기</h3>
		<br>

		<form action="http://localhost:8080/HRSystem/HR/detail/${userId}/${id}/modify" method="get">
			<input name="id" type="hidden" value="${user.id}" />
			<table style="" border=1>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">사원번호</td>
					<td align="left" width="350" height="30">&nbsp;&nbsp;&nbsp;&nbsp;${hrList.empNum}</td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">주민등록번호</td>
					<td align="center" width="350" height="30"><input type="text"
						name="idNum" style="width: 320px; height: 20px;"
						value="${user.birth}" required /></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">성명</td>
					<td align="left" width="350" height="30">&nbsp;&nbsp;&nbsp;&nbsp;${user.username}</td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">영문성명</td>
					<td align="center" width="350" height="30"><input type="text"
						name="engName" style="width: 320px; height: 20px;" value="${hrList.engName}"/></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">직위/직급</td>
					<td align="center" width="350" height="30"><input type="text"
						name="position" style="width: 320px; height: 20px;"
						value="${hrList.position}" required /></td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">직책</td>
					<td align="center" width="350" height="30"><input type="text"
						name="task" style="width: 320px; height: 20px;" value="${hrList.task}" /></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">부서</td>
					<td align="center" width="350" height="30"><input type="text"
						name="dept" style="width: 320px; height: 20px;"
						value="${hrList.dept}" required /></td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">모바일</td>
					<td align="center" width="350" height="30"><input type="text"
						name="phone" style="width: 320px; height: 20px;"
						value="${hrList.user.phone}" placeholder="010-XXXX-XXXX 형식에 맞게 입력"
						maxlength="13" pattern="(010)-\d{3,4}-\d{4}"
						onKeyup="inputPhoneNumber(this);" required /></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">국적</td>
					<td align="left" width="350" height="30">&nbsp;&nbsp;
						내국인<input type="radio" name="nation" value="true" checked />&nbsp;&nbsp;
						외국인<input type="radio" name="nation" value="false" />
						</td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">근무 구분</td>
					<td align="center" width="350" height="30"><select name="state" style="width: 320px; height: 20px;" required >
					<option value="근무">근무</option>
					<option value="휴직">휴직</option>
					<option value="퇴사">퇴사</option>
					</select></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">입사일</td>
					<td align="center"><input type="date" name="entrance"
						style="width: 320px; height: 20px;" value="${hrList.entrance}"
						placeholder="YYYY-MM-DD로 입력" max="9999-12-31" required /></td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">입사 구분</td>
					<td align="center"><select name="workType" style="width: 320px; height: 20px;" required>
					<option value="정직원">정직원</option>
					<option value="계약직">계약직</option>
					<option value="아르바이트">아르바이트</option>
					</select></td>
				<tr>
					<td align="center" style="background-color: grey;" width="150"
						height="30">퇴사일</td>
					<td align="center"><input type="date" name="quitDate"
						style="width: 320px; height: 20px;" placeholder="YYYY-MM-DD로 입력" max="9999-12-31" /></td>
					<td align="center" style="background-color: grey;" width="150"
						height="30">퇴사 사유</td>
					<td align="center"><input type="text" name="quitReason"
						style="width: 320px; height: 20px;" maxlength="30" /></td>
				<tr>
			</table>
			<br>
			<table style="width:1030px;">
			<tr>
			<td align="left" width="100px"><input type="submit" value="삭제" formaction="http://localhost:8080/HRSystem/HR/detail/${userId}/${id}/deleteInfo"></td>
			<td align="right" width="900px"><input type="submit" value="수정">
			<input type="button" value="목록" onClick="history.back()"></input></td>
			</tr>
			</table>
			</form>


			<ul id="tabs">
				<li><a href="#" title="tab1">개인정보</a></li>
				<li><a href="#" title="tab2">학력사항</a></li>

				<li><a href="#" title="tab3">경력사항</a></li>
				<li><a href="#" title="tab4">자격/면허</a></li>
			</ul>


			<div id="content" style="border: 1px solid black; width:930px">
			
				<div id="tab1"> <!-- 개인정보 -->
				<form action="http://localhost:8080/HRSystem/HR/detail/${userId}/${id}/oneInfoModify" method="GET">
				<input name="id" type="hidden" value="${user.id}" />
					<table style="width:910px;" border=1>
						<tr>
							<td align="center" style="background-color: grey;" width="150"
								height="30">전화번호</td>
							<td align="left" width="350" height="30"><input type="text"
						name="tel" style="width: 320px; height: 20px;"
						value="${user.phone}" placeholder="010-XXXX-XXXX 형식에 맞게 입력"
						maxlength="13" pattern="(010)-\d{3,4}-\d{4}"
						onKeyup="inputPhoneNumber(this);"  /></td>
							<td align="center" style="background-color: grey;" width="150"
								height="30">핸드폰번호</td>
							<td align="left" width="350" height="30"><input type="text"
						name="phone" style="width: 320px; height: 20px;"
						value="${user.phone}" placeholder="010-XXXX-XXXX 형식에 맞게 입력"
						maxlength="13" pattern="(010)-\d{3,4}-\d{4}"
						onKeyup="inputPhoneNumber(this);" required /></td>
						</tr>
						<tr>
							<td align="center" style="background-color: grey;" width="150"
								height="30">E-mail</td>
							<td align="left" width="350" height="30"><input type="email" name="email" style="width:320px;height:20px;" value="${user.email}" maxlength="30" /></td>
							<td align="center" bgcolor='grey'>성별</td>
					<td align="left" width="350" height="30">
					남성<input type="radio" name="sex" value="true" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					여성<input type="radio" name="sex" value="false"/></td>
						</tr>
					</table>
					
					<table style="width:910px">
					<tr>
					<td align="right">
						<input type="button" value="수정" onclick="location.href='http://localhost:8080/HRSystem/HR/detail/${user.userId}/${user.id}/oneInfoModify'">
					</td>
					</tr>
					</table>
					</form>
				</div>

				<div id="tab2">  <!-- 학력사항 -->
					<table style="width:910px" border=1>
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30"></td>
							<td align="center" style="background-color: grey;" width="100" height="30"></td>
							<td align="center" style="background-color: grey;" width="150" height="30">학교명</td>
							<td align="center" style="background-color: grey;" width="150" height="30">전공</td>
							<td align="center" style="background-color: grey;" width="150" height="30">학위</td>
							<td align="center" style="background-color: grey;" width="180" height="30">입혁년월</td>
							<td align="center" style="background-color: grey;" width="180" height="30">졸업연도</td>
							<td align="center" style="background-color: grey;" width="180" height="30">소재지</td>
						</tr>
						<c:forEach var="EQs" items="${eqList}">
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30">${EQs.id}</td>
							<td align="center" width="100" height="30"></td>
							<td align="center" width="150" height="30">${EQs.schoolName}</td>
							<td align="center" width="150" height="30">${EQs.major}</td>
							<td align="center" width="150" height="30">${EQs.degree}</td>
							<td align="center" width="180" height="30">${EQs.entranceDate}</td>
							<td align="center" width="180" height="30">${EQs.graduatedDate}</td>
							<td align="center" width="180" height="30">${EQs.location}</td>
						</tr>
						</c:forEach>
					</table>
					
					<table style="width:910px">
					<tr>
					<td align="right">
						<input type="button" value="추가" onclick="location.href='http://localhost:8080/HRSystem/HR/detail/${hrList.id}/EQAdd'">
					</td>
					</tr>
					</table>
				</div>

				<div id="tab3"> <!-- 경력사항 -->
						<table style="width:910px" border=1>
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30"></td>
							<td align="center" style="background-color: grey;" width="100" height="30"></td>
							<td align="center" style="background-color: grey;" width="150" height="30">회사명</td>
							<td align="center" style="background-color: grey;" width="150" height="30">직위</td>
							<td align="center" style="background-color: grey;" width="150" height="30">부서</td>
							<td align="center" style="background-color: grey;" width="180" height="30">담당업무</td>
							<td align="center" style="background-color: grey;" width="180" height="30">입사년월</td>
							<td align="center" style="background-color: grey;" width="180" height="30">퇴사년월</td>
						</tr>
						<c:forEach var="pe" items="${peList}">
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30">${pe.id}</td>
							<td align="center" width="100" height="30"></td>
							<td align="center" width="150" height="30">${pe.Cname}</td>
							<td align="center" width="150" height="30">${pe.position}</td>
							<td align="center" width="150" height="30">${pe.department}</td>
							<td align="center" width="180" height="30">${pe.task}</td>
							<td align="center" width="180" height="30">${pe.entranceDate}</td>
							<td align="center" width="180" height="30">${pe.quitDate}</td>
						</tr>
						</c:forEach>
					</table>
					
					<table style="width:910px">
					<tr>
					<td align="right">
						<input type="button" value="추가" onclick="location.href='http://localhost:8080/HRSystem/HR/detail/${user.userId}/PEAdd'">
					</td>
					</tr>
					</table>
					
				</div>

				<div id="tab4"> <!-- 자격/면허 -->
						<table style="width:910px" border=1>
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30"></td>
							<td align="center" style="background-color: grey;" width="100" height="30"></td>
							<td align="center" style="background-color: grey;" width="150" height="30">자격/면허명</td>
							<td align="center" style="background-color: grey;" width="150" height="30">자격/면허증번호</td>
							<td align="center" style="background-color: grey;" width="150" height="30">발행기관</td>
							<td align="center" style="background-color: grey;" width="180" height="30">취득년월</td>
							<td align="center" style="background-color: grey;" width="180" height="30">만기년월</td>
						</tr>
						<c:forEach var="lic" items="${licList}">
						<tr>
							<td align="center" style="background-color: grey;" width="50" height="30">${lic.id}</td>
							<td align="center" width="100" height="30"></td>
							<td align="center" width="150" height="30">${lic.license}</td>
							<td align="center" width="150" height="30">${lic.licenseNum}</td>
							<td align="center" width="150" height="30">${lic.institution}</td>
							<td align="center" width="180" height="30">${lic.getDate}</td>
							<td align="center" width="180" height="30">${lic.expiration}</td>
						</tr>
						</c:forEach>
					</table>
					
					<table style="width:910px">
					<tr>
					<td align="right">
						<input type="button" value="추가" onclick="location.href='http://localhost:8080/HRSystem/HR/detail/${user.userId}/LICAdd'">
					</td>
					</tr>
					</table>
					
				</div>
			</div>
		
</body>


<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#content div").hide(); // Initially hide all content
		$("#tabs li:first").attr("id", "current"); // Activate first tab
		$("#content div:first").fadeIn(); // Show first tab content

		$('#tabs a').click(function(e) {
			e.preventDefault();
			$("#content div").hide(); //Hide all content
			$("#tabs li").attr("id", ""); //Reset id's
			$(this).parent().attr("id", "current"); // Activate this
			$('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
		});
	})();
</script>
</html>
