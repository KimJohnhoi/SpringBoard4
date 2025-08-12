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
  input { width : 5%; padding: 5px; } 
  
  #table {
	  margin-bottom : 150px; 
	  td {
	     text-align : center;
	     padding    : 10px;
	     border     : 1px solid silver;
	     
	     &:nth-of-type(1) {
	         width             :  150px;
	         background-color  :  black;
	         color             :  white;
	     }
	     &:nth-of-type(2) { width : 250px; }
	     &:nth-of-type(3) {
	         width             :  150px;
	         background-color  :  black;
	         color             :  white;
	     }
	     &:nth-of-type(4) { width : 250px;  }
	  }  
	  
	  tr:nth-of-type(3) td:nth-of-type(2) {
	     text-align : left;
	  }
	  
	  tr:nth-of-type(4) td:nth-of-type(2) {
	     height     : 250px;
	     width      : 600px; 
	     text-align : left;
	     vertical-align: baseline;      
	  }
	  
	  tr:last-of-type  td {
	     background: white;
	     color :     black; 
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
	  <h2>게시물 내용</h2>
	  <h3>게시물 카테고리 > ${ menu.menu_name }</h3>
	 	  <table id="table">
	 	    <tr>
	        <td>글번호</td>
	        <td>${ view.idx }</td>
	        <td>조회수</td>
          <td>${ view.hit }</td>
	      </tr>
	      <tr>
	        <td>작성자</td>
          <td>${ view.writer }</td>
	        <td>작성일</td>
          <td>${ view.regdate }</td>
	      </tr>
	 	    <tr>
	 	     <td>제목</td>
	 	     <td colspan="3">${ view.title }</td>
	 	    </tr>
	 	   <tr>
	 	     <td>내용</td>
	 	     <td colspan="3">${ view.content }</td>
	 	   </tr> 	   
	 	   <tr> 
	        <td colspan="4">
	          <input class="btn btn-dark btn-sm"  type="button" value="새글쓰기" id="goWrite"/>
	          <input class="btn btn-dark btn-sm"  type="button" value="수정" id="goUpdate"/>
	          <input class="btn btn-dark btn-sm"  type="button" value="삭제" id="goDel" />
	          <input class="btn btn-dark btn-sm"  type="button" value="목록" id="goList" />
	          <input class="btn btn-dark btn-sm"  type="button" value="홈으로" id="goHome"/>
	        </td>
	      </tr>
	 	  </table>
	</main>
	<script>
	   const goWriteEl = document.getElementById('goWrite');
	   goWrite.onclick = function() {
      location.href='/Board/WriteForm?menu_id=${ view.menu_id }'
     }
     
		 const goUpdateEl = document.getElementById('goUpdate');
		 goUpdateEl.onclick = function() {
		  location.href='/Board/UpdateForm?idx=${ view.idx }&menu_id=${ view.menu_id }'
		 }
		 
	   const goDelEl = document.getElementById('goDel');
	   goDelEl.onclick = function() {
	     location.href='/Board/Delete?idx=${ view.idx }&menu_id=${ view.menu_id }'
	   }
	   
	   const goListEl = document.getElementById('goList');
	   goListEl.onclick = function() {
		   location.href='/Board/List?menu_id=${ view.menu_id }'
	   }
	     
	   const goHomeEl = document.getElementById('goHome');
	   goHomeEl.onclick = function() {
		   location.href='/'
	   }
   </script>
</body>
</html>