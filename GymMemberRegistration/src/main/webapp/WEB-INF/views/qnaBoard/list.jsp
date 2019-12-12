<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
</head>
<body>
	<jsp:include page="include.jsp" flush="false"></jsp:include>
	<table class="table" style="width: 1000px; margin: auto;">
		<thead class="thead-dark">
			<tr>
				<td align="right" colspan="3" style="border: none;">
					<button type="button"
						onclick='sendPost("${pageContext.request.contextPath}/QnA/write",{"p":${currentPage },"b":${blockSize },"s":${pageSize }});'
						class="btn btn-primary">질문하기</button>
				</td>
			</tr>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col" width="60%">제목</th>
				<th scope="col">아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${paging.totalCount == 0}">
				<tr>
					<td colspan="3" align="center"
						style="font-weight: bold; font-size: 15pt;">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${paging.totalCount != 0}">
				<c:set var="no"
					value="${paging.totalCount-(paging.currentPage-1)*paging.pageSize }" />
				<c:forEach var="vo" items="${paging.list }" varStatus="vs">
					<tr>
						<th scope="row">${no-vs.index }</th>
						<td><span
							onclick='sendPost("${pageContext.request.contextPath}/QnA/view", {"idx":${vo.idx }});'
							style="cursor: pointer;"> <c:out value="${vo.title }" />
						</span></td>
						<th scope="row"><c:set var="id" value="${vo.id }" />
							${fn:substringBefore(id,"@") }</th>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<c:if test="${paging.totalCount > 10}">
   		${paging.pageList }
   	</c:if>


</body>
</html>