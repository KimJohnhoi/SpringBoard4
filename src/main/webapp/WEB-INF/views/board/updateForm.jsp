<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<!--  bootstrap 스타일시트 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
 #table {
  margin-bottom : 150px; 
  td {
     text-align : center;
     padding    : 10px;
     border     : 1px solid silver; 
     
     input[type="text"]   { width : 100%;  }
     textarea             { width : 100%;  height: 250px; }
      
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
	  
	  <h2>게시글 수정</h2>
	  <h3>게시물 카테고리 > ${ menuName.menu_name }</h3>
	  <form action="/Board/Update" method="POST">
	      <input type="hidden" name="menu_id" value="${ view.menu_id }"/>
	      <input type="hidden" name="idx" value="${ view.idx }"/>
    	  <table id="table">
    	    <tr>
           <td>글번호</td>
           <td>${ view.idx }</td>
            <td>조회수</td>
          <td>${ view.hit }</td>
         </tr>
         <tr>
           <td>작성자 이름</td>
           <td><input type="text" name="writer" value="${ view.writer }" /></td>
           <td>작성일</td>
           <td>${ view.regdate }</td>
         </tr>
    	   <tr>
    	     <td>제목</td>
    	     <td colspan="3"><input type="text" name="title" value="${ view.title }" /></td>
    	   </tr>
    	   <tr>
    	     <td>내용</td>
    	     <td colspan="3"><textarea name="content">${ view.content }</textarea></td>
    	   </tr>
    	   <tr> 
    	     <td colspan="4">
    	       <input class="btn btn-dark btn-sm" type="submit" value="확인" />
    	       <input class="btn btn-dark btn-sm" type="button" value="목록" id="goList" />
    	       <input class="btn btn-dark btn-sm" type="button" value="홈으로" id="goHome"/>
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
	    
	    const goListEl = document.getElementById('goList');
      goListEl.onclick = function() {
    	  location.href='/Board/List?menu_id=${ view.menu_id }'
      }
	    
      const goHomeEl = document.getElementById('goHome');
      goHomeEl.onclick = function() {
        location.href='/'
      }
	  }) 
	</script>
</body>
</html>