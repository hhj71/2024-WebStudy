<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 고전적인 이벤트 처리
window.onload=() =>{
		let img=document.querySelector("img");
		img.onmouseover = function(){
			img.style.opacity=0.3
		}
		img.onmouseout=function(){
				img.style.opacity = 1.0
		}
}

</script>
</head>
<body>

</body>
</html>