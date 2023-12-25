<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link rel="stylesheet" href="/resources/style/signup.css">
  <script type="text/javascript" src="/resources/style/index.js"></script>
</head>
<body>
	<header>
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

        
<div class="signup-container">
    <h2>회원가입</h2>
    <form action="signup_ok" method="post">
    	<div id = "id_chk">
        <input type="text" name="id" placeholder="아이디" required>
        <button type="button" onclick=id_check()>ID 중복확인</button>
        </div>
        
        <input type="email" name="email" placeholder="이메일" required>
        <input type="password" id="pwd" name="pwd" placeholder="비밀번호" required>
        <input type="password" id="pwdConfirm" name="pwdConfirm" placeholder="비밀번호 재입력" required>
        
        <div id = "id_chk">
        <input type="text" name="nickname" placeholder="닉네임" required>
        <button type= "button" onclick=nickname_check()>닉네임 중복확인</button>
        </div>

        <button type="submit" class="pure-button pure-button-primary">가입하기</button>
    </form>
    <p onclick="moveLogin()">이미 계정이 있으신가요? <a href=http://localhost:8080/user/login.html>로그인</a></p>
</div>

<script>
var isIdAvailable = false; // 아이디 중복 상태를 저장하는 변수

function id_check() {
    return new Promise((resolve, reject) => {
        const id = document.getElementsByName("id")[0].value;
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4) {
                try {
                    console.log(this.responseText);
                    isIdAvailable = this.responseText === 'true';
                    console.log(isIdAvailable);
                    if (isIdAvailable) {
                        console.log("아이디 중복");
                        alert("아이디가 중복입니다!");
                        isIdAvailable = false;
                       
                    } else {
                        console.log("아이디 사용 가능");
                        alert("아이디 사용가능!");
                        isIdAvailable = true;
                        
                    }
                } catch (error) {
                    console.error("JSON 파싱 오류:", error);
                    reject();
                }
            }
        };

        console.log(id);
        const url = `http://localhost:8080/user/id_get?id=\${id}`;
        xhttp.open("GET", url, true);
        xhttp.send();
    });
}

var isNickAvailable = false; // 아이디 중복 상태를 저장하는 변수
function nickname_check() {
    return new Promise((resolve, reject) => {
        const nickname = document.getElementsByName("nickname")[0].value;
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4) {
            	 try {
                     console.log(this.responseText);
                     isNickAvailable = this.responseText === 'true';
                     console.log(isNickAvailable);
                     if (isNickAvailable) {
                         console.log("닉네임 중복");
                         alert("닉네임이 중복입니다!");
                         isNickAvailable=false;
                        
                     } else {
                         console.log("닉네임 사용 가능");
                         alert("닉네임 사용가능!");
                         isNickAvailable=true;
                          
                     }
                 } catch (error) {
                     console.error("JSON 파싱 오류:", error);
                     reject();
                 }
            }
        };

        console.log(nickname);
        const url = `http://localhost:8080/user/nick_get?nickname=\${nickname}`;
        xhttp.open("GET", url, true);
        xhttp.send();
    });
}

var password = document.getElementById("pwd");
var confirm_password = document.getElementById("pwdConfirm");

function validatePassword() {
    if (password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
        confirm_password.setCustomValidity('');
    }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

// 폼 제출 이벤트 리스너
document.querySelector('form').addEventListener('submit', async function (e) {
    // 중복 확인을 눌렀을 때만 폼 제출
    if (!isIdAvailable || !isNickAvailable) {
        e.preventDefault(); // 중복이면 폼 제출을 막음
        alert("아이디 또는 닉네임 중복을 확인해주세요!");
    }
});
</script>

</body>
</html>