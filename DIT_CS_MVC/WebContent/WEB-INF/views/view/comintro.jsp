<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/style/comintro.css">
    <script type="text/javascript" src="/resources/style/index.js"></script>
    <title>커뮤니티</title>
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


    <div class="page-title">
        <h2>학과소개</h2>
        <small>컴퓨터 소프트웨어 학과를 소개하는 페이지입니다.</small>
    </div>
	
    <div class ="info">
        <div class="study">
            <img src="/resources/image/study.png" alt="study_image" >
        </div>
        
        <div class= "dit">
            <img src="/resources/image/DIT.png" alt="DIT_image" >
        </div>
		<hr>
        <span class="intro">
            <h3>웹·모바일앱·데이터베이스·인공지능·사물인터넷·클라우드컴퓨팅</h3>
            <span>컴퓨터소프트웨어과는 웹 · 모바일앱 · 데이터베이스 · 인공지능 · 사물인터넷 · 클라우드컴퓨팅 등 스마트 IT 산업 분야의 실력있는 소프트웨어 개발 전문가 양성을 목표로 교육하고 있습니다.<br>
                학생들은 웹 및 모바일 앱개발, 프로그래밍 언어, 데이터베이스, 소프트웨어 설계 및 모델링 등 체계적인 이론과 실습을 통하여 기초 능력을 학습하고,<br>
                그 바탕 위에서 다양한 팀 프로젝트 통해 심화 학습 및 현장 실무 능력을 키우고 있습니다.
                <br><br>
                정규교육과정 이외에도 학생들은 전공동아리 활동, 캡스톤 디자인 프로젝트, 각종 대외 소프트웨어 개발 공모전, 전국 대학생 해커톤 대회 등에 출전하여 출중한 결과를 내고 있으며,<br>
                이러한 밀도 높은 교육을 통해 학생들은 졸업 후 IT 분야의 전문 인력으로 진출하고 있습니다.</span>
                <br><br>
                <hr>
                <br>
                <h3>관련 자격증 </h3>
                <h5>국가공인</h5> <span>정보처리산업기사, 전자계산기조직응용기사, 전자계산기산업기사, 인터넷정보관리사, 리눅스마스터, 무선인터넷관리사</span>
                <h5>국제공인</h5> <span>자바프로그래머(OCJP), 자바웹프로그래머(OCWCD) 자바웹프로그래머(OCBCD)</span>
                <br><br>
                <hr>
         </span>
         
        <div class="dit2">
    		<button id="dit2Button" class="btn btn-primary btn-jittery" onclick="toggleVisibility('dit2')">교육과정</button>
    		<div id="image">
    			
    		</div>    		
		</div>         
		
		<hr>
		
		<div class="dit4">
        <button class="btn btn-primary btn-jittery" onclick="toggleVisibility('dit4')">편입정보</button>
        <div id="imagecon"></div>
    </div>
		
		
    </div>   
        
 
   
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
    
    <script>
    document.getElementById("logoutBtn").addEventListener("click", function() {
        // JavaScript 코드로 현재 페이지 URL 가져오기
        var currentPageURL = window.location.href;

        // Extract the path part of the URL (remove base URL)
        var baseUrl = "http://localhost:8080";  // Update this with your base URL
        var path = currentPageURL.replace(baseUrl, "");

        // AJAX 요청으로 로그아웃 및 현재 페이지 URL의 경로만 서버에 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/user/logout?currentPageURL=" + path, true);
        
        window.location.reload();
           
        xhr.send();
    });

        function redirectToCommunity(bno) {
            // JavaScript 코드를 사용하여 페이지 이동
            window.location.href = "/view/compage?bno=" + bno;
        }

        function moveUserModify(nickname) {
            // JavaScript 코드를 사용하여 페이지 이동
            window.location.href = "/user/user_modify?nickname=" + nickname;
        }

        function moveLogout() {
            // JavaScript 코드를 사용하여 페이지 이동
            window.location.href = "/user/logout";
        }
        
        function fetchImage() {
            // 정적으로 정의된 이미지 URL 배열
            var staticImageUrls = [
               
                '/resources/image/커리큘럼.png'
            ];

            // 이미지 엘리먼트를 담을 컨테이너 엘리먼트
            var imageContainer = document.getElementById('image');
            imageContainer.innerHTML = ''; // 기존 내용 비우기

            // 이미지 URL 배열을 순회하면서 이미지 엘리먼트를 동적으로 생성하여 추가
            staticImageUrls.forEach(imageUrl => {
                var imgElement = document.createElement('img');
                imgElement.src = imageUrl;
                imgElement.alt = 'DIT_image';
                imageContainer.appendChild(imgElement);
            });
        }
        
        
        
        function toggleVisibility(sectionClass) {
            console.log('Toggle visibility for:', sectionClass);
            var section = document.querySelector('.' + sectionClass);
            var targetDiv;

            if (sectionClass === 'dit2') {
                targetDiv = document.getElementById('image');
            } else if (sectionClass === 'dit4') {
                targetDiv = document.getElementById('imagecon');
            }

            if (section.style.display === 'none' || section.style.display === '') {
                section.style.display = 'flex';
                // 이미지 추가 함수 호출
                if (sectionClass === 'dit2') {
                    fetchImage();
                } else if (sectionClass === 'dit4') {
                    fetchImage1();
                }
            } else {
                
                targetDiv.style.display = 'none'; // 대상 div 숨기기
            }
        }
        
        function fetchImage1() {
            // 정적으로 정의된 이미지 URL 배열
            var staticImageUrls = [
                
                '/resources/image/ffff.png'
            ];

            // 이미지 엘리먼트를 담을 컨테이너 엘리먼트
            var imageContainer = document.getElementById('imagecon');
            imageContainer.innerHTML = ''; // 기존 내용 비우기

            // 이미지 URL 배열을 순회하면서 이미지 엘리먼트를 동적으로 생성하여 추가
            staticImageUrls.forEach(imageUrl => {
                var imgElement = document.createElement('img');
                imgElement.src = imageUrl;
                imgElement.alt = 'DIT_image';
                imageContainer.appendChild(imgElement);
            });
        }
    </script>
</body>
</html>