<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/style/index.css">
    <script type="text/javascript" src="/resources/style/index.js"></script>
    <title>DIT 인공지능 소프트웨어과</title>
</head>

<body>
        <header>
        <img src="/resources/image/logo.png" onclick="moveMain()" alt="타이틀">
        <nav>
            <span onclick="moveintro()" class="w-btn">학과소개</span>
            <span onclick="movecommunity()" class="w-btn">학과소통</span>
            <span onclick="moveactivities()" class="w-btn">학과활동</span>
        </nav>
        <%
            if (session.getAttribute("nickname") == null) {
        %>
        <div>
            <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">로그인</button>
            <button onclick="moveSignUp()" class="w-btn w-btn-indigo" type="button">회원가입</button>
        </div>
        <%
            } else {
        %>
        <div class="login-success">
            <p>
                안녕하세요! <%=session.getAttribute("nickname")%>님
            </p>
            <button onclick="moveUserModify('<%=session.getAttribute("nickname")%>')" class="w-btn w-btn-indigo" type="button">회원정보수정</button>
            <button id="logoutBtn" class="w-btn w-btn-indigo" type="button">로그아웃</button>
        </div>
        <%
            }
        %>
    </header>

    
    <div class="postcontainer">
        
        <div class="dit">
            <h4>개발자의 꿈을 위한 첫걸음</h4>
            <h5>DIT 컴퓨터 소프트웨어과</h5>
                <button onclick="moveintro()" class="btn btn-primary btn-jittery">
                  학과소개
                </button>
        </div>
        <div>
            <iframe src="https://www.youtube.com/embed/5DZtoD9njmA?si=Kf7W3lZor1diKbuz" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </div>
    </div>
    <footer>
        <p>Spring project</p> &copy; 2023. All rights reserved.</p>
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
    </script>
</body>

</html>