<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/resources/style/community_page.css">
<script type="text/javascript" src="/resources/style/index.js"></script>
<title>상세페이지</title>
<!--  jQuery, bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js?after"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


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
	<% String uploadPath = "C:/Users/qbnyp/Documents/workspace-sts-3.9.14.RELEASE/Final_Project/src/main/webapp"; %>

	<div class="sideBanner">
        <img src="/resources/image/학교.png" alt="">  
    </div>

    <div class="sideBanner2">
        <img src="/resources/image/배너.png" alt="">

    </div>


	<main id="container">
		<section class="main-list">
		
		<div class="modify-button">
				<button onclick="redirectToModify(${board.bno})" class="w-btn1"
					type="button">글 수정하기</button>
				<button onclick="redirectToRemove(${board.bno})" class="w-btn1"
					type="button">글 삭제하기</button>
		</div>
			<article class="main">
				<div id="main-title">
					<h2>${board.title}</h2>
				</div>
				<hr id="hr">
				<div class="main-info">
					<p class="author">${board.writer}</p>
					<img src="/resources/image/icon_view.png" alt="조회수"> <small>${board.view_cnt}</small>
					<p class="date">등록일 : ${board.regdate} &nbsp </p>
					<p id= "like_cnt">좋아요 : ${like} </p>
				</div>
				<div id="main-content">
					<span id="note" th:utext>${board.content}</span>
				</div>
				
				<div id="main-file">
					<p class="author">자료</p>
					<a download href="/resources/uploadfiles2/${board.filename}">${board.filename}</a>					
				</div>
			<%
				if (session.getAttribute("nickname") != null) {
			%>
				<div id="main-like">
					<c:choose>
						<c:when test="${likeValue == 0}">
							<button class="w-btn" type="button"
								onclick="like(${board.bno}, '<%= session.getAttribute("nickname")%>')">
								<img class="like-icon" src="/resources/image/heart.png"
									alt="좋아요"> <span style="margin-left: 5px;">좋아요!</span>
							</button>
						</c:when>
						<c:otherwise>
							<button class="w-btn" type="button"
								onclick="unlike(${board.bno}, '<%= session.getAttribute("nickname")%>')">
								<img class="like-icon" src="/resources/image/heart2.png"
									alt="좋아요 취소"> <span style="margin-left: 5px;">좋아요
									취소</span>
							</button>
						</c:otherwise>
					</c:choose>
				</div>
				<%
					}
				%>
			</article>
			<%
				if (session.getAttribute("nickname") != null) {
			%>

			<article class="comments">
				<form action="reply_insert" method="post" accept-charset="UTF-8">
					<div class="comment-form">
						<input type="text" id="content" placeholder="댓글을 작성해주세요." name="content" class="comment-input"> 
						<input type="hidden" name="board_num" value="${board.bno}"> 
						<input type="hidden" name="writer" value="<%=session.getAttribute("nickname")%>">
						<button type="submit" class="comment-submit">등록</button>
					</div>
				</form>
				<%
					}
				%>

				<button onclick="loadreply()">댓글보기</button>
				<div id="comment-list">
					<!-- 댓글이 동적으로 추가될 공간 -->
					
				</div>
				<div id="edit-form" style="display: none;">
					<input type="text" id="edit-content" placeholder="댓글을 수정해주세요." class="comment-input">
					<button onclick="editReply()">수정 완료</button>
					<button onclick="cancelEdit()">취소</button>
				</div>
			</article>
		</section>

		

	</main>
	<script>
	function formatDate(dateString) {
	    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
	    return formattedDate;
	}
	//---------------------------------------------------------
	
	function like(bno,nickname) {
	    // 수정 로직 추가
	    console.log("bno :" +bno);
	    console.log("user :" + nickname);
	    	    
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	       if (this.readyState == 4) {
	            if (this.status == 200) {
	            	const updatedLikeCount = parseInt(this.responseText);
	            	const commentList = document.getElementById("main-like");
	            	const like_cnt = document.getElementById("like_cnt");
	 	            commentList.innerHTML = ""; // 기존 댓글 삭제
	 	           	like_cnt.innerHTML = "";
	 	            
	 	            let template =`
	 	        	<button class="w-btn" type="button" onclick="unlike(${board.bno}, '<%= session.getAttribute("nickname")%>')" >
	 	          		<img class="like-icon" src="/resources/image/heart2.png" alt="좋아요">
	 	          		<span style="margin-left: 5px;">좋아요!</span>
	 	     	  	</button>`;
	 	     		
	 	     	  	let template2=`
	 	     	  	좋아요 : \${updatedLikeCount}
	 	     	  	`;
	    
		         	commentList.insertAdjacentHTML('beforeend', template);
	 	     	    like_cnt.insertAdjacentHTML('beforeend', template2);    
	            } else {
	                console.error("댓글 수정 실패");
	                // 실패 시 처리할 로직을 추가하세요.
	            }
	        }
	    };
	    const url = `http://localhost:8080/view/like?nickname=\${nickname}&bno=\${bno}`;
	    xhttp.open("POST", url, true);
	    xhttp.send();
	}
	//==========================================================================
		
	function unlike(bno,nickname){
		// 수정 로직 추가
	    console.log("bno :" +bno);
	    console.log("user :" + nickname);
	    	    
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	       if (this.readyState == 4) {
	            if (this.status == 200) {
	            	const updatedLikeCount = parseInt(this.responseText);
	            	const commentList = document.getElementById("main-like");
	            	const like_cnt = document.getElementById("like_cnt");
	 	            commentList.innerHTML = ""; // 기존 댓글 삭제
	 	           like_cnt.innerHTML = "";

	 	            let template =`
	 	        	<button class="w-btn" type="button" onclick="like(${board.bno}, '<%= session.getAttribute("nickname")%>')" >
	 	          		<img class="like-icon" src="/resources/image/heart.png" alt="좋아요">
	 	          		<span style="margin-left: 5px;">좋아요!</span>
	 	     	  	</button>`;
	 	     
	 	     		let template2=`
	 	     	  	 좋아요 : \${updatedLikeCount}
	 	     	  	`;
	 	     	  	
		         	commentList.insertAdjacentHTML('beforeend', template);
	 	     		like_cnt.insertAdjacentHTML('beforeend', template2);    
	 	     		
	            } else {
	                console.error("댓글 수정 실패");
	                // 실패 시 처리할 로직을 추가하세요.
	            }
	        }
	    };
	    const url = `http://localhost:8080/view/unlike?nickname=\${nickname}&bno=\${bno}`;
	    xhttp.open("POST", url, true);
	    xhttp.send();
	}
	
	//---------------------------------------------------------
	function loadreply() {
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	        if (this.readyState == 4 && this.status == 200) {
	            const replyList = JSON.parse(this.responseText);

	            // JavaScript로 동적으로 댓글 섹션 업데이트
	            const commentList = document.getElementById("comment-list");
	            commentList.innerHTML = ""; // 기존 댓글 삭제
	            console.log(replyList);
	            console.log(replyList.length);
	            console.log(replyList[0].content);
	            // 각 댓글에 대해 반복문 실행
	            var uid = '<%=(String)session.getAttribute("nickname")%>';

	            replyList.forEach((list, i) => {
	                const formattedDate = formatDate(list.regdate);

	                // 세션에 닉네임이 있고, 작성자가 세션 닉네임과 같으면 삭제 버튼을 추가
	                 let template =
                    '<div class="comment-item" id="comment-' + list.number + '">' +
                    '<p class="comment-writer">' +
                    list.writer + '&nbsp;&nbsp;&nbsp;' +
                    '<span style="color: gray; font-family: sans-serif; font-size: 15px;">(' + formattedDate + ')</span>';

                if (list.writer == uid) {
                    template +=
                        '<button id="delete" onclick="deleteReply(' + list.number + ')" title="삭제">' +
                        '<span class="image-icon"></span>' +
                        '</button>' +
                        '<button id="update" onclick="showEditForm(' + list.number + ')" title="수정">' +
                        '<span class="image-icon2"></span>' +
                        '</button>' +
                        
                        '<div class="edit-form" id="editform-'+list.number+'" style="display: none;">' +
                        '<input type="text" id="edit-content-'+list.number+'" placeholder="댓글을 수정해주세요." class="comment-input">' +
                        '<button onclick="editReply('+list.number+')">수정 완료</button>' +
                        '<button onclick="cancelEdit('+list.number+')">취소</button>' +
                        '</div>';
                }

                template +=
                    '</p>' +
                    '<p class="comment-content">' + list.content + '</p>' +
                    '</div>';

	                    commentList.insertAdjacentHTML('beforeend', template);
	                
	            });
	        }
	    };

	    // 서버로 요청 보내기
	    const url = "http://localhost:8080/view/test?bno=" + ${board.bno};
	    console.log(url);
	    xhttp.open("GET", url, true);
	    xhttp.send();
	}
	
	function showEditForm(replyNumber) {
	    const xhttp = new XMLHttpRequest();

	    xhttp.onreadystatechange = function () {
	        if (this.readyState == 4 && this.status == 200) {
	            try {
	                const reply = JSON.parse(this.responseText);

	                const editFormId = 'editform-' + replyNumber;
	                document.getElementById(editFormId).style.display = 'block';
	                const editFormContentId = 'edit-content-' +replyNumber;
	                document.getElementById(editFormContentId).value = reply.content;
	                
	            } catch (error) {
	                console.error("JSON 파싱 오류:", error);
	            }
	        }
	    };

	    const url = `http://localhost:8080/view/reply_get?number=\${replyNumber}`;
	    xhttp.open("GET", url, true);
	    xhttp.send();
	}

	function cancelEdit(replyNumber) {
	    const editFormId = 'editform-' + replyNumber;
	    console.log(editFormId);
	    document.getElementById(editFormId).style.display = 'none';
	}
	
	function editReply(replyNumber) {
	    // 수정 로직 추가
	    const editcontent = 'edit-content-' + replyNumber;
	    console.log(editcontent);
	    const editedContent = document.getElementById(editcontent).value;
	    
	    
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	        if (this.readyState == 4) {
	            if (this.status == 200) {
	                // 서버에서의 처리가 성공적으로 이루어졌을 때의 로직
	                loadreply();
	                console.log("댓글 수정이 완료되었습니다.");
	                // 여기에서 필요한 추가 동작을 수행하세요.
	            } else {
	                console.error("댓글 수정 실패");
	                // 실패 시 처리할 로직을 추가하세요.
	            }
	        }
	    };
	    const url = `http://localhost:8080/view/reply_update?number=\${replyNumber}&content=\${editedContent}`;
	    xhttp.open("POST", url, true);
	    xhttp.send();
	}
	
	
	
	
	function deleteReply(replyNumber) {
	    console.log("reply : " + replyNumber);
	    const xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function () {
	        if(this.readyState == 4) {
	            if(this.status == 200) {
	                const deletedComment = document.getElementById(`comment-\${replyNumber}`);
	                if(deletedComment){
	                    console.log("Deleted comment id: " + deletedComment.id);
	                    deletedComment.remove();
	                }
	            } else {
	                console.error("댓글 삭제 실패");
	            }
	        }
	    };
	    const url = `http://localhost:8080/view/reply_delete?number=\${replyNumber}`;
	    console.log(url);
	    xhttp.open("POST", url, true);
	    xhttp.send();

	    
	}


	
	
	
     function redirectToModify(bno) {
        // JavaScript 코드를 사용하여 페이지 이동
        window.location.href = "/view/modifyform?bno=" + bno;
    }
     
    
     function redirectToRemove(bno) {
         // JavaScript 코드를 사용하여 페이지 이동
         window.location.href = "/view/remove?bno=" + bno;
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