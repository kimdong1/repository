<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- STYLE CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

<!-- 사용자 유효성검사 자바스크립트 선언 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
<script type="text/javascript" >
	$(function(){
		
	});
	
	function formCheck(){

		var data = $("#email").val();
		if(data.trim().length==0 && !data){
			alert('이메일은 반드시 입력해야 합니다.');
			$("#email").val("");
			$("#email").focus();
			return false;
		}
		if(!validateEmail(data)){
			alert('이메일형식이 맞지 않습니다.');
			$("#email").val("");
			$("#email").focus();
			return false;
		}

		var data = $("#phone").val();
		if(!data){
			alert('전화번호는 반드시 입력해야 합니다.');
			$("#phone").focus();
			return false;
		}
		if(!validatePhone(data)){
			alert('전화번호 형식이 올바르지 않습니다.');
			$("#phone").val("");
			$("#phone").focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>

	<div class="wrapper" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg-registration-form-1.jpg');">
		<div class="inner">
			<div class="image-holder">
				<img src="${pageContext.request.contextPath }/resources/images/registration-form-1.jpg" alt="">
			</div>
			<form action="${pageContext.request.contextPath }/member/passwordSearchOk" method="POST" onsubmit="return formCheck();">
				<h3>Registration Form</h3>

				<div class="form-wrapper">
					<input type="text" placeholder="이메일을 입력하세요" class="form-control" name="email" id="email">
					<i class="zmdi zmdi-account"></i>
				</div>
				<div class="form-wrapper">
					<input type="text" placeholder="핸드폰 번호를 (010-0000-0000)입력하세요" class="form-control" name="phone" id="phone">
					<i class="zmdi zmdi-account"></i>
				</div>
				
				<button type="submit">
					비밀번호 찾기 <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>
		</div>
	</div>

</body>
</html>