<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <style type="text/css">
  .container{
     margin-top: 50px;
  }
  .row{
    margin: 0px auto;
    width: 800px
  }
 </style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	/*
	
	
	7) 가상선택자 =>
	
	
	태그값 읽기 / 쓰기
				========
	1) val() / val(값)
	2) text() / text(값)
	3) html() / html(값)
	4) attr(속성명)/

	*/
	// 이벤트 처리
	/*
		click => button, 메뉴 , a , td/tr , img 
		$(선택자).click(function(){
			 
		 })
		 
		 => $(선택자).on('click', function(){})
		 => $(선택자).on('click', () => {})
		 
		 $(선택자).change(function(){}) : select
		 $(선택자).hover(function(){ // img, div
				mouseover
				), function 
		 })	
		 $(선택자).keyup(function(){	=> text, textarea
			 
		 })	
		 $(선택자).keydown(function(){
			 
		 })
	*/
	// 자바스크립트로 처리
	/*
			function : 기능 처리
			변수 설정 : let / const
			조건문 사용 => if , if~else
			반복문 => for, map, forEach
			JSON => Array / Object
							[]				{}
							자바 => 전송 : 문자열 => JSON : JSON.parse()
																	문자열로 변경 JSON.stringfiy()
			=> string : trim() / substring() / split() / indexOf()
			=> 연산자 처리
	*/
	// 효과 : fadeIn fadeOut animate() => jquery ui
	// ***Ajax : 화면 변경이 없는 상태 => 서버 요청 => 서버 응답
	// Jquery => 라이브러리가 커졌다 ==> 속도가 늦다 ==> 브라우저에서 속도처리가 빠른 라이브러리 선호
	//																							===> Vue3 / React-Query
	//																											====> 두가지 동시에 사용 가능하게 하는 프로그램 ===> nextJS
	// javascript => typescript
	// STS3(X) => SpringFramework ==> Spring-Boot
	// 지원하지 않는다 =====> JSP / ThymeLeaf
	// 서버 : spring-boot(서버로만 사용) / Front-End (VSCODE: 파일 갱신의 속도가 늦다)
	$('table > thead > tr').css('backgroundColor', '#cccfff')
	$('table > tbody > tr:nth-child(even)').css('backgroundColor','rgb(255,255,200)')
	$('table > tbody > tr:eq(1)').css('color', 'red')
	// eq는 0번 부터 시작
	// => 가장 많이 등장하는 가상 선택자 => id, class 
	})
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">회원 목록</h1>
		<div class = "row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class = "text-center">번호</th>
						<th class = "text-center">이름</th>
						<th class = "text-center">성별</th>
						<th class = "text-center">주소</th>
						<th class = "text-center">전화</th>
						</tr>
				</thead>
				<tbody>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
					<tr>
						<td class= "text-center">1</td>
						<td class= "text-center">홍길동</td>
						<td class= "text-center">남자</td>
						<td class= "text-center">서울</td>
						<td class= "text-center">010-1111-1111</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>