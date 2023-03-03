<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML>
<html>
    <style>
        h2 {
            text-align: center;
        }

        input {
            color: black !important;
        }

        /* 이승규 css수정파일 공용 */
        input::placeholder {
            color: #000 !important;
        }

        input::-webkit-input-placeholder {
            color: #000;
        }

        input:-ms-input-placeholder {
            color: #000;
        }

        label {
            color: black !important;
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

    <head>
        <title>Untitled</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
       <link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
    </head>

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
                    <h1 class="major">비밀번호 변경 페이지</h1>
                </div>
            </section>
        </div>
        <div id="all">
            <form action="${cp}/user/updatepw" name="joinForm" method="post" onsubmit="return pwcheck();">
                <br><br><br>
                    <input type="hidden" name="userid" id="userid" value="${userid}">
                    <div class="idsearchbox">
                        <label for="userpw">변경할 비밀번호</label>
                        <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요" style="border:  2px solid #3cb371 !important;"/>
                    </div>
                    <div class="idsearchbox">
                        <label for="userpw_re">비밀번호 확인</label></th>
                        <input type="password" name="userpw_re" id="userpw_re" placeholder="비밀번호 확인" style="border:  2px solid #3cb371 !important;" />
                    </div>
                    <div class="idsearchbox pwsubmit">
                        <input type="submit" value="변경하기" id="submit">
                    </div>
                    <br>
            </form>
        </div>


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
        function pwcheck() {

            const joinForm = document.joinForm;

            const userpw = joinForm.userpw;
            const userpw_re = joinForm.userpw_re;
            if (userpw.value == "") {
                alert("비밀번호를 입력하세요!");
                userpw.focus();
                return false;
            }
            const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
            if (!reg.test(userpw.value)) {
                alert("비밀번4호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 하나 이상 포함해야 합니다!");
                return false;
            }
            if (/(\w)\1\1\1/.test(userpw.value)) {
                alert("같은 문자를 4번 연속해서 사용할 수 없습니다!")
                userpw.focus();
                return false;
            }
            if (userpw.value.search(/\s/) != -1) {
                alert("비밀번호는 공백을 포함할 수 없습니다!");
                userpw.focus();
                return false;
            }
            if (userpw_re.value == "") {
                alert("비밀번호 확인을 해주세요!");
                userpw_re.focus();
                return false;
            }
            if (userpw.value != userpw_re.value) {
                alert("비밀번호 확인을 다시 해주세요!");
                userpw.focus();
                return false;
            }
            return true;
        }
    </script>
    </html>