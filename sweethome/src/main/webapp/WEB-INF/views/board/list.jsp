<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
<style>
</style>
</head>
<body class="skybody">
   <c:if test="${not empty s}">
      <script>
         alert("게시글 등록 성공!")
      </script>
   </c:if>
      <c:if test="${not empty f}">
      <script>
         alert("게시글 삭제 성공!")
      </script>
   </c:if>
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
      <div class="boardmain">
         <div class="board">
            <h1 class="heading alt" style="color:mediumseagreen;">커뮤니티</h1>
            <p>커뮤니티 목록</p>
            <a href="${cp}/board/regist${pageMaker.cri.listLink}" class="primarysky">글 등록</a>
            <div class="boardlist" style="clear: both;">
               <table>
                  <thead>
                     <tr id="skytr">
                        <th style="width:10%;" id="sky">번호</th>
                        <th style="width:40%;" id="sky">제목</th>
                        <th style="width:15%;" id="sky">작성자</th>
                        <th class="big-width" style="width:35%;" id="sky">작성시간</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:if test="${list != null and list.size() > 0 }">
                        <c:forEach items="${list}" var="board">
                           <tr>
                              <td id="sky">${board.boardnum}</td>
                              <td id="sky"><a href="${board.boardnum}" class="get">${board.boardtitle }</a></td>
                              <td id="sky">${board.userid }</td>
                              <td class="" id="sky">${board.regdate}</td>
                           </tr>
                        </c:forEach>
                     </c:if>
                     <c:if test="${list == null or list.size() le 0 }">
                        <tr style="height: 400px;width: 100%; background-color: floralwhite;">
                           <td colspan="4" class="big-width" id="sky">작성된 게시글이 없습니다.</td>
                        </tr>
                     </c:if>
                  </tbody>
               </table>
            </div>
            <form id="searchForm" action="${cp}/board/list" >
               <div  style="height:20px;">
                  <select name="type" id="selectsky"  >
                     <option value="" ${pageMaker.cri.type == null ? "selected" : ""}>검색 기준</option>
                     <option value="T" ${pageMaker.cri.type == "T" ? "selected" : ""}>제목</option>
                     <option value="C" ${pageMaker.cri.type == "C" ? "selected" : ""}>내용</option>
                     <option value="W" ${pageMaker.cri.type == "W" ? "selected" : ""}>작성자</option>
                     <option value="TC" ${pageMaker.cri.type == "TC" ? "selected" : ""}>제목 또는 내용</option>
                     <option value="TW" ${pageMaker.cri.type == "TW" ? "selected" : ""}>제목 또는 작성자</option>
                     <option value="TCW" ${pageMaker.cri.type == "TCW" ? "selected" : ""}>제목 또는 내용 또는 작성자</option>
                  </select>
                  <input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }">
                <a href="#" class="skysearch">검색</a>
               </div>
               <input type="hidden" value="1" name="pagenum">
               <input type="hidden" value="10" name="amount">
            </form>
            
            <div class="pagesky">
               <c:if test="${pageMaker.prev}">
                  <a class="changePage" href="${pageMaker.startPage-1}"><code>&lt;</code></a>
               </c:if>
               <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="i">
                  <c:if test="${i == pageMaker.cri.pagenum}">
                     <code class="nowPage">${i}</code>
                  </c:if>
                  <c:if test="${i != pageMaker.cri.pagenum }">
                     <a class="changePage" href="${i}"><code>${i}</code></a>
                  </c:if>
               </c:forEach>
               <c:if test="${pageMaker.next }">
                  <a class="changePage" href="${pageMaker.endPage+1}"><code>&gt;</code></a>
               </c:if>
            </div>
         </div>
      </div>
   </div>
   <form name="pageForm" id="pageForm" action="${cp}/board/list">
      <input type="hidden" value="${pageMaker.cri.pagenum }" name="pagenum">
      <input type="hidden" value="${pageMaker.cri.amount }" name="amount">
      <input type="hidden" value="${pageMaker.cri.type }" name="type">
      <input type="hidden" value="${pageMaker.cri.keyword }" name="keyword">
   </form>
   
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
<script>
   const searchForm = $("#searchForm")
   const pageForm = $("#pageForm")
   
   $(".changePage").on("click",function(e){
      //e(이벤트)의 기본 작동 막기
      e.preventDefault();
      let pagenum = $(this).attr("href");
      pageForm.find("input[name='pagenum']").val(pagenum);
      pageForm.submit();
   })
   $(".get").on("click",function(e){
      e.preventDefault();
      let boardnum = $(this).attr("href");
      pageForm.append("<input type='hidden' name='boardnum' value='"+boardnum+"'>")
      pageForm.attr("action","${cp}/board/get");
      pageForm.submit();
   })
   
   $("#searchForm a").on("click",sendit)
   function sendit(){
      /*
         if("") ---> if(false)
      */
      if(!searchForm.find("option:selected").val()){
         alert("검색 기준을 선택하세요!");
         return false;
      }
      if(!$("input[name='keyword']").val()){
         alert("키워드를 입력하세요!");
         return false;
      }
      searchForm.submit();
   }
</script>
</html>



