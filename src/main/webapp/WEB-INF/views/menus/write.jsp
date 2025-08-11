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
</style>
</head>
<body>
	<main>
	  <h2>새 메뉴 추가</h2>
	  <form action="/Menus/Write" method="POST">
    	  <table>
    	   <tr>
    	     <td>메뉴 아이디</td>
    	     <td><input type="text" name="menu_id" maxlength="6" /></td>
    	   </tr>
    	   <tr>
    	     <td>메뉴 이름</td>
    	     <td><input type="text" name="menu_name" /></td>
    	   </tr>
    	   <tr>
    	     <td>메뉴 순서</td>
    	     <td><input type="number" name="menu_seq" /></td>
    	   </tr>
    	   <tr> 
    	     <td colspan="2"><input type="submit" name="등록" /></td>
    	   </tr>
    	  </table>
	  </form>
	</main>
	
	<script>
	// 등록버튼이 이미지로 될 수 있으므로 form 태그에 submit 이벤트가 발생했을 때 처리한다.
	//const formEl = document.querySelectorAll("form")[0];
	const formEl = document.querySelector("form");
	
	formEl.addEventListener('submit', function(e){
		//alert('OK');
		
		const inputEl1 = document.querySelector('[name="menu_id"]');
		const inputEl2 = document.querySelector('[name="menu_name"]');
		const inputEl3 = document.querySelector('[name="menu_seq"]');
		
		if(inputEl1.value.trim() == '') { 
			alert('메뉴아이디가 입력되지 않았습니다 (예. MENU01)'); // 정규식을 활용할 수 있다. (총 여섯자리, 앞에 네자리 문자, 뒤에 두자리 숫자 )
			e.stopPropagation(); //이벤트 버블링 방지
			e.preventDefault();  //이벤트 취소시킴
			inputEl1.focus();
			return false;
		};
		if(inputEl2.value.trim() == '') { 
			alert('메뉴이름이 입력되지 않았습니다 (예. 자바)');
			e.stopPropagation();
		  e.preventDefault();
		  inputEl2.focus();
	    return false;
		};
		if(inputEl3.value.trim() == '') {
			alert('메뉴순서가 입력되지 않았습니다 (예. 1)');
      e.stopPropagation();
      e.preventDefault();
      inputEl3.focus();
      return false;
		};
	})
	
	</script>
</body>
</html>