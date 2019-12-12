<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>

<style type="text/css">
	table{border: 1px solid gray; margin: auto; height: 250pt;}
</style>
</head>
<body>
	<jsp:include page="include.jsp"></jsp:include>
	<div align="center"><h1>MyPage</h1></div>
	<table>
		<tr>
			<td style="font-size: 40pt;" width="350px;" colspan="2">개인정보 수정</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">비밀번호&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			<td><a href="${pageContext.request.contextPath }/member/passwordChange" >비밀번호 변경하기</a></td>
		</tr>
		<tr>
			<td style="font-weight: bold;">전화번호&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			<td><a href="" >핸드폰번호 변경하기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<td style="font-size: 40pt;" width="350px;">활동기록 보기</td>
		</tr>
		<tr>
			<td style="font-weight: bold;"><br />내가 올린 게시물 확인 및 삭제 가능</td>
		</tr>
		<tr>
			<td><a href="" class="btn btn-secondary">확인하기</a></td>
		</tr>
	</table>








</body>
</html>