<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>

<script type="text/javascript">
	$(function(){
		
	});
	
	
	function updateCheck(idx){
		var comment = $("#comment"+idx).text();
		$("#commentForm").attr("action", "${pageContext.request.contextPath}/QnA/comment/updateOk");
		$("#content").val(comment);
		$("#submitBtn").attr("value", "수정하기");
	}
	
	function deleteCheck(idx){
		if(confirm("삭제하시겠습니까?")){
			sendPost('${pageContext.request.contextPath }/QnA/comment/deleteOk',{"ref":$("#ref").val(),"idx":idx});
		}else{
			return;
		}
	}
	
	function resetForm(){
		$("#commentForm").attr("action","${pageContext.request.contextPath }/QnA/commentWriteOk");
		$("#submitBtn").attr("value", "답변하기");
		$("#content").val("");
	}
	
</script>
</head>
<body>
	<jsp:include page="include.jsp" flush="false"></jsp:include>
	
		<button onclick="location.href='${pageContext.request.contextPath }/QnA/list'">목록으로</button>
		<c:if test="${sessionScope.vo.lev eq 2 || vo.id eq sessionScope.vo.email }">
			<button onclick='sendPost("${pageContext.request.contextPath }/QnA/delete",{"idx":${vo.idx }});'>삭제하기</button>
		</c:if>
		
		<table style="margin: auto;" border="1">
			<tr>
				<td width="700" >${vo.title }</td>
			</tr>
			<tr>
				<td>
					<div style="height: auto;">${vo.content}</div>
				</td>
			</tr>
		</table>
		<br /><br />
			<table style="margin: auto; width: 700px;" border="1" >
				<c:forEach var="view" items="${list }" >
					<tr>
						<td style="width: 20%">
							<c:set var="admin" value="${view.id }"/>
							운영자(${fn:substringBefore(admin,"@") })
						</td>
						<td style="padding: 10px;">
						<div style="white-space:pre;" id="comment${view.idx }"><c:out value="${view.content }" /></div>
							<c:if test="${sessionScope.vo.lev eq 2 }">
								<c:set var="ref" value="${view.idx }"></c:set>
								<input type="hidden" id="ref" name="ref" value="${view.ref}" />
								<input type="button" value="수정" onclick="updateCheck(${view.idx})" />
								<input type="button" value="삭제" name="delete" id="delete" onclick="deleteCheck(${view.idx });" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br /><br /><br />
		
		<c:if test="${sessionScope.vo.lev eq 2 || sessionScope.vo.lev eq 1 }">
			<form action="${pageContext.request.contextPath }/QnA/commentWriteOk" id="commentForm" method="post">
				<input type="hidden" id="idx" name="idx" value="${vo.idx }" />
				<input type="hidden" id="ref" name="ref" value="${ref }" />
				<input type="hidden" id="id" name="id" value="${sessionScope.vo.email }" />
				
				<table style="margin: auto;">
					<tr>
						<td align="right" >
							<input type="submit" id="submitBtn" value="답변하기" />
							<input type="button" id="cancelBtn" onclick="resetForm();" value="취소">
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="content" id="content" cols="95" rows="7"></textarea>
						</td>
					</tr>
				</table>
			</form>
		<br /><br /><br />
		</c:if>
		
</body>
</html>