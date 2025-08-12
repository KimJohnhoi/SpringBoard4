<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<!-- scss 문법 가능하게 하는 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
  td {text-align: center; }
  tr:first-child {
    background-color: black;
    font-weight: bold; 
    
    /* === SCSS 문법에 적용(SASS 문법중에 하나) : 별도 라이브러리 필요 (스프링에서 자동적용, 라이브러리 없이)=== */
    td {border-color: cyan; color: white}
  }
  
  td[colspan] {text-align: right; }
  
  #menu a {
    color: white; 
    font-weight: bold; 
  }
  
</style>
</head>
<body>
  <main>
    <!-- 메뉴 리스트 -->
    <%@include file="/WEB-INF/include/menus.jsp"%>
    <h2>${ menuName.menu_name } 게시물 목록</h2>
    <%--  <h2>${ param.menu_id } 게시물 목록</h2> --%>
    <!-- 게시물 목록 -->
    <table>
      <tr>
        <td>글번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
        <td>조회수</td>
      </tr>
      <!-- Expression language % 대신 사용 -->
     <c:forEach var="board" items="${ boardList }">
       <tr>
         <td>${ board.idx }</td> 
         <td><a href="/Board/View?idx=${ board.idx }&menu_id=${board.menu_id}">${ board.title }</a></td> 
         <td>${ board.writer }</td> 
         <td>${ board.regdate }</td> 
         <td>${ board.hit }</td> 
       </tr>
     </c:forEach>
     <tr>
        <td colspan="5">
          <a href="/Board/WriteForm?menu_id=${ menuName.menu_id }">새 게시물 추가</a>
        </td>
      </tr>
    </table>
  </main>
</body>
</html>