<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let i=0;
	$(function(){
		$('#showBtn').click(function(){
			if(i==0)
				{
					i=1;
					$('#aaa').show("slow")
					$('#showBtn').val("취소")
				}
			else
				{
						i=0
						$('aaa').hide("slow")
						$('#showBtn').val("삭제")
				}
		})
	})
</script>
</head>
<body>

</body>
</html>