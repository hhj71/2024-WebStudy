<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		//window.onload=function(){}
		// setter => val("값")
		$('#name').val("홍길동") // 값 추가 => 수정, 자동 로그인
		// 이벤트 처리
		$('buttton').on('click', function(){
			let addr=$('#addr').val()
			alert(addr)
		})
})
</script>
</head>
<body>
	<input type="text" id="name" size=15><br>
	<input type="text" id="addr" size=15>
	<button>클릭</button>
</body>
</html>