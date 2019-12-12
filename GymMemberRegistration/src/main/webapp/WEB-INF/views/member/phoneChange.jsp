<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 번호 변경</title>

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
		table{border:1px solid gray; margin: auto; width: 500px; height: 800px;}
	</style>

<script type="text/javascript">
	$(function(){
		
	});
	
	function formCheck(){

		var password = "${sessionScope.vo.password}";
		var input = $("#password").val();
		if(input != password){
			alert('비밀번호가 틀렸습니다 정확하게 입력하세요.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		
		var newPhone = $("#phone").val();
		if(!validatePhone(newPhone)){
			alert('전화번호 형식이 틀렸습니다.');
			$("#phone").val("");
			$("#phone").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="include.jsp"></jsp:include>
	<form action="${pageContext.request.contextPath }/member/phoneChangeOk" method="post" onsubmit="return formCheck();">
		<input type="hidden" id="email" name="email" value="${sessionScope.vo.email }" />
		<table>
			<tr>
				<td><h3>휴대전화번호 변경</h3></td>
			</tr>
			<tr>
				<td style="color: red;">
					아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 <br /> 
					또는 유료 결제 등 우리동네 헬스장으로 부터 <br /> 
					알림을 받을 때 사용할 휴대전화입니다.
					</td>
			</tr>
			<tr>
				<td>
					<div class="form-group"> 
					    <input type="password" class="form-control" id="password" placeholder="현재 비밀번호" required="required">
					</div>
					<br />
					<div class="form-group" style="font-weight: bold;">
						전화번호 형식은 ex) 010-0000-0000 입니다.
					    <input type="text" class="form-control" name="phone" id="phone" placeholder="새 전화번호" required="required">
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