<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		let h1= document.quertSelector("#h1")	
		let gBtn= document.quertSelector("#green")	
		let bBtn= document.quertSelector("#blue")	
		let rBtn document.quertSelector("#red")	
		
		gBtn.addEventListener('click', function(){
			h1.style.color='green'
			
		})
		
	}
</script>
</head>
<body>
		<h1 id = "h1">제목</h1>
		<button id = "green">Green</button>
		<button id = "blue">Blue</button>
		<button id = "red">Red</button>
</body>
</html>