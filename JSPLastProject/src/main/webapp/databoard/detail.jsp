<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
  margin: 0px auto;
  width: 960px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 // Jquery => 자바스크립트 : 태그읽기  => $
 let bCheck=true; // 전역변수 
 $(function(){ // window.onload => 모든 프로그램은 시작점이 있다 => 일반 프로그램 : main()
	 // Vue : mounted() , React : componentDidMount()
	 // jquery : 서버 연결 => Ajax
	 // Vue/React/Next/Nuxt => 서버연결 => axios
	 // 변수 => 지역변수 
	 $('#delBtn').click(function(){
		 if(bCheck===true)
		 {
			 $('#delBtn').text("취소")
			 $('#delTr').show() // display:none , display:''
			 bCheck=false
		 }
		 else
		 {
			 $('#delBtn').text("수정")
			 $('#delTr').hide() // display:none , display:''
			 bCheck=true
		 }
	 })
	 $('#deleteBtn').on('click',function(){
		 let no=$('.del_no').text()
		 let pwd=$('#del_pwd').val()
		 if(pwd.trim()==="")
		 {
			 $('#del_pwd').focus()
			 return
		 }
		 console.log("no="+no+",pwd="+pwd)
		 $.ajax({
			type:'post',
			url:'../databoard/delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				// yes/no
				if(result==='yes')
				{
					// 이동 
					location.href="../databoard/list.do"
				}
				else
				{
				   alert("비밀번호가 틀립니다!!")
				   $('#del_pwd').val("")
				   $('#del_pwd').focus()
				}
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		 })
	 })
	 
	 // 댓글 읽기
	 let bno=$('.del_no').text()
	 replyList(bno)
	 // 댓글 쓰기
	 $('#writeBtn').click(function(){
		 //alert("Call...")
		 let msg=$('#msg').val()
		 console.log(msg)
		 let bno=$('.del_no').text()
		 console.log(bno)
		 if(msg.trim()==="")
		 {
			 $('#msg').focus()
			 return
		 }
		 $.ajax({
			 type:'post',
			 url:'../reply/reply_insert.do',
			 data:{"bno":bno,"msg":msg},
			 success:function(result)
			 {
				 let res=result
				 console.log(res)
				 if(res==='OK')
				 {
					 replyList(bno)
				 }
				 
			 },
			 error:function(request,status,error)
			 {
				 console.log(error)
			 }
		 })
	 })
	 let u=0;
	 // 댓글 수정 
function replyUpdate(rno)
	 {
		 $('.updates').hide()
		 $('#m'+rno).show()
		 
	 }
	 // 댓글 삭제
	function replyDelete(rno, bno)
	 {
		 $.ajax({
			 type:'post',
			 url:'../reply/reply_list.do',
			 data:{"bno":bno},
	 }
 })
 function replyUpdataData(rno)
		 {
			 let msg=$('#msg'+rno).val()
			 //alert(rno+"."+msg)
			 $.ajax({
				 type:'post',
				 url:'../reply/reply_update.do',
				 data:{"rno":rno, "msg":msg},
				 success:function(result)
				 {
					  if(result==='ok')
						  {
						  		let bno=$(.del_no).text()
						  		replyList(bno)
						  }
					  
				 },
				 error:function(request,status,error)
				 {
					 console.log(error)
				 }
			 
				 })
		 }
 function replyList(bno)
 {
	 $.ajax({
		 type:'post',
		 url:'../reply/reply_list.do',
		 data:{"bno":bno},
		 success:function(json)
		 {
			 json=JSON.parse(json)
			 let html=''
			 
			 json.map(function(reply){
				 //for(let reply of json){
				 html+='<table class="table">'
					 html+='<tr>'
					 html+='<td class="text-left">◑'+reply.name+'('+reply.day+')</td>'
					 html+='<td class="text-right">'
				      if(reply.id===reply.sessionId)
				      {
				    	  html+='<span class="btn btn-xs btn-success ups" onclick="replyUpdate">수정</span>&nbsp;' 
				    	  html+='<a href="#" class="btn btn-xs btn-warning">삭제</a>' 
				      }
					 html+='</td>'
					 html+='</tr>'
					 html+='<tr>'
					 html+='<td colspan="2">'
					 html+='<pre style="white-space:pre-wrap;border:none;background:white">'+reply.msg+'</pre>'
					 html+='</td>'
					 html+='</tr>'
					 html+='<tr class="updates" id="m'+reply.rno+'" style="display:none">'
					 html+='<td>'
					 html+='<textarea '
					 html+=
					 html+='</table>'
				 //}
			 })
			 console.log(html)
			 $('#reply').html(html)
		 },
		 error:function(request,status,error)
		 {
			 console.log(error)
		 }
	 })
 }
 </script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">내용 보기</h2>
   <div class="row1 row">
     <table class="table">
       <tr>
        <th width=20% class="text-center">번호</th>
        <td width=30% class="text-center del_no">${vo.no }</td>
        <th width=20% class="text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td>
       </tr>
       <tr>
        <th width=20% class="text-center">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
        <th width=20% class="text-center">제목</th>
        <td colspan="3">${vo.subject }</td>
       </tr>
       <c:if test="${vo.filesize>0}">
         <tr>
          <th width=20% class="text-center">첨부파일</th>
          <td colspan="3"><a href="../databoard/download.do?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize}Bytes)</td>
         </tr>
       </c:if>
       <%--
            데이터베이스 : Update,Delete
            업로드된 파일       
        --%>
       <tr>
         <td colspan="4" class="text-left" valign="top" height="200">
          <pre style="white-space: pre-wrap;background-color: white;border:none">${vo.content }</pre>
         </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
          <a href="../databoard/update.do?no=${vo.no }" class="btn btn-xs btn-success">수정</a>
          <span class="btn btn-xs btn-warning" id="delBtn">삭제</span>
          <a href="../databoard/list.do" class="btn btn-xs btn-info">목록</a>
         </td>
       </tr>
       <tr id="delTr" style="display: none">
         <td colspan="4" class="text-right inline">
         비밀번호:<input type=password id="del_pwd" class="input-sm" size=10>
         <input type=button value="삭제" class="btn-warning btn-sm" id="deleteBtn">
         </td>
       </tr>
     </table>
     <div style="height: 20px"></div>
     <table class="table">
      <tr>
       <td id="reply"></td>
      </tr>
     </table>
     <c:if test="${sessionScope.id!=null }">
     <table class="table">
       <tr>
        <td>
         <textarea rows="4" cols="70" id="msg" style="float: left"></textarea>
         <input type=button value="댓글쓰기" style="width: 100px;height: 85px;background-color: green;color:black" id="writeBtn">
        </td>
       </tr>
     </table>
     </c:if>
   </div>
  </main>
</div>
</body>
</html>