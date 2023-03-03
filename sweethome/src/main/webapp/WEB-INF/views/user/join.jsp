<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
    <title>Document</title>
</head>
<style>
    input{
        color: black !important;
    }
    input::placeholder {
         color: #000 !important;
          text-align: left !important;
         margin-left: 10px !important;
          padding: 10px !important;
    }
   .joinform{
   width: 1000px;
    margin: 0 auto;
        
   }
   div>#userphone {
    width: 65%;
    float: left;
}
   div> #userNum{
   width: 65%;
    float: left;
   }
   #wrapper{
   width: 1000px;
   margin: 0 auto;
   }
   #main{
   padding-top: 0px !important;
   }
   #sample6_postcode_btn {
    text-align: center;
    background-color: mediumseagreen;
    width: 47.8%;
    margin-left: 10px;
}
   div>#userphone_btn {
    width: 33.6%;
}
   div>#correct_check {
    width: 33.6%; 
}
   #userpw-field, #userpw_re, #username{
   height:2.75em;
   }
</style>
<body>
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
    <div id="wrapper">
        <!-- Main -->
        <div style="margin: 0 auto;">
           <h1 style="text-align:center; margin-top: 40px; margin-bottom: -10px;">회원가입</h1>
        </div>
        <section id="main" class="wrapper">
            <div id="joinform">
            <div class="lor-content joinbox">
                <form name="joinForm" method="post" action="${cp}/user/join" onsubmit="return lendit();">
                        <p id="result" colspan="2" style="color: black !important;"></p> 
                    <div class="joinbox">
                        <input type="text" name="userid" id="userid-field" class="logi                                                                                                                                   n-form-field"
                            placeholder="아이디를 입력해주세요">
                        <input type="button" id="user_id_btn" value="중복검사" onclick="checkId()">
                    </div>
                    <div class="joinbox">
                        <input type="password" name="userpw" id="userpw-field" class="login-form-field" id="userpw"
                            placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="joinbox">
                        <input type="password" name="userpw_re" class="login-form-field" id="userpw_re"
                            placeholder="비밀번호를 다시 입력해주세요">
                    </div>
                    <div class="username joinbox">
                        <input type="text" name="username" class="login-form-field" id="username"
                            placeholder="이름을 입력해주세요">
                    </div>
                    <div class="gender_area joinbox">
                        <select name="usergender" class="gender" style="color: mediumseagreen !important;">
                            <option value="" style="cursor: pointer;">성별 선택</option>
                            <option value="M">남</option>
                            <option value="W">여</option>
                        </select>
                    </div>
                    <div class="zipcode_area joinbox">
                        <input readonly name="zipcode" type="text" id="sample6_postcode" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" id="sample6_postcode_btn"
                            value="우편번호 찾기">
                    </div>
                    <div class="addr_area joinbox">
                        <input readonly name="useraddr" type="text" id="sample6_address" placeholder="주소">
                    </div>
                    <div class="joinbox">
                        <input name="useraddrdetail" type="text" id="sample6_detailAddress" placeholder="상세주소">
                    </div>
                    <div class="joinbox addr_area">
                        <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="useraddretc"
                               readonly disabled/>
                    </div>
                    <div class="info joinbox" id="userbirth">
                        <fieldset id="birth">
                            <legend class="birth">생년 월 일 선택</legend>
                            <input type="date" class="userbirth" name="userbirth">
                        </fieldset>
                    </div>
                    <div class="joinbox">
                        <input type="text" name="userphone" id="userphone" placeholder="핸드폰번호 입력" maxlength="13"
                            onkeyup="addHypen(this);" />
                        <input type="button" value="인증번호" id="userphone_btn">
                    </div>
                    <div class="joinbox">
                        <input type="text" name="check_number" id="userNum" placeholder="인증번호를 입력해주세요">
                        <input type="button" value="인증확인" id="correct_check">
                    </div>
                    <div class="btn-submit joinbox">
                        <input type="submit" value="회원가입" id="login-form-submit"></input>
                    </div>
                </form>
            </div>
            </div>
        </section>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    const cp = "${cp}";
 </script>
 <script>
 /* var code2= "";
 $('#userphone_btn').click(function() {
     const userphone = $('#userphone').val();
       const xhr = new XMLHttpRequest();
       if(userphone == ""){
       alert("핸드폰 번호를 입력하세요 !");
       userid.focus();
       return false;
    }
    else if(userphone.length == 13){
    xhr.onreadystatechange = function(){
       if(xhr.readyState == 4){
          if(xhr.status == 200){
             let txt = xhr.responseText;
             txt = txt.trim();
             if(txt == "O"){
                alert("사용할 수 있는 번호");
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
             }
             else{
                alert("이미 가입된 번호입니다.")
                userphone.value = "";
                userphone.focus();
             }
          }
       }
    }
    }else {
        alert('휴대폰번호를 정확하게 입력해주세요 !')
    } 
    xhr.open("GET",cp+"/user/checkphoneok?userphone="+userphone,true);
    xhr.send();
 }); */
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
       xhr.onreadystatechange = function(){
              if(xhr.readyState == 4){
                 if(xhr.status == 200){
                    let txt = xhr.responseText;
                    txt = txt.trim();
                    if(txt == "O"){
                       alert("사용할 수 있는 번호");
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
                    }
                    else{
                       alert("이미 가입된 번호입니다.")
                       userphone.value = "";
                       userphone.focus();
                    }
                 }
              }
           } 
    }else {
        alert('휴대폰번호를 정확하게 입력해주세요 !')
    } 
    xhr.open("GET",cp+"/user/checkphoneok?userphone="+userphone,true);
    xhr.send();
 });
 
 function lendit() {
       // 필수 입력항목들의 값을 가져옴
       var userid = document.getElementById("userid-field").value;
       var userpw = document.getElementById("userpw-field").value;
       var userpw_re = document.getElementById("userpw_re").value;
       var username = document.getElementById("username").value;
       var gender = document.querySelector(".gender").value;
       var zipcode = document.getElementById("sample6_postcode").value;
       var useraddr = document.getElementById("sample6_address").value;
       var useraddrdetail = document.getElementById("sample6_detailAddress").value;
       var userbirth = document.querySelector(".userbirth").value;
       var userphone = document.getElementById("userphone").value;
       var check_number = document.getElementById("userNum").value;
       var result = document.getElementById("result");

       // 필수 입력항목들의 유효성을 검사
       if (userid == "") {
           alert("아이디를 입력하세요");
           return false;
       }
       
       if(result.innerHTML == "중복된 아이디가 있습니다!"){
           alert("중복체크 통과 후 가입이 가능합니다!");
           userid.focus();
           return false;
        }
       
       if(result.innerHTML == "&nbsp;"){
          alert("아이디 중복검사를 진행해주세요!");
          userid.focus();
          return false;
       }

       if (userpw == "") {
           alert("비밀번호를 입력하세요");
           return false;
       }

       if (userpw_re == "") {
           alert("비밀번호 확인을 입력하세요");
           return false;
       }
       const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
       if(!reg.test(userpw)){
          alert("비밀번4호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 하나 이상 포함해야 합니다!");
          return false;
       }

       if (userpw != userpw_re) {
           alert("비밀번호가 일치하지 않습니다");
           return false;
       }

       if (username == "") {
           alert("이름을 입력하세요");
           return false;
       }
       const exp_name = /^[가-힣]+$/;
       if(!exp_name.test(username)){
           alert("이름에는 한글만 입력하세요!");
           username.focus();
           return false;
       }

       if (gender == "") {
           alert("성별을 선택하세요");
           return false;
       }

       if (zipcode == "") {
           alert("우편번호를 입력하세요");
           return false;
       }

       if (useraddr == "") {
           alert("주소를 입력하세요");
           return false;
       }

       if (useraddrdetail == "") {
           alert("상세주소를 입력하세요");
           return false;
       }

       if (userbirth == "") {
           alert("생년월일을 선택하세요");
           return false;
       }

       if (userphone == "") {
           alert("핸드폰번호를 입력하세요");
           return false;
       }

       if (check_number == "") {
           alert("인증번호를 입력하세요");
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