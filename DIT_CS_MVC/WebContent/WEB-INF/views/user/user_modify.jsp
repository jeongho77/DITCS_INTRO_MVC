<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원정보수정</title>
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
	
	<main class="main-container">
		<div class="signup-container">
			<form class="user-form" action="modify" method="post">
				<div class="form-group">
					<input type="hidden" id="number" name="number" value="${user.number}">
				</div>
				
				<div class="form-group">
					<label for="name">아이디 </label>
						<div id = "id_chk"> 
							<input type="text" id="id" name="id" value="${user.id}" placeholder="이름을 입력하세요" required>
							<button onclick=id_check()>ID 중복확인</button>
	       				</div>
				</div>
					
				<div class="form-group">
					<label for="email">이메일 </label> 
					<input type="email" id="email" name="email" value="${user.email}" placeholder="이메일을 입력하세요" required>
				</div>

				<div class="form-group">
					<label for="password">비밀번호 </label> 
					<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
				</div>

				<div class="form-group">
					<label for="password">비밀번호 확인</label> 
					<input type="password" id="pwdConfirm" name="pwdConfirm" placeholder="비밀번호 재입력" required>
				</div>

				<div class="form-group">
					<label for="password">닉네임 </label>
						 <div id = "id_chk">
							<input type="password" id="nickname" name="nickname" value="${user.nickname}" placeholder="닉네임을 입력하세요" required>
							<button onclick=nickname_check()>닉네임 중복확인</button>
	       				 </div>
				</div>

				<button type="submit" class="pure-button pure-button-primary">저장</button>
				<button type="button" class="pure-button pure-button-primary" onclick="confirmPassword()">회원탈퇴</button>
			</form>
		</div>
	</main>
	<script>
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
	
	//==========================================
	
	var isIdAvailable = false; // 아이디 중복 상태를 저장하는 변수

	function id_check() {
	    return new Promise((resolve, reject) => {
	        const id = document.getElementsByName("id")[0].value;
	        console.log(id);
	        const xhttp = new XMLHttpRequest();
	        xhttp.onreadystatechange = function () {
	            if (this.readyState == 4) {
	                try {
	                	console.log(this.responseText);
	                    isIdAvailable = this.responseText === 'true';
	                    console.log(isIdAvailable);
	                    
	                    if(id === "${user.id}"){
	                    	isIdAvailable = true;
	                    	alert("사용하던 ID로 확인했습니다!");
	                    	resolve();
	                    }else{
		                    if (isIdAvailable) {
		                        console.log("아이디 중복");
		                        alert("아이디가 중복입니다!");
		                        isIdAvailable = false;
		                       
		                    } else {
		                        console.log("아이디 사용 가능");
		                        alert("아이디 사용가능!");
		                        isIdAvailable = true;       
		                 	}
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
	//==========================================
		
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
	                     
	                     if(nickname === "${user.nickname}"){
		                    	isNickAvailable = true;
		                    	alert("사용하던 닉네임으로 확인했습니다!");
		                    	resolve();
		                 }else{
			                  if (isNickAvailable) {
			                         console.log("닉네임 중복");
			                         alert("닉네임이 중복입니다!");
			                         isNickAvailable=false;
			                        
			                     } else {
			                         console.log("닉네임 사용 가능");
			                         alert("닉네임 사용가능!");
			                         isNickAvailable=true;
			                     }
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
	
	// 폼 제출 이벤트 리스너
	document.querySelector('form').addEventListener('submit', async function (e) {
	    // 중복 확인을 눌렀을 때만 폼 제출
	    if (!isIdAvailable || !isNickAvailable) {
	        e.preventDefault(); // 중복이면 폼 제출을 막음
	        alert("아이디 또는 닉네임 중복을 확인해주세요!");
	    }
	});
	
	//==========================================
	
	function confirmPassword() {
	    // confirm 대화상자를 이용하여 사용자에게 비밀번호 확인 요청
	 	var numberElement = document.getElementById("number");
		var user_number = parseInt(numberElement.value, 10);
		
	    console.log("number" + user_number);
	    const prompt_pwd = prompt("회원탈퇴를 진행하려면 비밀번호를 입력하세요:");
		console.log("prompt_pwd "+prompt_pwd);
		
	    if (prompt_pwd === "${user.pwd}") {
	        // 서버에 비밀번호 확인 및 회원탈퇴 요청
	        const xhttp = new XMLHttpRequest();
	        xhttp.onreadystatechange = function () {
	            if (this.readyState == 4) {
	                if (this.status == 200) {
	                    // 회원탈퇴가 성공했을 때의 처리
	                    alert("회원탈퇴가 성공적으로 이루어졌습니다.");
	                    logout();
	                    window.location.href = "http://localhost:8080/user/login.html"
	                    // 추가로 필요한 동작 수행
	                } else {
	                    // 회원탈퇴가 실패했을 때의 처리
	                    alert("회원탈퇴에 실패했습니다. 다시 시도해주세요.");
	                    // 추가로 필요한 동작 수행
	                }
	            }
	        };

	        // 서버에 비밀번호와 함께 요청 보내기
	        const url = "http://localhost:8080/user/remove?number=" + user_number;
	        
	        xhttp.open("POST", url, true);
	        xhttp.send();
	    }else{
	    	alert("회원탈퇴에 실패했습니다. 다시 시도해주세요.");
	    }
	}

	// "회원탈퇴" 버튼 클릭 시 confirmWithdraw 함수 호출

	
	function logout() {
	    // 서버에 로그아웃 요청 보내기
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	        if (this.readyState == 4) {
	            if (this.status == 200) {
	                // 로그아웃이 성공했을 때의 처리
	                alert("로그아웃이 성공적으로 이루어졌습니다.");
	                
	                // 추가로 필요한 동작 수행
	            } else {
	                
	            }
	        }
	    };

	    // 서버에 로그아웃 요청 보내기
	    const url = "http://localhost:8080/user/logout";
	    xhttp.open("POST", url, true);
	    xhttp.send();
	}

</script>
</body>
</html>