<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="cp" scope="session" />
<!DOCTYPE html>
<html>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous">
   
</script>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<noscript>
   <link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
</noscript>

<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cp}/resources//assets/css/main.css" />
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
   
   <div id="alll">
      <section id="main" class="wrapper">
         <div class="inner" style="margin: 0 auto; color: mediumseagreen !important;">
            <h1 class="major">후원 및 후원내역</h1> 
         </div>
      </section>
      <div class="table_zone">
         <form>
            <div class="donate_search">
               <input type="search" name="" id="" class="donate_name"
                  placeholder="이름으로 검색해주세요.">
            </div>
            <table id="donate_table">
               <tr id="donate_title" style="background-color: mediumseagreen;">
                  <th style="color: black;">후원자</th>
                  <th style="color: black;">후원금액</th>
                  <th style="color: black;">비고</th>
               </tr>
               <c:if test="${list != null and list.size() > 0 }">
                  <c:forEach items="${list}" var="donate">
                     <tr class="donate_list">
                        <td id="content" class="content_black" style='border-bottom:1px solid mediumseagreen;'>${donate.name}</td>
                        <td id="content1" class="content_;black" style='border-bottom: 1px solid mediumseagreen; color:black;'><fmt:formatNumber
                              value="${donate.money}" pattern="###,###,###" />원</td>
                        <td id="content" class="content_black" style='border-bottom: 1px solid mediumseagreen;'>${donate.content}</td>
                     </tr>
                  </c:forEach>
               </c:if>
               <c:if test="${list == null or list.size() le 0 }">
                  <tr>
                     <td id="content" class="content_black"></td>
                     <td id="content1" class="content_black">후원 목록이 없습니다.</td>
                     <td id="content" class="content_black"></td>
                  </tr>
               </c:if>
            </table>
            <hr id="donate_line">
         </form>
         <div id="donate_action">
            <form>
               <input type="button" value="후원하기" class="donate_action"
                  data-bs-toggle="modal" data-bs-target="#exampleModal"
                  data-bs-whatever="@getbootstrap"
                  style="color: floralwhite; font-size: 130%;">
            </form>
         </div>
         <div class="modal fade modalcolor" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
               <div class="modal-content">
                  <div class="modal-header">
                     <h3 class="modal-title fs-5" id="exampleModalLabel">후원하기</h3>
                     <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                  </div>
                  <form name="donateForm" id="donateForm"
                     action="${cp}/user/donateaction" method="post" onsubmit="return sendit();">
                     <div class="modal-body">
                        <div class="mb-3">
                           <label for="recipient-name" class="col-form-label">이름</label> <input
                              type="text" class="form-control" id="recipient-name"
                              name="name">
                        </div>
                        <div class="mb-3">
                           <label for="recipient-name" class="col-form-label">후원금액</label>
                           <input type="text" class="form-control" id="recipient-money"
                              name="money"> <span class="span">원</span>
                        </div>
                        <div class="mb-3">
                           <label for="message-text" class="col-form-label">비고</label>
                           <textarea style="height: 250px;" class="form-control"
                              id="message-text" name="content"></textarea>
                        </div>
                        <input type="hidden" name="userid" value="">
                     </div>
                     <span class="span">후원해주셔서 감사합니다.</span>
                     <div class="modal-footer">
                        <button type="button" value="후원하기" class="j_button" id="kakao" onclick="paymentOk()">후원금 결제</button>
                        <button type="submit" class="j_button">완료</button>
                        <button type="button" class="j_button" data-bs-dismiss="modal">닫기</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <nav class="page1">
         <ul class="pagination1">
            <c:if test="${pageMaker.prev}">
               <li class="page-item1" id="previous" style="text-align: center;"><a style='color:mediumseagreen;' class="changePage"
                  href="${cp}/user/donate?pagenum=${pageMaker.startPage-1}&amount=${10}">
                     <span aria-hidden="true">&laquo;</span>
               </a></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
               var="i">
               <c:if test="${i == pageMaker.cri.pagenum}">
                  <li class="page-item1" style="color: blue;"><a class="changePage" id="${i}"
                     href="${cp}/user/donate?pagenum=${i}&amount=${10}"  onclick="return false;">${i}</a></li>
               </c:if>
               <c:if test="${i != pageMaker.cri.pagenum}">
                  <li class="page-item1"><a style='color:mediumseagreen;' class="changePage" id="${i}"
                     href="${cp}/user/donate?pagenum=${i}&amount=${10}">${i}</a></li>
               </c:if>
            </c:forEach>
            <c:if test="${pageMaker.next }">
               <li class="page-item1" id="next"><a style='color:mediumseagreen;' class="changePage"
                  href="${cp}/user/donate?pagenum=${pageMaker.endPage + 1}&amount=${10}">
                     <span aria-hidden="true">&raquo;</span>
               </a></li>
            </c:if>
         </ul>
      </nav>
   </div>
   <form name="pageForm" id="pageForm" action="${cp}/user/donate">
      <input type="hidden" value="${pageMaker.cri.pagenum}" name="pagenum">
      <input type="hidden" value="${pageMaker.cri.amount}" name="amount">
      <input type="hidden" value="${pageMaker.cri.type}" name="type">
      <input type="hidden" value="${pageMaker.cri.keyword}" name="keyword">
   </form>
   <!-- Footer -->
   <!-- Footer -->
   <footer id="footer" class="wrapper alt">
      <div class="inner" style="margin: 0 auto;">
         <div id="external_link">
            <div id="twitter">
               <a href="https://twitter.com"><img src="${cp}/resources/images/트위터.png"
                  alt="" id="twitter_pic"></a>
            </div>
            <div id="facebook">
               <a href="https://facebook.com"><img src="${cp}/resources/images/페이스북.png"
                  alt="" id="facebook_pic"></a>
            </div>
            <div id="instagram">
               <a href="https://instagram.com"><img src="${cp}/resources/images/인스타그램.png"
                  alt="" id="instagram_pic"></a>
            </div>
            <div id="youtube">
               <a href="https://youtube.com"><img src="${cp}/resources/images/유튜브.png"
                  alt="" id="youtube_pic"></a>
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
   var IMP = window.IMP;
   IMP.init("imp67338724");

   var today = new Date();
   var hours = today.getHours();
   var minutes = today.getMinutes();
   var seconds = today.getSeconds();
   var milliseconds = today.getMilliseconds();
   var makeMerchantUid = hours + minutes + seconds + milliseconds;
   var flag=false;
   function paymentOk() {
      var donatename = document.getElementById("recipient-name").value;
      var donatemoney = document.getElementById("recipient-money").value;
      console.log(donatemoney)
      IMP.request_pay({
         pg : 'kakaopay',
         merchant_uid : "IMP" + makeMerchantUid,
         name : '후원금',
         amount : donatemoney,
         buyer_name : donatename,
      }, function(rsp) {
         if (rsp.success) {
            console.log(rsp);
            console.log(today);
            alert("후원 해주셔서 감사합니다.");
            flag=true;
            console.log(flag);
         } else {
            console.log(rsp);
            var msg = '결제에 실패하였습니다.\n';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);

            console.log(flag);
         }
      });
   }
   
   
   function sendit() {
      const recipientName = document.querySelector('#recipient-name');
       if(!flag){
          alert('결제 후 완료를 눌러주세요 !')
          return false;
       }
        if (!recipientName.value) {
           recipientName.value = '익명';
         }
       return true;
}
</script>

</html>