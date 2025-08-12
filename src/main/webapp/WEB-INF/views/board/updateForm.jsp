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
</style>
</head>
<body>
	<main>
	  <!--  메뉴 리스트 -->
	  <%@include file="/WEB-INF/include/menus.jsp"%>
	  
	  <h2>게시물 수정</h2>
	  <h3>게시물 카테고리 > ${ menuName.menu_name }</h3>
	  <form action="/Board/Update" method="POST">
	      <input type="hidden" name="menu_id" value="${ view.menu_id }"/>
	      <input type="hidden" name="idx" value="${ view.idx }"/>
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
    	     <td><input type="text" name="title" value="${ view.title }" /></td>
    	   </tr>
    	    <tr>
           <td>작성자 이름</td>
           <td><input type="text" name="writer" value="${ view.writer }" /></td>
         </tr>
    	   <tr>
    	     <td>내용</td>
    	     <td><textarea name="content">${ view.content }</textarea></td>
    	   </tr>
    	   <tr> 
    	     <td colspan="2">
    	       <input type="submit" value="확인" />
    	     </td>
    	   </tr>
    	  </table>
	  </form>
	</main>
	<script>
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