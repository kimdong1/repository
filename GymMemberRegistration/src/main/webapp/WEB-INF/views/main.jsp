<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>우리동네 헬스장</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>

</head>
<body>
<jsp:include page="include.jsp" flush="false"></jsp:include>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        
      </div>


      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">
		<br /><br /><br />
        <div align="center"><h1 style="font-weight: bold; color: red;">★★★신규 회원권!!★★★</h1></div>
        <br />
        <!-- Three columns of text below the carousel -->
        <c:if test="${sfile1.sfile!=null }">
        <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="<spring:url value = '/upload/${sfile1.sfile }'/>" alt="image" width="350" height="350">
	            <h3>${desc1.products }</h3>
	            <p>
	            	<button class="btn btn-secondary" onclick='sendPost("${pageContext.request.contextPath}/membership/view", {"idx":${desc1.idx }});' >상세보기</button>
	            </p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="<spring:url value = '/upload/${sfile2.sfile }'/>" alt="image" width="350" height="350">
	            <h3>${desc2.products }</h3>
	            <p>
	            	<button class="btn btn-secondary" onclick='sendPost("${pageContext.request.contextPath}/membership/view", {"idx":${desc2.idx }});' >상세보기</button>
	            </p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="<spring:url value = '/upload/${sfile3.sfile }'/>" alt="image" width="350" height="350">
	            <h3>${desc3.products }</h3>
	            <p>
	            	<button class="btn btn-secondary" onclick='sendPost("${pageContext.request.contextPath}/membership/view", {"idx":${desc3.idx }});' >상세보기</button>
	            </p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
</c:if>

        <!-- START THE FEATURETTES -->
        <hr class="featurette-divider">

      </div><!-- /.container -->

      <!-- FOOTER -->
      <footer class="container">
        <p style="font-style: oblique; font-weight: bold;">&copy; DongUk Corp.</p>
      </footer>

</body>
</html>