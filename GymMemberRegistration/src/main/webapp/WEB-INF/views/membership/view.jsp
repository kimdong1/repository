<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원권</title>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="include.jsp" flush="false"></jsp:include>

	<c:if test="${sessionScope.vo.lev == 2}">
		<button onclick='sendPost("${pageContext.request.contextPath}/membership/deleteOk",{"idx":${vo.idx },"lev":${sessionScope.vo.lev}});'>삭제하기</button>
		<button onclick='sendPost("${pageContext.request.contextPath}/membership/update",{"idx":${vo.idx },"lev":${sessionScope.vo.lev}});'>수정하기</button>
		<button onclick='location.href="${pageContext.request.contextPath}/membership/board"'>목록으로</button>
	</c:if>
	<c:if test="${sessionScope.vo.lev != 2}">
		<button onclick='location.href="${pageContext.request.contextPath}/membership/list"'>목록으로</button>
	</c:if>
		<table style="margin: auto;" border="1" >
			<tr>
				<td style="background-color: silver; font-size: 20pt; font-weight: bold;">
					${vo.products }
				</td>
			</tr>
			<c:if test="${fileVO!=null }">
				<tr>
					<td>
						<img alt="그림" src="<spring:url value = '/upload/${fileVO.sfile }'/>" >
						<input type="text" class="form-control" id="price" value="${vo.price }원" style="color:white; background-color: black;" readonly="readonly"/>
					</td>
				</tr>
			</c:if>
			<tr>
				<td>
					<div style="white-space:pre;"><c:out value="${vo.content }" /></div>
				</td>
			</tr>
		</table>
			
</body>
</html>