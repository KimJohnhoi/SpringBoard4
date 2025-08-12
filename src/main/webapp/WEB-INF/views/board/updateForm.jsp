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
	td {
	  padding: 10px;
	  width: 700px;
	  text-align: center;
	}	
	td:nth-of-type(1) { width: 200px; }
	
	input { width: 100%; }
	input[type=submit] { width: 100px; }
	h2 {margin: 20px; text-align: center; }	
</style>
</head>
<body>
	<main>
	  <!--  메뉴 리스트 -->
	  <%@include file="/WEB-INF/include/menus.jsp"%>
	  
	  <h2>게시물 내용</h2>
	  <h3>게시물 카테고리 > ${ menuName.menu_name }</h3><br>
	  <form action="/Board/Update" method="POST">
	      <input type="hidden" name="menu_id" value="${ view.menu_id }"/>
    	  <table>
    	    <tr>
           <td>글번호</td>
           <td><input type="text" name="idx" value="${ view.idx }" readonly/> </td>
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
    	       <input type="submit" value="수정" />
             <a href="/Board/Delete?idx=${ view.idx }">삭제</a>
    	     </td>
    	   </tr>
    	  </table>
	  </form>
	</main>
</body>
</html>