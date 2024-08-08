<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
		$('#postBtn').on('click', function(){
			new daum.postcode
		})
		
})
</script>
</head>
<body>
	<div class="container">
		<div class = "row">
			<table class="table">
			</table>
		</div>
	</div>
</body>
</html>