<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){  // $(document).ready(function(){})
		// 태그 읽기	=> CSS selector
		$('td:nth-child(5n+4)').css('backgroundColor', 'green')
		$('td:nth-child(5n+2)').css('backgroundColor', 'yellow')
})

</script>
</head>
<body>
	

</body>
</html>