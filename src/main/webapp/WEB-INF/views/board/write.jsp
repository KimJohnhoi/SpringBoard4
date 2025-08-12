<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<!--  bootstrap 스타일시트 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
	h2 {margin: 20px; text-align: center; }
	h3 {margin: 20px; }
	
	#table {
	  td {
	     padding : 10px;
	  }
	  td:nth-of-type(1) { 
	     text-align: center;  
	     width : 200px; 
	     background : #666;
	     color : white;
	     font-weight: bold;   
	     border : 1px solid white;    
	  } 
	  td:nth-of-type(2) { width : 600px; }
	  
	  tr:last-child > td { 
	      background: white; 
	      border: 1px solid black
	  }
	  
	  input                  { width : 100%; padding: 5px; } 
	  input[type=submit]     { width : 100px;  } 
	  input[name=userid]     { width : 25%;  } 
	  #goList                { width : 100px;  } 
	  #dupCheck, #dupCheck2  { width : 100px; }
	  
	  .red                   { color:red; }
	  .green                 { color:green; }
	  textarea               {
	      height : 200px;
	      width  : 100%;      
	  }
 }
 
  /* class="btn btn-dark btn-sm" */
 a.btn.btn-dark.btn-sm:hover {
    text-decoration: none;    
 }	
</style>
</head>
<body>
	<main>
	  <!--  메뉴 리스트 -->
	  <%@include file="/WEB-INF/include/menus.jsp"%>
	  
	  <h2>게시글 추가</h2>
	  <h3>게시물 카테고리 > ${ menu.menu_name }</h3>
	  <form action="/Board/Write" method="POST">
	      <input type="hidden" name="menu_id" value="${menu.menu_id}"/>
    	  <table id="table">
    	   <tr>
    	     <td>제목</td>
    	     <td><input type="text" name="title" /></td>
    	   </tr>
    	    <tr>
           <td>작성자 이름</td>
           <td><input type="text" name="writer" /></td>
         </tr>
    	   <tr>
    	     <td>내용</td>
    	     <td><textarea name="content"></textarea></td>
    	   </tr>
    	   <tr> 
    	     <td colspan="2">
	    	     <input class="btn btn-dark btn-sm" type="submit" value="등록" />
	    	     <input class="btn btn-dark btn-sm" type="button" value="목록" id="goList" />
    	     </td>
    	   </tr>
    	  </table>
	  </form>
	</main>
	
	<script>
	 const goListEl = document.getElementById('goList');
	 goListEl.onclick = function() {
		 location.href='/Board/List?menu_id=${menu.menu_id}'
	 }
	 
	 const formEl = document.querySelectorAll("form")[0];
	 const titleEl = document.querySelector('[name="title"]');
	 const writerEl = document.querySelector('[name="writer"]');
	 
	 formEl.addEventListener('submit', function(e){
		 if(titleEl.value == ""){
			 alert("제목을 입력해주세요");
			 e.stopPropagation(); //이벤트 버블링 방지
		   e.preventDefault();  //이벤트 취소시킴
			 titleEl.focus();
			 return false;
		 }
		 if(writerEl.value == ""){
			  alert("작성자를 입력해주세요");
			  e.stopPropagation(); //이벤트 버블링 방지
		    e.preventDefault();  //이벤트 취소시킴
			  writerEl.focus();
		    return false;
		 }
		 
	 })	 
	</script>
</body>
</html>