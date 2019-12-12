<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.vo.lev != 2}">
	<%response.sendRedirect("error"); %>
</c:if>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/member/main">우리동네 헬스장</a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="${pageContext.request.contextPath }/member/main">Home <span class="sr-only">(current)</span></a>
            </li>
            
            <c:if test="${sessionScope.vo.lev eq 1 || sessionScope.vo.lev eq 2 }">
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath }/membership/board">헬스장 등록</a>
	            </li>
            </c:if>
            <c:if test="${sessionScope.vo.lev eq 0 ||empty sessionScope.vo.lev }">
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath }/membership/list">헬스장 보기</a>
	            </li>
            </c:if>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath }/QnA/list">Q&A</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#"></a>
            </li>
            
            <li class="nav-item">
	            <c:if test="${not empty sessionScope.vo }">
	              <a class="nav-link" href="${pageContext.request.contextPath }/member/logout">logout</a>
	            </c:if>
	            <c:if test="${empty sessionScope.vo }">
	              <a class="nav-link" href="${pageContext.request.contextPath }/member/login">Login</a>
	            </c:if>
            </li>
            <li class="nav-item">
	            <c:if test="${not empty sessionScope.vo }">
		           <a class="nav-link"  href="${pageContext.request.contextPath }/member/myPage" >${sessionScope.vo.email }님 안녕하세요!</a>
	            </c:if>
            </li>
          </ul>
          
<!--           <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"></button>
          </form>
 -->          
        </div>
      </nav>
<br /><br /><br />
</body>
<%
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("p"));
	}catch(Exception e) {
		;
	}
	int pageSize = 10;
	try {
		pageSize = Integer.parseInt(request.getParameter("s"));
	}catch(Exception e) {
		;
	}
	int blockSize = 10;
	try {
		blockSize = Integer.parseInt(request.getParameter("b"));
	}catch(Exception e) {
		;
	}
	//-------------------------------------------------------------------
	int idx = -1;
	try {
		idx = Integer.parseInt(request.getParameter("idx"));
	}catch(Exception e) {
		;
	}
	
	
	
	// EL에서 줄바꿈 처리를 위하여 두개의 변수를 request영역에 저장해 두자
	request.setAttribute("newLine", "\n");
	request.setAttribute("br", "<br>");
	
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("blockSize", blockSize);
	request.setAttribute("idx", idx);
	
	
%>
</html>