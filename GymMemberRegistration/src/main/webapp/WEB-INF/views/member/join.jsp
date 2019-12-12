<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
		var data = $("#idCheck").css('color');
		//alert(data);
		if(data=="rgb(255, 0, 0)"){
			alert("이미 존재하는 아이디 입니다.")
			$("#email").val("");
			$("#email").focus();
			$("#idCheck").html("");
			return false;
		}
		
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

		var data = $("#username").val();
		if(data.trim().length==0 && !data){
			alert('이름 반드시 입력해야 합니다.');
			$("#username").val("");
			$("#username").focus();
			return false;
		}
		if(!validateName(data)){
			alert('이름이 형식이 올바르지 않습니다.');
			$("#username").val("");
			$("#username").focus();
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
		
		var data = $("#gender").val();
		if(!data){
			alert('성별은 반드시 선택해야 합니다.');
			$("#gender").focus();
			return false;
		}
		
		var data = $("#password").val();
		if(data.trim().length==0 && !data){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		if(!validatePassword(data)){
			alert('비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내여야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		
		var data = $("#password2").val();
		if(data.trim().length==0 && !data){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		if(data != $("#password").val()){
			alert('비밀번호를 동일하게 입력해주세요.');
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		
		return true;
	}
	
	function idCheck(){
		var value = $("#email").val();
		if(value.length>5){
			$.ajax({
				type:'GET',
		        url:'idCheck',
		        data : {'email' : value},
		        dataType : 'json',
		        success: function(data){
		        	if(data=="1"){
		        		$("#idCheck").css("color", "red").html("이미 존재하는 이메일 입니다.");
		        	}else{
		        		$("#idCheck").css("color", "blue").html("사용가능 합니다.");
		        	}
		        },
		        error: function() {
		            alert("실패");
		        }
			});
		} else{
			$("idCheck").html("");
		}
	}
	
</script>

</head>
<body>

	<div class="wrapper" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg-registration-form-1.jpg');">
		<div class="inner">
			<div class="image-holder">
				<img src="${pageContext.request.contextPath }/resources/images/registration-form-1.jpg" alt="">
			</div>
			<form action="${pageContext.request.contextPath }/member/joinOk" method="POST" onsubmit="return formCheck();">
				<h3>Registration Form</h3>
				<div class="form-wrapper">
					<input type="text" placeholder="이메일을 입력하세요" class="form-control" name="email" id="email" onkeyup="idCheck();">
					<i class="zmdi zmdi-email"></i>
				</div>
				<div>
					<span id="idCheck"></span>
				</div>
				<br />
				<div class="form-wrapper">
					<input type="text" placeholder="이름을 입력하세요" class="form-control" name="username" id="username">
					<i class="zmdi zmdi-account"></i>
				</div>
				<div class="form-wrapper">
					<input type="text" placeholder="핸드폰 번호를 (010-0000-0000)입력하세요" class="form-control" name="phone" id="phone">
					<i class="zmdi zmdi-account"></i>
				</div>
				
				<div class="form-wrapper">
					<select name="gender" id="gender" class="form-control">
						<option value="no" disabled selected>성별</option>
						<option value="male">남자</option>
						<option value="femal">여자</option>
					</select> 
					<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="비밀번호를 입력하세요" class="form-control" name="password" id="password">
					<i class="zmdi zmdi-lock"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="비밀번호 확인" class="form-control" name="password2" id="password2"> 
					<i class="zmdi zmdi-lock"></i>
				</div>
				<button type="submit">
					회원가입 <i class="zmdi zmdi-arrow-right"></i>
				</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/main'">
					메인페이지로 <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>
		</div>
	</div>

</body>
</html>