<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${loginUser}" var="loginUser" scope="session"/>
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
			<div class="inner" id="inner">
				<h1 class="major">생필품 리스트</h1>
			<form action="${cp}/user/basket" method="post" name="orderForm" id="orderForm" class="orderForm">
				<div id="product_line1">
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(0).productphoto}" alt="" id="sanitary">
						<p>${product.get(0).productname}</p>
						<div id="control_amount">
                    		<input type='button' id="minus" onclick='count("minus")' value='ㅡ' />
                    		<input type="hidden" name="userid" value="${user.userid}">
                    		<input type="hidden" name="result" id="results">
                    		<input type="hidden" name="product1num" value="${product.get(0).productnum}">
							<div id="result">0</div>
							<input type='button' id="plus" onclick='count("plus")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(1).productphoto}" alt="" id="sanitary">
						<p>${product.get(1).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus1")' value='ㅡ' />
							<input type="hidden" name="result1" id="results1">
							<input type="hidden" name="product2num" value="${product.get(1).productnum}">
							<div id="result1">0</div>
							<input type='button' id="plus" onclick='count("plus1")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(2).productphoto}" alt="" id="sanitary">
						<p>${product.get(2).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus2")' value='ㅡ' />
							<input type="hidden" name="result2" id="results2">
							<input type="hidden" name="product3num" value="${product.get(2).productnum}">
							<div id='result2'>0</div>
							<input type='button' id="plus" onclick='count("plus2")' value='╉' />
						</div>
					</div>
				</div>
				<div id="product_line2">
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(3).productphoto}" alt="" id="sanitary">
						<p>${product.get(3).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus3")' value='ㅡ' />
							<input type="hidden" name="result3" id="results3">
							<input type="hidden" name="product4num" value="${product.get(3).productnum}">
							<div id='result3'>0</div>
							<input type='button' id="plus" onclick='count("plus3")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(4).productphoto}" alt="" id="sanitary">
						<p>${product.get(4).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus4")' value='ㅡ' />
							<input type="hidden" name="result4" id="results4">
							<input type="hidden" name="product5num" value="${product.get(4).productnum}">
							<div id='result4'>0</div>
							<input type='button' id="plus" onclick='count("plus4")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(5).productphoto}" alt="" id="sanitary">
						<p>${product.get(5).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus5")' value='ㅡ' />
							<input type="hidden" name="result5" id="results5">
							<input type="hidden" name="product6num" value="${product.get(5).productnum}">
							<div id='result5'>0</div>
							<input type='button' id="plus" onclick='count("plus5")' value='╉' />
						</div>
					</div>
				</div>
				<div id="product_line3">
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(6).productphoto}" alt="" id="sanitary">
						<p>${product.get(6).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus6")' value='ㅡ' />
							<input type="hidden" name="result6" id="results6">
							<input type="hidden" name="product7num" value="${product.get(6).productnum}">
							<div id='result6'>0</div>
							<input type='button' id="plus" onclick='count("plus6")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(7).productphoto}" alt="" id="sanitary">
						<p>${product.get(7).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus7")' value='ㅡ' />
							<input type="hidden" name="result7" id="results7">
							<input type="hidden" name="product8num" value="${product.get(7).productnum}">
							<div id='result7'>0</div>
							<input type='button' id="plus" onclick='count("plus7")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(8).productphoto}" alt="" id="sanitary">
						<p>${product.get(8).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus8")' value='ㅡ' />
							<input type="hidden" name="result8" id="results8">
							<input type="hidden" name="product9num" value="${product.get(8).productnum}">
							<div id='result8'>0</div>
							<input type='button' id="plus" onclick='count("plus8")' value='╉' />
						</div>
					</div>
				</div>
				<div id="product_line4">
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(9).productphoto}" alt="" id="sanitary">
						<p>${product.get(9).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus9")' value='ㅡ' />
							<input type="hidden" name="result9" id="results9">
							<input type="hidden" name="product10num" value="${product.get(9).productnum}">
							<div id='result9'>0</div>
							<input type='button' id="plus" onclick='count("plus9")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(10).productphoto}" alt="" id="sanitary">
						<p>${product.get(10).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus10")' value='ㅡ' />
							<input type="hidden" name="result10" id="results10">
							<input type="hidden" name="product11num" value="${product.get(10).productnum}">
							<div id='result10'>0</div>
							<input type='button' id="plus" onclick='count("plus10")' value='╉' />
						</div>
					</div>
					<div id="product1" class="scale">
						<img src="${cp}/resources/product/${product.get(11).productphoto}" alt="" id="sanitary">
						<p>${product.get(11).productname}</p>
						<div id="control_amount">
							<input type='button' id="minus" onclick='count("minus11")' value='ㅡ' />
							<input type="hidden" name="result11" id="results11">
							<input type="hidden" name="product12num" value="${product.get(11).productnum}">
							<div id='result11'>0</div>
							<input type='button' id="plus" onclick='count("plus11")' value='╉' />
						</div>
					</div>
				</div>
				<div id="go_box">
					<a href="${cp}/user/basket"><input type="submit" value="담기" id="go"></a>
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
	<script>
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById("result");
		  const result1Element = document.getElementById("result1");
		  const result2Element = document.getElementById("result2");
		  const result3Element = document.getElementById("result3");
		  const result4Element = document.getElementById("result4");
		  const result5Element = document.getElementById("result5");
		  const result6Element = document.getElementById("result6");
		  const result7Element = document.getElementById("result7");
		  const result8Element = document.getElementById("result8");
		  const result9Element = document.getElementById("result9");
		  const result10Element = document.getElementById("result10");
		  const result11Element = document.getElementById("result11");
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerHTML;
		  let number1 = result1Element.innerText;
		  let number2 = result2Element.innerText;
		  let number3 = result3Element.innerText;
		  let number4 = result4Element.innerText;
		  let number5 = result5Element.innerText;
		  let number6 = result6Element.innerText;
		  let number7 = result7Element.innerText;
		  let number8 = result8Element.innerText;
		  let number9 = result9Element.innerText;
		  let number10 = result10Element.innerText;
		  let number11 = result11Element.innerText;
		  
		  // 더하기/빼기
		  if(type === "plus") {
			  if (number < 1) {
			    	number = parseInt(number) + 1;
				}
				else{
					number = number;
			  		}
		    }
		  else if(type === "plus1"){
			   if (number1 < 1) {
					number1 = parseInt(number1) + 1;
				}
			   else{
				   number1 = number1;
			   	   }
		  	}
		  else if(type === "plus2"){
			  if (number2 < 1) {
			    number2 = parseInt(number2) + 1;
			}
			  else{
				  number2 = number2;
			  }
		  }
		  else if(type === "plus3"){
			  if (number3 < 1) {
			    number3 = parseInt(number3) + 1;
			}
			  else{
				  number3 = number3;
			  }
		  }
		  else if(type === "plus4"){
			  if (number4 < 1) {
			    number4 = parseInt(number4) + 1;
			}
			  else{
				  number4 = number4;
			  }
		  }
		  else if(type === "plus5"){
			  if (number5 < 1) {
			    number5 = parseInt(number5) + 1;
			}
			  else{
				  number5 = number5;
			  }
		  }
		  else if(type === "plus6"){
			  if (number6 < 1) {
			    number6 = parseInt(number6) + 1;
			}
			  else{
				  number6 = number6;
			  }
		  }
		  else if(type === "plus7"){
			  if (number7 < 1) {
			    number7 = parseInt(number7) + 1;
			}
			  else{
				  number7 = number7;
			  }
		  }
		  else if(type === "plus8"){
			  if (number8 < 1) {
			    number8 = parseInt(number8) + 1;
			}
			  else{
				  number8 = number8;
			  }
		  }
		  else if(type === "plus9"){
			  if (number9 < 1) {
			    number9 = parseInt(number9) + 1;
			}
			  else{
				  number9 = number9;
			  }
		  }
		  else if(type === "plus10"){
			  if (number10 < 1) {
			    number10 = parseInt(number10) + 1;
			}
			  else{
				  number10 = number10;
			  }
		  }
		  else if(type === "plus11"){
			  if (number11 < 1) {
			    number11 = parseInt(number11) + 1;
			}
			  else{
				  number11 = number11;
			  }
		  }
		  else if(type === 'minus')  {
			  if (number > 0) {
			    number = parseInt(number) - 1;
			}
			  else{
				  number = number;
			  }
		  }
		  else if(type === 'minus1')  {
			  if (number1 > 0) {
			    number1 = parseInt(number1) - 1;
			}
			  else{
				  number1 = number1;
			  }
		  }
		  else if(type === 'minus2')  {
			  if (number2 > 0) {
			    number2 = parseInt(number2) - 1;
			}
			  else{
				  number2 = number2;
			  }
		  }
		  else if(type === 'minus3')  {
			  if (number3 > 0) {
			    number3 = parseInt(number3) - 1;
			}
			  else{
				  number3 = number3;
			  }
		  }
		  else if(type === 'minus4')  {
			  if (number4 > 0) {
			    number4 = parseInt(number4) - 1;
			}
			  else{
				  number4 = number4;
			  }
		  }
		  else if(type === 'minus5')  {
			  if (number5 > 0) {
			    number5 = parseInt(number5) - 1;
			}
			  else{
				  number5 = number5;
			  }
		  }
		  else if(type === 'minus6')  {
			  if (number6 > 0) {
			    number6 = parseInt(number6) - 1;
			}
			  else{
				  number6 = number6;
			  }
		  }
		  else if(type === 'minus7')  {
			  if (number7 > 0) {
			    number7 = parseInt(number7) - 1;
			}
			  else{
				  number7 = number7;
			  }
		  }
		  else if(type === 'minus8')  {
			  if (number8 > 0) {
			    number8 = parseInt(number8) - 1;
			}
			  else{
				  number8 = number8;
			  }
		  }
		  else if(type === 'minus9')  {
			  if (number9 > 0) {
			    number9 = parseInt(number9) - 1;
			}
			  else{
				  number9 = number9;
			  }
		  }
		  else if(type === 'minus10')  {
			  if (number10 > 0) {
			    number10 = parseInt(number10) - 1;
			}
			  else{
				  number10 = number10;
			  }
		  }
		  else if(type === 'minus11')  {
			  if (number11 > 0) {
			    number11 = parseInt(number11) - 1;
			}
			  else{
				  number11 = number11;
			  }
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		  result1Element.innerText = number1;
		  result2Element.innerText = number2;
		  result3Element.innerText = number3;
		  result4Element.innerText = number4;
		  result5Element.innerText = number5;
		  result6Element.innerText = number6;
		  result7Element.innerText = number7;
		  result8Element.innerText = number8;
		  result9Element.innerText = number9;
		  result10Element.innerText = number10;
		  result11Element.innerText = number11;
		}
	</script>
<script>
  	$(document).ready(function(){
    $("form").submit(function(){
      	var result = $("#result").html();
      	$("#results").val(result);
    });
    $("form").submit(function(){
      	var result1 = $("#result1").html();
      	$("#results1").val(result1);
    });
    $("form").submit(function(){
      	var result2 = $("#result2").html();
      	$("#results2").val(result2);
    });
    $("form").submit(function(){
      	var result3 = $("#result3").html();
      	$("#results3").val(result3);
    });
    $("form").submit(function(){
      	var result4 = $("#result4").html();
      	$("#results4").val(result4);
    });
    $("form").submit(function(){
      	var result5 = $("#result5").html();
      	$("#results5").val(result5);
    });
    $("form").submit(function(){
      	var result6 = $("#result6").html();
      	$("#results6").val(result6);
    });
    $("form").submit(function(){
      	var result7 = $("#result7").html();
      	$("#results7").val(result7);
    });
    $("form").submit(function(){
      	var result8 = $("#result8").html();
      	$("#results8").val(result8);
    });
    $("form").submit(function(){
      	var result9 = $("#result9").html();
      	$("#results9").val(result9);
    });
    $("form").submit(function(){
      	var result10 = $("#result10").html();
      	$("#results10").val(result10);
    });
    
    $("form").submit(function(){
      	var result11 = $("#result11").html();
      	$("#results11").val(result11);
    });
  });
</script>
</body>
</html>