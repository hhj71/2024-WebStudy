<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
			<c:forEach var="vo" items="${list }">
				<div class="col-sm-3">
				<a href="#">
				<div class= "thumbnail">
					<img src="${vo.poster }" style="width: 100%">
				</div>
				</a>
				</div>
			</c:forEach>
		</div>
</body>
</html>