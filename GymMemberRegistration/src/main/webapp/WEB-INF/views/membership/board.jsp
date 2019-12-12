<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원권 게시판 목록(운영자)</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
body {
    margin-top: 2%
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
</head>
<body>
<jsp:include page="include.jsp" flush="false"></jsp:include>
	
	<table class="table" style="width: 1000px; margin: auto;">
  <thead class="thead-dark">
	<tr>
		<td align="right" colspan="3" style="border: none;">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/membership/write'" class="btn btn-primary">회원권 등록하기</button>
		</td>
	</tr>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">상품권이름</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
	  <c:forEach var="vo" items="${list }" varStatus="vs">
	    <tr>
	      <th scope="row">${size-vs.count+1 }</th>
	      <td>
	      	<span onclick='sendPost("${pageContext.request.contextPath}/membership/view", {"idx":${vo.idx }});' style="cursor: pointer;"><c:out value="${vo.products }"/></span>
	      </td>
	      <td><fmt:formatDate value="${vo.regdate }" pattern="yy-MM-dd"/></td>
	    </tr>
   	 </c:forEach>
  </tbody>
</table>
</body>
</html>