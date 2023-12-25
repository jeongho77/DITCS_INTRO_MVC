<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/style/community.css">
    <script type="text/javascript" src="/resources/style/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
	
	<div class="sideBanner">
        <img src="/resources/image/학교.png" alt="">  
    </div>

    <div class="sideBanner2">
        <img src="/resources/image/배너.png" alt="">

    </div>
	
	
    <div class="page-title">
        <h2>학과소통</h2>
        <small>전공에 대해 모르는걸 질문 및 답변하는 게시판입니다.</small>
    </div>
    <%
            if (session.getAttribute("nickname") != null) {
        %>
    <div id = "write">
        <button  onclick="moveWrite()" class="btn btn-primary btn-jittery" type="button">작성하기</button>
    </div>
    <%
            }
    %>
    	<div id = "search_form">
	    	<form id="searchForm" method="get">
    			<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요">
    			<button type="button" onclick="search()">검색하기</button>
			</form>
		</div>
	<div id = "container1">
    <c:forEach var="board" items="${list}">
        <div class="container">
            <section class="post-list">
                <article class="post" onclick="redirectToCommunity(${board.bno})">
                    <h2 class="post-title">${board.title}</h2>
                    <div class="post-meta">
                        <div id="left">
                            <p>작성자 : ${board.writer}</p>
                            <p>작성일 : ${board.regdate}</p>
                        </div>
                       
                        <div id="right">
                            <img src="/resources/image/icon_view.png" alt="조회수"> <small>${board.view_cnt}</small>
                            <img src="/resources/image/icon_chat.png" alt="댓글"> <small>${board.replyCount}</small>
                            <img src="/resources/image/icon_heart.png" alt="좋아요"> <small>${board.likeCount}</small>
                           
                        </div>
                    </div>
                </article>
            </section>
        </div>
    </c:forEach>
</div>


	<div class="d-flex justify-content-center">
		<ul class="pagination">
			<c:if test="${startNum > 1 }">
				<li class="page-item"><a class="page-link" href="community?p=${startNum-1 }">Prev</a></li>
			</c:if>
			<c:if test="${startNum <= 1 }">
				<li class="page-item"><a class="page-link" style="color:gray" onclick="alert('이전 페이지가 없습니다!')" href="#">Prev</a></li>
			</c:if>
			
			<c:forEach var="i" begin="0" end="4" step="1">
				<c:if test="${startNum + i <= lastNum }">
					<c:if test="${startNum + i == p }">
						<li class="page-item active"><a class="page-link" href="community?p=${startNum + i }">${startNum + i }</a></li>
					</c:if>	
					<c:if test="${startNum + i != p }">
						<li class="page-item"><a class="page-link" href="list?p=${startNum + i }">${startNum + i }</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			
			<c:if test="${startNum + 5 <= lastNum }">
				<li class="page-item"><a class="page-link" href="community.do?p=${startNum+5 }">Next</a></li>
			</c:if>
			<c:if test="${startNum + 5 > lastNum }">
				<li class="page-item"><a class="page-link" style="color:gray" onclick="alert('다음 페이지가 없습니다!')" href="#">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id="pageForm" action="/view/community_page" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>

	<div id="pull-right">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>

	<footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>

    <script>
    var pageForm = $("#pageForm");

    $(".pagination .page-link").on("click", function(e) {
        e.preventDefault(); // 기본 동작 막기

        // 클릭한 페이지에 active 클래스 추가
        $(this).parent().addClass("active").siblings().removeClass("active");

        var targetPage = $(this).text();
        console.log(targetPage);

        pageForm.find("input[name='pageNum']").val(targetPage);

        // URL 변경
        var newUrl = updateQueryStringParameter(window.location.href, 'pageNum', targetPage);
        window.location.href = newUrl; // 페이지 새로 로딩
        
        
    });
    
    $(".pagination .page-prev").on("click", function(e) {
        e.preventDefault(); // 기본 동작 막기

        var currentPage = $(".pagination .page-item.active .page-link").text();
        var targetPage = parseInt(currentPage) - 1;

        if (targetPage > 0) {
            // 이전 페이지로 이동
            $(".pagination .page-link:contains(" + targetPage + ")").trigger("click");
        }
    });

    // 다음(next) 버튼 클릭 시
    $(".pagination .page-next").on("click", function(e) {
        e.preventDefault(); // 기본 동작 막기

        var currentPage = $(".pagination .page-item.active .page-link").text();
        var targetPage = parseInt(currentPage) + 1;

        // 다음 페이지로 이동
        $(".pagination .page-link:contains(" + targetPage + ")").trigger("click");
    });

    // URL에서 특정 파라미터를 변경하는 함수
    function updateQueryStringParameter(uri, key, value) {
        var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
        var separator = uri.indexOf('?') !== -1 ? "&" : "?";
        if (uri.match(re)) {
            return uri.replace(re, '$1' + key + "=" + value + '$2');
        } else {
            return uri + separator + key + "=" + value;
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
        
        function search() {
            var keyword = document.getElementById("searchForm").elements["keyword"].value;

            $.ajax({
                url: "/view/search",
                type: "GET",
                data: { keyword: keyword },
                success: function (result) {
                    // 기존 게시글 목록을 비우기
                    var postList = document.querySelector("#container1");
                    postList.innerHTML = "";

                    // 받아온 검색 결과를 HTML로 동적으로 추가
                    for (var i = 0; i < result.length; i++) {
                        var board = result[i];

                        // 새로운 결과를 기존 게시글 목록에 추가
                        var postContainer = document.createElement("div");
                        postContainer.classList.add("container");

                        var postSection = document.createElement("section");
                        postSection.classList.add("post-list");

                        var postArticle = document.createElement("article");
                        postArticle.classList.add("post");
                        postArticle.setAttribute("data-bno", board.bno); // data-bno 속성 추가

                        var postTitle = document.createElement("h2");
                        postTitle.classList.add("post-title");
                        postTitle.innerHTML = board.title;

                        var postMeta = document.createElement("div");
                        postMeta.classList.add("post-meta");

                        // 좌측 정보 추가
                        var leftDiv = document.createElement("div");
                        leftDiv.id = "left";
                        leftDiv.innerHTML = "<p>작성자 : " + board.writer + "</p><p>작성일 : " + formatDate(board.regdate) + "</p>";

                        // 우측 정보 추가
                        var rightDiv = document.createElement("div");
                        rightDiv.id = "right";
                        rightDiv.innerHTML = "<img src='/resources/image/icon_view.png' alt='조회수'><small>" + board.view_cnt + "</small>" +
                            "<img src='/resources/image/icon_chat.png' alt='댓글'><small>" + board.replyCount + "</small>" +
                            "<img src='/resources/image/icon_heart.png' alt='좋아요'><small>" + board.likeCount + "</small>";

                        // 포스트에 좌우 정보 추가
                        postMeta.appendChild(leftDiv);
                        postMeta.appendChild(rightDiv);

                        postArticle.appendChild(postTitle);
                        postArticle.appendChild(postMeta);
                        postSection.appendChild(postArticle);
                        postContainer.appendChild(postSection);

                        // 기존 게시글 목록에 추가
                        postList.appendChild(postContainer);
                    }
                },
                error: function (error) {
                    console.error("Error during search:", error);
                }
            });
        }

        // 검색 폼 제출 시 search 함수 호출
        document.getElementById("search_form").addEventListener("submit", function (event) {
            event.preventDefault();
            search();
        });

		        // 게시글 클릭 시 redirectToCommunity 함수 호출
		        document.addEventListener("click", function (event) {
		    if (event.target.classList.contains("post")) {
		        var bno = event.target.getAttribute("data-bno");
		        redirectToCommunity(bno);
		    }
		});
        
    	function formatDate(dateString) {
    	    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    	    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
    	    return formattedDate;
    	}
    	
    	function redirectToCommunity(bno) {
    	    // JavaScript 코드를 사용하여 페이지 이동
    	    window.location.href = "/view/compage?bno=" + bno;
    	}
    	
    	var floatPosition = parseInt($(".sideBanner").css('top'));
        var floatPosition2 = parseInt($(".sideBanner2").css('top'));

        $(window).scroll(function() {
            // 현재 스크롤 위치
            var currentTop = $(window).scrollTop();
            var bannerTop = currentTop + floatPosition + "px";
            var banner2Top = currentTop + floatPosition2 + "px";

            //이동 애니메이션
            $(".sideBanner").stop().animate({
                "top": bannerTop
            }, 500);

            $(".sideBanner2").stop().animate({
                "top": banner2Top
            }, 500);
        }).scroll();
     </script>
</body>
</html>
