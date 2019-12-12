<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원권 등록</title>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<style type="text/css">

</style>

<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="include.jsp" flush="false"></jsp:include>
	<form action="${pageContext.request.contextPath }/membership/writeOk" method="post" enctype="multipart/form-data">
		<input type="hidden" id="lev" name="lev" value="${sessionScope.vo.lev }" />
		<table style="margin: auto;">
			<tr>
				<td>
					<input type="text" class="form-control" id="products" name="products" placeholder="상품명을 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="content" id="content" cols="100" rows="20" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">	
					<input type="text" id="price" name="price" placeholder="금액을 입력하세요" required="required">
					<input type="file"  id="file" name="file" required="required" />
					<input type="submit" value="게시물 올리기" />
				</td>
			</tr>
		</table>
	</form>	 
	
	
	
</body>
</html>