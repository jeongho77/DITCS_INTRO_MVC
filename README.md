# 🎓 DIT 컴퓨터 소프트웨어과 소개 및 커뮤니티 🎓

<br>

## ⭐ 프로젝트 설명 ##
동의과학대학교를 졸업을 앞두고 있기에 만든 개인 프로젝트이며 <br>
DIT 컴퓨터 소프트웨어과의 소개와 커뮤니티를 주제로 정하여 구현하였고 <br>
학과소개, 학과 커뮤니티, 학과 사진별로 구현되어 있으며 <br>
학과에 관한 정보를 알수있고 또 모르는걸 질문하여 정보공유가 가능하게끔 <br>
하고 학과사진으로 학과내의 분위기는 어떤지 확인할수 있게끔 만들었습니다. <br>
해당 프로젝트는 MVC패턴으로 만들었습니다! 
<br><br><br>


## 📚 사용한 기술 ##
 <div align="left">
  <img src="https://img.shields.io/badge/MariaDB-003545?style=flat&logo=MariaDB&logoColor=white"/>
  <img src="https://img.shields.io/badge/Java-4B4B77?style=flat&logo=java&logoColor=white"/>
  <img src="https://img.shields.io/badge/html-E34F26?style=flat&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/css-1572B6?style=flat&logo=css3&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
  <img src="https://img.shields.io/badge/FontAwesome-528DD7?style=flat&logo=Font Awesome&logoColor=white"/>
 </div>

 <br>

 ## 💻 화면 ##
**1. 메인화면**<br>
- 프로젝트의 메인화면입니다.
- 상단의 헤더바를 통하여 원하는 카테고리로 이동할수 있으며 로그인과 회원가입이 가능합니다.
- 버튼을 눌렀을때 애니메이션 효과를 넣어 버튼위에 마우스가 있을때 동작하게끔하여 사용자가 알수있게끔 구현하였습니다.
- 중단에는 iframe을 사용하여 학교 학과 유튜브 영상을 연결하였습니다.
- 하단에는 footer를 사용하였습니다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/e85ef0f3-e5b6-4d90-b9e5-af6eaa32c3b0">
<br><br> <hr>
 
**2. 회원가입**<br>
- Form을 사용하였고 아이디 , 이메일 , 비밀번호 , 비밀번호 재확인, 닉네임을 받습니다.
- 아이디와 닉네임을 UNIQUE KEY를 주어 중복이 안되게끔 하였고 각각의 중복확인 버튼을 눌러야 회원가입이 되게끔 했습니다.
- 비밀번호와 비밀번호 재입력 칸이 각각 일치하는지 회원가입을 눌렀을때 확인하는 함수를 넣어 구현하였습니다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/34581312-4d3f-4b19-b662-a260eacb50d7">
<br><br><hr>

**3. 로그인**<br>
- 회원가입때 생성한 아이디와 비밀번호를 입력받아 DB와 비교후 로그인합니다.
- 로그인이 성공했을때 아이디로 같은 열의 닉네임의 값을 찾아 세션으로 넘겨주어 로그인이 유지될수 있게끔 하였습니다. 
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/92bdda32-81a7-47c1-80f6-2096c888760c">
<br><br><hr>

**4. 학과 소개**<br>
- DIT 컴퓨터 소프트웨어과를 소개하는 화면입니다.
- 과에 대한 전반적인 설명을 적었고, 교육과정과 편입정보는 토글기능을 사용하여 버튼을 눌렀을 때 내용을 확인할수 있게끔 하였습니다.
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/ce3962d7-b2f5-43cb-9808-37ceb3b57323">
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/3444320a-6b83-4ca1-908c-1c88da4eb322">
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/8acc13af-f8ed-46ce-84cf-1dba3a4cc31e">
<br><br><hr>

**5. 학과 커뮤니티**<br>
- 학과 커뮤니티입니다. 전공에 대해 모르는걸 질문하는 지식공유 게시판입니다.
- 로그인을 하면 세션값을 비교하여 가운데에 작성하기 버튼이 나오게끔 구현하였습니다.
- 양 사이드에 배너를 추가하여 스크롤을 추적하여 배너가 따라올수있게 하였습니다.
- 페이지네이션 기능을 넣어 10개씩 끊어서 나오게끔 구현하였습니다.
- 커뮤니티에는 제목, 작성자, 작성일, 조회수 , 댓글 수 , 하트수가 나오게끔 구현하였습니다.
- 검색기능은 제목을 매개체로 정하고 LIKE 기능으로 제목을 찾을수 있게끔 구현하였습니다.
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/173cf536-a702-4c4a-ae9a-92dfa8a0c1da">
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/605f55da-b73c-499b-b38c-71acded9eb72">
<br><br><hr>
 
**6. 게시글 보기 / 댓글**<br>
- 게시글 보기입니다. 게시글을 보면 세션과 게시글내의 작성자를 비교하여 글 수정하기와 글 삭제하기가 나옵니다.
- 양 사이드에 배너를 추가하여 따라올수 있게끔 구현하였습니다.
- 게시글에는 게시글 내용과 파일, 좋아요 기능을 확인할수 있게끔 하였습니다.
- 좋아요 기능은 세션과 비교하여 ID 한개당 하나의 좋아요를 누를수 있습니다.
- 좋아요 기능을 AJAX로 구현하였기에 눌렀을 때 좋아요 숫자가 새로고침없이 업데이트 되며 빈 하트도 동시에 AJAX로 꽉찬 하트로 바뀔수 있도록 됩니다.
- 좋아요 취소도 눌렀을때 좋아요 숫자에 -1과 빈하트로 동시에 바뀝니다.
- 댓글 기능은 AJAX로 구현하여 새로고침없이 확인할수 있습니다.
- 댓글 기능은 댓글을 불러올때 세션에 있는 닉네임과 비교하여 댓글 작성자의 닉네임이 동일할 시 삭제와 수정하는 아이콘이 나오게끔 구현하였습니다.
- 댓글 수정과 삭제는 AJAX로 새로고침없이 즉시 수정과 삭제가 되게끔 구현하였습니다.

 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/d51ac189-bd48-4761-9456-a68f93baeb7f">
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/9e5773f4-d0b6-4479-accd-8111f742d35f">
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/ebff7af7-6b39-4520-9a73-1044f93ba5d2">
<br><br><hr>

**7. 게시글 작성하기**<br>
- 게시글 작성하기는 학과커뮤니티에서 로그인이 되었을 경우에만 게시글 작성하기 버튼이 보이게 되어있습니다.
- SummerNote 기능을 사용하여 내용을 적을때 조금더 다양하게 작성할수 있게끔 하는 api를 적용하였습니다.
- 파일을 넣을수 있게끔 구현하였고 파일을 저장되는 형식은 파일이름만 DB에 저장되고 로컬에 지정한 폴더에 파일을 저장합니다.

 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/3073f395-d4bf-453a-a683-297e10288150">
 <br><br>
 <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/23a8809d-a9f5-4961-8285-99517212cba2">
<h4>작성한 모습</h4>
<br>
 <img width="600" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/3a1aea51-ed6d-49bc-a7d6-bf4b991cc778">
<br><br><hr>

**8. 게시글 삭제하기**<br>
- 게시글 삭제하기는 글 삭제하기를 누르면 바로 삭제하게끔 구현하였습니다.
- 삭제하면 학과커뮤니티로 이동하게끔 하였습니다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/6f163ed1-9c0b-4e91-95b8-ef652bbc7b4c">
<br><br><hr>

**9. 학과 활동**<br>
- 학과 활동 페이지는 학과에서 한 활동들을 사진으로 모아놓은 페이지입니다.
- 작성하기와 삭제는 아무나할수 있지만 삭제는 관리자 비밀번호를 지정하여 일치하였을때만 삭제가 가능하도록 구현하였습니다.
- 사진은 작성할 때 파일이름은 DB에 저장하고 해당 사진은 로컬에 저장하였고 학과활동 페이지로 왔을 때 DB값의 파일이름으로 찾아 보여주게끔 구현하였습니다. 
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/ee7b4cb3-4b7c-40d0-a775-c5225a2ccc49">
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/69a15725-9ee6-4ce0-ae1a-5d04b78cc786">
<br><br><hr>

**10. 로그아웃**<br>
- 로그아웃은 우측 상단에 로그인이 되었을때 버튼이 활성화가 됩니다.
- 로그아웃은 로그인이 되었을때만 가능하며 눌렀을 때 세션을 끊어 로그아웃하기전 페이지로 돌아옵니다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/54d77f08-8638-4eb5-9b22-d3e13867bad8">
<br>로그아웃 후 <br>
- <img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/c5d5d757-52ed-4bfe-b06f-86616a71790f">
<br><br><hr>

**11. 회원정보수정**<br>
- 회원정보수정은 우측 상단에 로그인이 되었을 경우에만 버튼이 활성화가 됩니다.
- 회원가입과 동일하게 ID중복확인과 닉네임중복확인 , 비밀번호가 일치하여야 변경이 가능합니다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/56a21338-bba0-4c48-9db1-9e756e9a9689">
<br><br><hr>

**12. 회원탈퇴**<br>
- 회원탈퇴는 회원정보수정 밑에있는 버튼을 눌러 탈퇴를 진행할수 있다.
- 해당 계정의 비밀번호를 입력하면 탈퇴가 진행이 된다.
<img width="1470" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/56a21338-bba0-4c48-9db1-9e756e9a9689">
<img width="500" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/30b250ad-4904-40a3-b0a3-aa0c031ba080">
<img width="500" alt="index" src="https://github.com/jeongho77/JSP_DIT-intro/assets/115057094/df814e10-2b02-4bfa-9d32-ec501e695c14">
<br><br><hr>


## 😁 느낀점 😁##
MVC 패턴을 만들면서 이론으론 어려웠는데 만들어보니깐 생각보다 할만했었던거 같았고 <br>
AJAX로 기능 구현을 하였을때 정말 이쁘다라고 생각이 많이 들었습니다 <br>
부족한 부분들은 다음 프로젝트를 할때 조금더 메꿀수 있도록 노력하겠습니다. <br>
곧 졸업을 앞두는데 평생 기억할수 있는 프로젝트로 DIT 컴퓨터소프트웨어과 소개를 주제로 만들어보았는데 <br>
정말 의미있는 프로젝트라 다른프로젝트할때보다 훨씬 더 재밌고 만들수록 기분이 좋았던거 같네요 <br>
2년이란 짧은시간속에서 많이 배웠습니다. 정말 감사합니다 교수님! <br>
세상에 필요한 개발자가 될수 있도록 배운거 잊지않고 노력하겠습니다! <br>

