<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Untitled</title>
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
               </div>
            </div>
            <div id="logout">
				<a href="${cp}/user/logout"><input type="button" value="로그아웃"></a>
			</div>
	</header>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<section id="main" class="wrapper">
						<div class="inner">
							<h1 class="major">주문내역</h1>

		                            <form action="${cp}/user/modifyorder" method="post" name="orderform1" id="orderform1">
		                                <div class="row head" style="color: black;">
		                                    <div class="subdiv_">
		                                        <div class="ordernum_">주문번호</div>
		                                        <div class="img_">이미지</div>
		                                        <div class="pname_">상품명</div>
		                                        <div class="amount_">수량</div>
		                                        <div class="date_">날짜</div>
		                                        <div class="condition_">주문상태</div>
		                                    </div>
		                                </div>
		                                <div id="orderbasket">
		                                    <div id="orderproductline">
		                                        <div id="check_">
		                                            <label class="checkbox_">
		                                                <input type="checkbox" name="buy_">
		                                                <span class="checkmark_"></span>
		                                            </label>
		                                        </div>
		                                        <c:forEach begin="0" end="${ordernum.size()-1}" step="1" var="i">
		                                        	<div id="ordernum">
		                                            	<input type="checkbox" name="" id="">
		                                            	<h4>${ordernum.get(i)}</h4>
		                                        	</div>
		                                        </c:forEach>
		                                        <div id="propro">
		                                        	<c:forEach begin="0" end="${product.size()-1}" step="1" var="i">
			                                            <div id="orderproductphotos">
			                                                <div id="orderproductphoto">
			                                                    <img src="${cp}/resources/product/${product.get(i).productphoto}" alt="" id="realorderphoto">
			                                                </div>
			                                                <div id="orderproductinfo">${product.get(i).productname}</div>
			                                            </div>
		                                        	</c:forEach>
		                                        </div>
		                                        <div id="orderamount">수량 : 1</div>
		                                        <c:forEach begin="0" end="${order.size()-1}" step="1" var="i">
		                                        	<div id="orderdate">${order.get(i).orderdate}</div>
			                                        <div id="ordercondition">${order.get(i).p_condition}</div>
		                                        </c:forEach>
		                                    </div>
		                                </div>
		                                <div class="right-align basketrowcmd" style="text-align: center;">
											<input type="submit" value="취소하기" id="cancel" style="background-color: mediumseagreen; margin-top: 50px;">
										</div>
		                            </form>
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
</html>