<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row">
			<div class = "col-sm-8">
			<table class="table">
				<tr>
					<td width="40%" class="text-center" rowspan="7">
					<img src="${vo.poster }" style="width: 100%">
					</td>
					</tr>
					<tr>
					<td colspan="2"><h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3></td>
					</tr>
					<tr>
					<th class="text-center" width="15%">음식종류</th>
					<td width="55%">${vo.type }</td>
					</tr>
					<tr>
					<th class="text-center" width="15%">주소</th>
					<td width="55%">${vo.address }</td>
					</tr>
					<tr>
					<th class="text-center" width="15%">전화번호</th>
					<td width="55%">${vo.phone }</td>
					</tr>
					<tr>
					<th class="text-center" width="15%">테마</th>
					<td width="55%">${vo.theme }</td>
					</tr>
		</table> 
		<table class="table">
			<tr>
			<td>${vo.content }</td>
			</tr>
			<tr>
				<td class="text-right">
					<a href="#" class="btn btn-xs btn-info">찜하기</a>
					<a href="#" class="btn btn-xs btn-success">좋아요</a>
					<a href="#" class="btn btn-xs btn-warning">예약</a>
					<a href="../food/list.do" class="btn btn-xs btn-primary">목록</a>
					</td>
					</tr>
		</table>
		</div>
		</div>
</body>
</html>