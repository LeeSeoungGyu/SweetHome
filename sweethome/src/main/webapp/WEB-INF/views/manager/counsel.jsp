<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
   <link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
</head>
<style>
#wrapper {
   margin: 0 auto;
   height: 700px !important;
}

#head>td {
   font-weight: bold !important;
   color: floralwhite !important;
}

td {
   color: rgb(76, 75, 75) !important;
   border-bottom: 1px solid mediumseagreen !important;
}

#table {
   margin: 0 auto;
   width: 80%;
   text-align: center;
}

#counsel_title {
   text-decoration: none !important;
}

#counsel_title:hover {
   color: black;
}

footer {
   clear: both;
}

.page-link {
   color: mediumseagreen;
}

.page-item {
   display: inline-block;
   font-size: 110%;
   border: 1px solid rgba(128, 128, 128, 0.386);
   padding: 0.2% 1% 0.2% 1% !important;
   list-style: none;
   border-radius: 50%;
}

.page {
   width: 100%;
   height: 100px;
   margin-top: 2% !important;
}

.pagination {
   height: 100px;
   padding: 0 !important;
   text-align: center !important;
}

#previous {
   border-radius: 50%;
}

#next {
   border-radius: 50%;
}

.page-link:hover {
   color: rgb(37, 156, 152);
}

.page-item:hover {
   background-color: rgba(128, 128, 128, 0.136);
}

section>div.inner {
   margin: 0 auto !important;
   text-align: center;
}

.search {
   width: 80% !important;
   margin: 3% 10% 0% 10% !important;
   text-align: center;
}

.donate_name {
   border: 1px solid mediumseagreen;
   border-radius: 20px;
   padding: 1% 0% 1% 2%;
   color: black !important;
   background-color: floralwhite;
}

input::placeholder {
   color: gray !important;
   text-align: center !important;
}

table tbody tr:nth-child(1) {
   background-color: mediumseagreen !important;
}
</style>
<body class="is-preload">
    <!-- Header -->
   <header id="header">
      <div id="logobox"><a href="${cp}/" class="title" id="logo_"><img src="${cp}/resources/images/sweethome.png" alt="??????"
               id="logo"></a></div>
      <c:if test="${user.userid != null}">
         <div id="mypage">
            <a href=""><img src="${cp}/resources/images/${userphoto}" alt="" id="myprofile"></a>
            <h5 id="welcome">???????????????! <br>${user.username}???</h5>
         </div>
         <div class="dropdown help" onmouseover="helphover()" onmouseout="helphoverout()">
            <div class="dropbtn" id="help">MENU</div>
                  <div class="dropdown-content">
                     <a href="#">????????????</a>
                     <a href="#">????????????</a>
                     <a href="${cp}/user/mypage">???????????????</a>
                     <a href="${cp}/user/basket">??????????????????</a>
                     <a href="${cp}/user/order">????????????</a>
                     <c:if test="${user.userid.equals('manager')}">
                        <a href="${cp}/reserv/counsel?date=${today}">???????????????</a>
                       </c:if>
                  </div>
               </div>
            <div id="logout">
               <a href="${cp}/user/logout"><input type="button" value="????????????"></a>
            </div>
      </c:if>         
   </header>
   
   <div id="wrapper">
      <section id="main" class="wrapper">
         <div class="inner">
            <h1 class="major" style="color: mediumseagreen; text-align: left;">????????????
               ??????</h1>
         </div>
      </section>
      <div>
         <input type="date" name="" id="datepicker"
            style="width: 15% !important; margin-left: 8% !important;" value="${selectdate}">
      </div>
      <div class="table_zone">
         <table id="table">
            <tr id="head">
               <td>?????????</td>
               <td>????????????</td>
            </tr>
            <c:if test="${list != null and list.size() > 0 }">
            <c:forEach items="${list}" var="counsel">
               <tr>
                  <td>${counsel.userid}</td>
                  <td>${counsel.reservtime}</td>
               </tr>
            </c:forEach>
            </c:if>
              <c:if test="${list == null or list.size() le 0 }">
              <tr>
                 <td colspan=2> ?????? ????????? ????????????.</td>
              </tr>
              </c:if>
         </table>
      </div>
   </div>
   <!-- Footer -->
   <footer id="footer" class="wrapper alt">
      <div class="inner" style="margin: 0 auto;">
         <div id="external_link">
            <div id="twitter">
               <a href="https://twitter.com"><img src="${cp}/resources/images/?????????.png"
                  alt="" id="twitter_pic"></a>
            </div>
            <div id="facebook">
               <a href="https://facebook.com"><img src="${cp}/resources/images/????????????.png"
                  alt="" id="facebook_pic"></a>
            </div>
            <div id="instagram">
               <a href="https://instagram.com"><img src="${cp}/resources/images/???????????????.png"
                  alt="" id="instagram_pic"></a>
            </div>
            <div id="youtube">
               <a href="https://youtube.com"><img src="${cp}/resources/images/?????????.png"
                  alt="" id="youtube_pic"></a>
            </div>
         </div>
         <ul class="menu">
            <li>????????????</li>
            <li>??????: ?????????</li>
            <li>????????????: sweethome@gmail.com</li>
            <li>????????????: 02-700-0000</li>
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
     
     $(document).ready(function() {$('#datepicker').change(function() {
        let date = $('#datepicker').val();
        console.log(date);
        window.location.href = "${cp}/reserv/counsel?date="+date;
             });
        });
   </script>
</html>