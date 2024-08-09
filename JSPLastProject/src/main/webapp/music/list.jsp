<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.cotainer{
   margin-top: 50px;
}
.row{
  margin: 0px auto;
  width: 960px;
}
.dataTr:hover{
	background-color : #FF66;
	
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
  <script type="text/javascript">
$(function (){
		
})

</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">Music Top200</h3>
		<div class="row">
		<form method="post" action="">
			<table class="table">
				<tr>
				<td>
					<select name="column" class="input-sm">
						<option value="title">곡명</option>
						<option value="singer">가수명</option>
						<option value="album">앨범</option>
					</select>
				<input type="text"  name="ss" size=20 class="input-sm">
				<button class="btn-sm btn-primary" value="검색"></button>
			</table>
		</div>	
		<div style="height: 20px"></div>
		<div class="row" >
		<table class="table">
			<tr>
				<th class="text-center">순위</th>
				<th class="text-center"></th>
				<th class="text-center">곡명</th>
				<th class="text-center">가수명</th>
				<th class="text-center">앨범</th>
			</tr>
			<c:forEach var="vo"  items="${list }">
				<tr class="dataTr" data-mno=${vo.mno }
			</c:forEach>	
		</table>
		</form>
</div>
</div>
</body>
</html>