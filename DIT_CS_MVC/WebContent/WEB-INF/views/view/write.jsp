<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/style/write.css">
    <script type="text/javascript" src="/resources/style/index.js"></script> 
  <script src="https://kit.fontawesome.com/08a7424104.js" crossorigin="anonymous"></script>
  
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js?after"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <title>글 작성하기</title>
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
    <main class="container">
        <section class="main-list">
            <div class="page-title">
                <h2>글 작성하기</h2>
            </div>
            <form class="write-form" action="board_insert" method="post" enctype="multipart/form-data" onsubmit="return validateFileSize()">
            	
            	
                    <input type="hidden" id="writer" name="writer" value="<%=session.getAttribute("nickname")%>">                    
            
            	
                <div id="input-title">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" placeholder="제목을 입력하세요.">                    
                </div>
                
                <div id="input-content">
                    <label for="content">내용</label>
                    <span id="note" th:utext>${board.content}</span>
    				<textarea th:field="*{content}" class="summernote input" id="content" name="content">${board.content}</textarea>
    				 </div>
               
                <div id="input-title">
	     			<div class="insert">
	     			<label for="writer">파일</label>
							<input type="file" id="file" name="file" placeholder="파일을 넣어주세요." >
						<div class="file-list"></div>
					</div>
                </div>

				<div class="button-group">
                    <button class="w-btn w-btn-indigo" type="submit">작성 완료</button>
                    <button class="w-btn" type="button" onclick="history.back()">취소</button>
                </div>
            </form>
            
            
            
        </section>
    </main>
    
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        // summernote 에디터 초기화
        $('#content').summernote();

        // 폼 제출 시에 내용 가져오기
        document.getElementById("yourFormId").addEventListener("submit", function (event) {
            event.preventDefault();

            // summernote 에디터의 내용 가져오기
            var contentValue = $('#content').summernote('code');

            // 가져온 내용을 가지고 새로운 HTML 구조 만들기
            var newHTML = "<p>" + contentValue + "</p>";

            // 새로운 HTML을 어떤 엘리먼트에 넣을지 결정하고 추가하기
            var targetElement = document.getElementById("targetElementId");
            targetElement.innerHTML = newHTML;

            // 나머지 폼 제출 로직 추가...
        });
    });
    
    
    var selFile = document.querySelector("input[type=file]");

    /* 첨부파일 추가 */
    function addFile(obj){
        var files = obj.files;
        let htmlData = '';
        for (var i = 0; i < files.length; i++) {
            const file = files[i];
            // 목록 추가
            htmlData += '<div id="file' + i + '" class="filebox">';
            htmlData += '   <p class="name">' + file.name + '</p>';
            htmlData += '   <a class="delete" onclick="jsFunc.deleteFile(' + i + ');"><i class="far fa-minus-square"></i></a>';
            htmlData += '</div>';
        }
        document.querySelector('.file-list').innerHTML = htmlData;
    }

    /* 첨부파일 삭제 */
    function deleteFile(num) {
        var dt = new DataTransfer()
        var { files } = selFile;

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (num !== i) dt.items.add(file);
            selFile.files = dt.files;
        }

        document.querySelector("#file" + num).remove();
    }
    
    //============================================================================
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
        
       
        document.getElementById('file').addEventListener('change', updateFileSize);

        
        function validateFileSize() {
            var input = document.getElementById('file');
            var files = input.files;

            for (var i = 0; i < files.length; i++) {
                var fileSize = files[i].size; // in bytes
                var maxSizeInBytes = 104857600; // 1 MB

                if (fileSize > maxSizeInBytes) {
                    alert('파일 크기는 1MB를 초과할 수 없습니다.');
                    return false;
                }
            }

            return true;
        }
    </script>

    <script type="module">
  import summerNote from '/resources/style/summernote.js'

  summerNote();

</script>
    
</body>



</html>