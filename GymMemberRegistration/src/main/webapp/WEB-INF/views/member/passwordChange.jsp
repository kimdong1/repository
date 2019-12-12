<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

	<style type="text/css">
		table{border:1px solid gray; margin: auto; width: 500px; height: 800px;}
	</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
	function formCheck(){
		//alert('${sessionScope.vo.password}');
		var cPassword = '${sessionScope.vo.password}';
		var current = $("#current").val();
		if(cPassword != current){
			alert('비밀번호가 틀렸습니다! 정확하게 입력하세요.');
			$("#current").val('');
			$("#current").focus();
			return false;	
		}
		
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password1 != password2){
			alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다!');
			$("#password1").val("");
			$("#password1").focus();
			$("#password2").val("");
			return false;	
		}
		
		if(!validatePassword(password1)){
			alert('비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내여야 합니다.');
			return false;
		}
		alert('비밀번호가 변경되었습니다.');
		return true;	
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/passwordChangeOk" method="post" onsubmit="return formCheck();">
	<jsp:include page="include.jsp"></jsp:include>
		<table>
			<tr>
				<td><h3>비밀번호 변경</h3></td>
			</tr>
			<tr>
				<td style="color: red;">
					안전한 비밀번호로 내정보를 보호하세요<br />
					다른 아이디/사이트에서 사용한 적 없는 비밀번호<br />
					이전에 사용한 적 없는 비밀번호가 안전합니다.
					</td>
			</tr>
			<tr>
				<td>
					<div class="form-group"> 
					    <input type="password" class="form-control" id="current" placeholder="현재 비밀번호" required="required">
					</div>
					<br />
					<div class="form-group" style="font-weight: bold;">
						비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 <br /> 
						8~15자리 이내여야 합니다.
					    <input type="password" class="form-control" name="password1" id="password1" placeholder="새 비밀번호" required="required">
					</div>
					<div class="form-group">
					    <input type="password" class="form-control" name="password2" id="password2" placeholder="새 비밀번호 확인" required="required">
					</div>
	 			</td>
			</tr>
			<tr>
				<td>
					<input type="submit" class="btn btn-primary btn-lg btn-block" value="확인"><br />
					<input type="button" class="btn btn-secondary btn-lg btn-block" value="취소">
				</td>
			</tr>
		</table>
	</form>
	
	
	
	


</body>
</html>