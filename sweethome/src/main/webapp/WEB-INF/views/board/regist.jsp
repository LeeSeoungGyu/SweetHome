<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
</head>
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
<!-- Banner -->
   <div id="banner">
      <div class="wrapper style1 special">
         <div class="board" style="margin-top: 100px; height: 993px;" >
            <a href="${cp}/board/list${cri.listLink}" style="float:right; color: mediumseagreen;">목록 보기</a>
            <div class="write_area" style="clear:both;">
               <form name="boardForm" method="post" action="${cp}/board/regist">
                  <input type="hidden" name="boardnum" value="${board.boardnum}">
                  <input type="hidden" value="${cri.pagenum}" name="pagenum">
                  <input type="hidden" value="${cri.amount }" name="amount">
                  <input type="hidden" value="${cri.type }" name="type">
                  <input type="hidden" value="${cri.keyword }" name="keyword">
                  <div class="col-12" style="height:150px;">
                     <h4>제목</h4>
                     <input type="hidden" value="${user.userid}" name="userid">
                     <input name="boardtitle" type="text" value="${board.boardtitle}" id="titlediv">
                  </div>
                  <div class="col-12" style="height:600px;">
                     <h4>내용</h4>  
                     <textarea name="boardcontents" rows="10" id="contentdiv" style="height:500px; ">${board.boardcontents}</textarea>
                  </div>
                  <div style="width: 10%; margin:0 auto;">
                     <input type="submit" value="등록" class="" style="margin-top:10px; background-color: mediumseagreen;">
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
      <!-- Footer -->
   <footer id="footer" class="wrapper alt">
      <div class="inner" style="margin: 0 auto;">
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
   <script src="${cp}/resources/assets/js/jquery.dropotron.min.js"></script>
   <script src="${cp}/resources/assets/js/browser.min.js"></script>
   <script src="${cp}/resources/assets/js/breakpoints.min.js"></script>
   <script src="${cp}/resources/assets/js/util.js"></script>
   <script src="${cp}/resources/assets/js/main.js"></script>
</body>
</html>