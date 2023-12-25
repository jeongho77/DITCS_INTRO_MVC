<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/style/login.css">
    <script type="text/javascript" src="/resources/style/index.js"></script>
</head>

<body>
	<header id = "loginoff">
		<img src="/resources/image/logo.png" onclick="moveMain()" alt="타이틀">
		<nav>
			<span onclick="moveintro()" class="w-btn">학과소개</span> <span
				onclick="movecommunity()" class="w-btn">학과소통</span> <span
				onclick="moveactivities()" class="w-btn">학과활동</span>
		</nav>
		<%
			if (session.getAttribute("nickname") == null) {
		%>
		<div id="login">
			<button onclick="moveLogin()" class="w-btn w-btn-indigo"
				type="button">로그인</button>
			<button onclick="moveSignUp()" class="w-btn w-btn-indigo"
				type="button">회원가입</button>
		</div>
		<%
			} else {
		%>
		<div class="login-success">
			<p id="p">
				안녕하세요!
				<%=session.getAttribute("nickname")%>님!
			</p>
			<button
				onclick="moveUserModify('<%=session.getAttribute("nickname")%>')"
				class="w-btn w-btn-indigo" type="button">회원정보수정</button>
			<button id="logoutBtn" class="w-btn w-btn-indigo" type="button">로그아웃</button>
		</div>
		<%
			}
		%>
	</header>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="login_ok" method="post" onsubmit="return handleLogin()">
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="pwd" placeholder="비밀번호" required>
            <button type="submit">로그인</button>
        </form>
        <p onclick="moveSignup()">계정이 없으신가요? <a href="http://localhost:8080/user/signup.html">회원가입</a></p>
    </div>
    
     <script>
     <!-- In your redirected JSP or Thymeleaf template -->
    
         var errorMessage = "${errorMessage}";
         var successMessage = "${successMessage}";

         if (errorMessage) {
             alert("로그인에 실패했습니다. 다시 입력해주세요!");
         } else if (successMessage) {
             
         }
     </script>

   
    
</body>

</html>