<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Untitled</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
    <link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
    
</head>
<style>
    input{
        color: black !important;
    }
    /* 이승규 css수정파일 공용 */
input::placeholder {
   color: #000 !important;
   text-align: left !important;
   margin-left: 10px !important;
   padding: 20px !important;
}

input::-webkit-input-placeholder {
   color: #000;
}

input:-ms-input-placeholder {
   color: #000;
}

label {
   color: black;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"],
select,
textarea {
   background: rgba(255, 255, 255, 0.05);

   border: solid 2px #3cb371;

}
</style>

<body class="is-preload">

    <!-- Header -->
    <header id="header">
      <div id="logobox"><a href="${cp}/" class="title" id="logo_"><img src="${cp}/resources/images/sweethome.png" alt="사진"
               id="logo"></a></div>
      <c:if test="${user.userid != null}">
	      <div id="mypage">
	         <a href=""><img src="${cp}/resources/images/${userphoto}" alt="" id="myprofile"></a>
	         <h5 id="welcome">환영합니다! <br>${user.username}님</h5>
	      </div>
	      <div class="dropdown help" onmouseover="helphover()" onmouseout="helphoverout()">
	         <div class="dropbtn" id="help">MENU</div>
	               <div class="dropdown-content">
	                  <a href="#">커뮤니티</a>
	                  <a href="#">문의내역</a>
	                  <a href="${cp}/user/mypage">마이페이지</a>
	                  <a href="${cp}/user/basket">나의장바구니</a>
	                  <a href="${cp}/user/order">주문내역</a>
	                 <c:if test="${user.userid.equals('manager')}">
                  		<a href="${cp}/reserv/counsel?date=${today}">관리페이지</a>
                  	  </c:if>
	               </div>
	            </div>
	         <div id="logout">
	            <a href="${cp}/user/logout"><input type="button" value="로그아웃"></a>
	         </div>
      </c:if>         
   </header>
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <section id="main" class="wrapper">
            <div class="inner">
                <h1 class="major">아이디 찾기</h1>
            </div>
        </section>
    </div>
    <div class="idSearch">
        <form name="joinForm" action="${cp}/user/checkid" method="post" 
           accept-charset="utf-8" onsubmit="return idSearch();" >
        <div class="checkid">
            <div class="idsearchbox">
                <label for="name">이름</label>
                <input type="text" name="username" id="name" placeholder="이름을 입력해주세요" style="padding: 10px;"/>
            </div>
            <div class="idsearchbox">
                <label for="userphone">핸드폰번호</label>
                <input type="text" name="userphone" id="userphone" onkeyup="addHypen(this);" placeholder="핸드폰번호 입력"
                    maxlength="13" style="border: 2px solid mediumseagreen;"/>
                <input type="button" value="인증번호" id="userphone_btn" style="margin: 0px 0px 0px 5px;">
            </div>
            <div class="idsearchbox">
                <label for="userphone">인증번호</label>
                <input type="text" id="userNum" name="check_number" placeholder="인증번호를 입력해주세요" style="border: 2px solid mediumseagreen;">
                <input type="button" value="인증확인" id="correct_check" style="margin: 0px 0px 0px 5px;">
            </div>
            <div class="pw_Search idsearchbox">
                <a href="${cp}/user/checkpw" class="checkpw">비밀번호찾기</a>
            </div>
            <div class="idsearchbox">
                <input type="submit" value="확인" id="submit">
            </div>
        </div>
    </form>
    </div>
    

       <!-- Footer -->
   <footer id="footer" class="wrapper alt">
      <div class="inner">
         <div id="external_link">
            <div id="twitter">
               <a href="https://twitter.com"><img src="${cp}/resources/images/트위터.png" alt="" id="twitter_pic"></a>
            </div>
            <div id="facebook">
               <a href="https://facebook.com"><img src="${cp}/resources/images/페이스북.png" alt="" id="facebook_pic"></a>
            </div>
            <div id="instagram">
               <a href="https://instagram.com"><img src="${cp}/resources/images/인스타그램.png" alt="" id="instagram_pic"></a>
            </div>
            <div id="youtube">
               <a href="https://youtube.com"><img src="${cp}/resources/images/유튜브.png" alt="" id="youtube_pic"></a>
            </div>
         </div>
         <ul class="menu">
            <li>고객센터</li>
            <li>대표: 이준민</li>
            <li>기관메일: sweethome@gmail.com</li>
            <li>대표전화: 02-700-0000</li>
            <li>&copy; Sweethome. All rights reserved.</li>
         </ul>
      </div>
   </footer>
    <!-- Scripts -->
    <script src="${cp}/resources/assets/js/jquery.min.js"></script>
    <script src="${cp}/resources/assets/js/jquery.scrollex.min.js"></script>
    <script src="${cp}/resources/assets/js/jquery.scrolly.min.js"></script>
    <script src="${cp}/resources/assets/js/browser.min.js"></script>
    <script src="${cp}/resources/assets/js/breakpoints.min.js"></script>
    <script src="${cp}/resources/assets/js/util.js"></script>
    <script src="${cp}/resources/assets/js/main.js"></script>

</body>
<script>
var code2= "";
 $('#userphone_btn').click(function() {
     const userphone = $('#userphone').val();
       const xhr = new XMLHttpRequest();
       if(userphone == ""){
       alert("핸드폰 번호를 입력하세요 !");
       userid.focus();
       return false;
    }
    else if(userphone.length == 13){
                alert('인증번호가 전송되었습니다. 확인해주세요 !');
                $.ajax ({
                   url: '${cp}/user/send_msg',
                   type: 'GET',
                   async: false,
                   data: {
                      "userphone" : userphone
                   },
                    success: function(data) {
                      var checkNum = data;
                      alert(data);
                      
                      $('#correct_check').click(function() {   
                         const userNum = $('#userNum').val();
                         
                         if(checkNum == userNum) {
                            alert('인증 성공하였습니다.');
                            $("#userphone").attr("readonly",true);
                            code2 = data;
                            console.log(code2);
                         }
                         else {
                            alert('인증 실패하였습니다. 다시 입력해주세요.');
                         }
                      });
                      
                   }
                }); 
    }else {
        alert('휴대폰번호를 정확하게 입력해주세요 !')
    } 
    
 });
 function idSearch() {
   const joinForm = document.joinForm;
   const username = joinForm.username;
    if(username.value == ""){
        alert("이름을 입력하세요!");
        username.focus();
        return false;
    }
    const exp_name = /^[가-힣]+$/;
    if(!exp_name.test(username.value)){
        alert("이름에는 한글만 입력하세요!");
        username.focus();
        return false;
    }
    const userphone = joinForm.userphone;
    if(userphone.value.length != 13){
       alert("휴대폰번호를 입력해주세요 !");
       return false;
    }
    if(code2 == ""){
       alert("휴대폰번호 인증 실패입니다!")
       return false;
    }
    return true;
}
</script>
<script src="${cp}/resources/assets/js/user.js"></script>
</html>