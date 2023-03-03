<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>따뜻한 세상, 스위트 홈</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
		<link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
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
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<section id="main" class="wrapper">
						<div class="inner">
							<h1 class="major">장바구니</h1>
							<c:choose>
								<c:when test="${product.size() > 0 }">
									<form action="${cp}/user/doorder" name="orderform" id="orderform" method="post" class="orderform" onsubmit="noBack();">
									<input type="hidden" value="${user.userid}" name="userid">
									<div class="row head" style="color: black;">
										<div class="subdiv">
											<div class="check">선택</div>
											<div class="img">이미지</div>
											<div class="pname">상품명 및 설명</div>
											<div class="num">수량</div>
											<div class="basketcmd">삭제</div>
										</div>
									</div>
									<c:forEach begin="0" end="${product.size()-1}" var="i" step="1">
									<c:if test="${product.get(i) != null}">
										<div class="basketdiv" id="basket">
											<div id="myproduct1">
												<div id="check">
													<label class="checkbox">
														<input type="checkbox" name="buy" onclick="basket.checkItem();">
														<span class="checkmark"></span>
													</label>
												</div>
												<div id="product_img">
													<img src="${cp}/resources/product/${product.get(i).productphoto}" alt="" id="product_img1">
												</div>
												<div id="product_name">
												<div id="product_name_contents">
													<h3 style="text-align: center;">${product.get(i).productname}</h3>
													<h5 style="text-align: center;">${product.get(i).productcontents}</h5>
												</div>
												</div>
												<div id="product_amount">
													<p>수량: 1</p>
													<input type="button" value="삭제" id="delete" onclick="basket.delItem();">
												</div>
											</div>
										</div>
									</c:if>
									</c:forEach>
									<div class="right-align basketrowcmd">
											<a href="javascript:void(0)" class="abutton" onclick="basket.delCheckedItem();">선택상품삭제</a>
											<a href="javascript:void(0)" class="abutton" onclick="basket.delAllItem();">장바구니비우기</a>
										</div>
									<div id="order">
										<input type="submit" value="주문하기" id="orderbutton">
									</div>
									</form>
								</c:when>
								<c:otherwise>
									<div id="nobasket">
										<h2>장바구니에 담긴 물품이 없습니다.</h2>
									</div>
								</c:otherwise>
							</c:choose>
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
<script>
history.pushState(null, null, "${cp}/user/basket");
window.onpopstate = function(event) {
	history.go(1);
};
	
let basket = {
	    totalCount: 0, 
	    totalPrice: 0,
	    //체크한 장바구니 상품 비우기
	    delCheckedItem: function(){
	        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
	            item.parentElement.parentElement.parentElement.remove();
	        });
	        //AJAX 서버 업데이트 전송
	    
	        //전송 처리 결과가 성공이면
	        this.reCalc();
	        this.updateUI();
	    },
	    //장바구니 전체 비우기
	    delAllItem: function(){
	        document.querySelectorAll('.basketdiv').forEach(function (item) {
	            item.remove();
	          });
	          //AJAX 서버 업데이트 전송
	        
	          //전송 처리 결과가 성공이면
	          this.totalCount = 0;
	          this.totalPrice = 0;
	          this.reCalc();
	          this.updateUI();
	    },
	    //재계산
	    reCalc: function(){
	        this.totalCount = 0;
	        this.totalPrice = 0;
	        document.querySelectorAll(".p_num").forEach(function (item) {
	            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
	                var count = parseInt(item.getAttribute('value'));
	                this.totalCount += count;
	                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                this.totalPrice += count * price;
	            }
	        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	    },
	    //화면 업데이트
	    updateUI: function () {
	        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
	        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
	    },
	    //개별 수량 변경
	    changePNum: function (pos) {
	        var item = document.querySelector('input[name=p_num'+pos+']');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        
	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

	        item.setAttribute('value', newval);
	        item.value = newval;

	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	        //AJAX 업데이트 전송

	        //전송 처리 결과가 성공이면    
	        this.reCalc();
	        this.updateUI();
	    },
	    checkItem: function () {
	        this.reCalc();
	        this.updateUI();
	    },
	    delItem: function () {
	        event.target.parentElement.parentElement.parentElement.remove();
	        this.reCalc();
	        this.updateUI();
	    }
	}
</script>
	</body>
</html>