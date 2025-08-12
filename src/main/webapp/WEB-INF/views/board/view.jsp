<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
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
    
    input                  { width : 5%; padding: 5px; } 
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
	      </tr>
	      <tr>
	        <td>조회수</td>
	        <td>${ view.hit }</td>
	      </tr>
	       <tr>
	        <td>작성일</td>
	        <td>${ view.regdate }</td>
	      </tr>
	 	    <tr>
	 	     <td>제목</td>
	 	     <td>${ view.title }</td>
	 	    </tr>
	 	    <tr>
	        <td>작성자 이름</td>
	        <td>${ view.writer }</td>
	      </tr>
	 	   <tr>
	 	     <td>내용</td>
	 	     <td>${ view.content }</td>
	 	   </tr> 	   
	 	   <tr> 
	        <td colspan="2">
	          <input type="button" value="수정" id="goUpdate"/>
	          <input type="button" value="삭제" id="goDel" />
	        </td>
	      </tr>
	 	  </table>
	</main>
	<script>
		 const goUpdateEl = document.getElementById('goUpdate');
		 goUpdateEl.onclick = function() {
		     location.href='/Board/UpdateForm?idx=${ view.idx }&menu_id=${view.menu_id}'
		   }
		 
	   const goDelEl = document.getElementById('goDel');
	   goDelEl.onclick = function() {
	     location.href='/Board/Delete?idx=${ view.idx }'
	   }
   </script>
</body>
</html>