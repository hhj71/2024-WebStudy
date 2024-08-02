<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
		let div= document.querySelector("#box")
		div.addEventListener('mousedown', () =>{
			div.style.background='pink'
		})
		div.addEventListener('mouseup', event=>{
			event.currentTarget.style.background ='orange'
		})
		
		// id명은 중복하면 안된다 
}
</script>
</head>
<body>

</body>
		<div id="box"></div>
		<div id="box"></div>
		<div id="box"></div>
		<div id="box"></div>
		<div id="box"></div>
</html>