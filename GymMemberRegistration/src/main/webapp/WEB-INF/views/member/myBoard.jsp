<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 확인 및 삭제</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>


	<script type="text/javascript">
	$(function(){
		
	});
	
	function del(idx){
		if(confirm("정말 삭제 하시겠습니까?")){
			
		}else{
			return false;
		}
	}
	</script>
</head>
<body>
	<jsp:include page="include.jsp"></jsp:include>
	
	<table style="margin: auto;">
		<tr>
			<td colspan="2" align="center"><h2>내가쓴글</h2><br /><br /><br /></td>
		</tr>
		<c:if test="${sessionScope.vo.lev != 2 }">
			<c:if test="${not empty list }">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td style="font-weight: bold;">${vo.title }</td>
						<td>
							&nbsp&nbsp&nbsp&nbsp[<fmt:formatDate value="${vo.regdate }" pattern="yy/MM/dd(E)"/>]
							<button type="button" class="btn btn-dark" id="">Del</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</c:if>
		<c:if test="${sessionScope.vo.lev == 2 }">
				<c:if test="${not empty commentList }">
					<c:forEach var="vo" items="${commentList }">
						<tr>
							<td style="font-weight: bold;">${vo.content }</td>
							<td>
								&nbsp&nbsp&nbsp&nbsp[<fmt:formatDate value="${vo.regdate }" pattern="yy/MM/dd(E)"/>]
								<button type="button" class="btn btn-dark" id="del" name="del" onclick="del(${vo.idx});">Del</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
		</c:if>
	</table>
	
	
	
	
	
	
	
	
	

</body>
</html>