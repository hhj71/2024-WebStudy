<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
function send() {
		sendRequest('sub.jsp', null, ok, 'post')
}
function ok()
{
	alert("Call"')	
		if(httpRequest.readyState==4)
			{
				/*
						status => 404 , 500, 403, 412	...
						200 => 정상수행
				*/
				let div=document.querySelector("#print")
				div.innerHTML = httpRequest.responseText
				// HTML 자체 읽기 => responseText
				// XML 
			}
}
</script>
</head>
<body>

</body>
</html>