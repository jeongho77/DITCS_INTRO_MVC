<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/style/activity.css">
    <script type="text/javascript" src="/resources/style/index.js"></script>
    <title>커뮤니티</title>
     <style>
        /* 추가한 스타일 */
        .board {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .board-li {
            margin: 10px;
            flex: 1 0 calc(33.33% - 20px); /* 3개씩 나열하기 위한 스타일 */
            max-width: calc(33.33% - 20px);
            box-sizing: border-box;
        }

        .board-li-wrap {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
            text-align: center;
        }

        .board-li-wrap img {
    width: calc(100% + 50px);
    height: auto;
    border-radius: 8px;
    max-width: 450px;
}

        .pinfo {
            position: relative;
            z-index: 1; /* 텍스트를 사진 위로 띄우기 */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: rgba(240, 240, 240, 0.8); /* 배경 추가 */
            border-radius: 0 0 8px 8px;
            opacity: 0.9; /* 투명도 조절 */
        }

        .ptitle {
            text-align: center;
            margin: 10px 0;
        }

        .ptit {
            display: inline-block;
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .date {
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 5px;
            margin-top: 10px;
        }
    </style>
</head>

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
        <h2>학과활동</h2>
        <small>학과에서 한 활동들을 사진으로 저장하였습니다.</small>
    </div>
    
    <%
            if (session.getAttribute("nickname") != null) {
        %>
    <div id = "write">
        <button  onclick="moveWrite2()" class="btn btn-primary btn-jittery" type="button">작성하기</button>
    </div>
    <%
            }
    %>
    
    <hr>



    <ul class="board">
        <c:forEach var="board" items="${list}">
            <li class="board-li">
                <div class="board-li-wrap">
                    <img src="/resources/photozip/${board.filename}" alt="Photo">
                </div>

                <div class="pinfo">
                    <p class="ptitle">
                        <span class="ptit">
                            <span th:text="${board.title}">${board.title}</span>
                        </span>
                    </p>
                    <span class="date" th:text="${board.regdate}">${board.regdate}</span>
                </div>
                
                <a href="#" onclick="confirmDelete('${board.pno}')">X</a>
            </li>
        </c:forEach>
    </ul>

    
    
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
    
    <script>
    function confirmDelete(boardId) {
        // 사용자에게 삭제 여부 확인
        var userInput = prompt("삭제를 위해 번호를 입력하세요.");

        // 입력한 번호와 특정 번호("0000")를 비교
        if (userInput === "0000") {
        	window.location.href = "/view/photo_remove?pno=" + boardId;
        	
        	
        } else if (userInput === null) {
            // 사용자가 취소 버튼을 누른 경우
            alert("삭제가 취소되었습니다.");
        } else {
            // 입력한 번호가 일치하지 않는 경우
            alert("입력한 번호가 일치하지 않습니다. 삭제가 취소되었습니다.");
        }
    }
    
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