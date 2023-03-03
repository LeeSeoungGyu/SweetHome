<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" scope="session"/>
<c:set value="${loginUser}" var="loginUser" scope="session"/>
<% String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); %>
<c:set value="<%=Date%>" var="today" scope="session"/>
<!DOCTYPE HTML>
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
<head>
	<title>따뜻한 세상, 스위트 홈</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
	<link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
</head>
<body class="is-preload">
	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">인사말</a></li>
					<li><a href="#one">스위트 홈 이란?</a></li>
					<li><a href="#two">우리 단체가 하는 일</a></li>
					<li><a href="#three">찾아오시는 길</a>
					<c:if test="${user == null }">
					<li><a href="#four">로그인</a></li>
					</c:if>
					<c:if test="${user != null }">
					<li><a href="${cp}/user/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
		</div>
	</section>
	<!-- Wrapper -->
	<div id="wrapper">
		<div class="modal fade modalcolor" id="exampleModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
               <form name="counselForm" id="counselForm" action="${cp}/reserv/reservation"
                  method="post">
                  <div class="modal-body">
 					 <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">아이디</label> <input
                           type="text" class="form-control" id="recipient-name"
                           name="name" value="${user.userid}" readonly>
                     </div>
                     <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">예약 날짜</label>
                        <input type="date" class="userbirth" id="datepicker" name="date" min="${today}" max="2023-12-31"/>
                     </div>
                     <div id="time">
                     </div>
                     <div class="mb-3">
                        <label for="message-text" class="col-form-label">사연</label>
                        <textarea style="height: 250px;" class="form-control"
                           id="message-text" name="content"></textarea>
                     </div>
                     <input type="hidden" name="userid" value="${loginUser}">
                  </div>
                  <div class="modal-footer">      
                     <button type="submit" class="j_button">신청 완료</button>
                     <button type="button" class="j_button" data-bs-dismiss="modal">닫기</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>SweetHome</h1>
				<p>가출 청소년을 지원하는 자선단체 스위트홈 홈페이지에 오신 것을 환영합니다.<br /></p>
				<ul class="actions">
					<li><a href="#one" class="button scrolly" id="toWhoareUs">더 알아보기</a></li>
				</ul>
			</div>
		</section>

		<!-- One -->
		<section id="one" class="wrapper style2 spotlights">
			<section>
				<div id="dormitory">
					<img src="${cp}/resources/images/기숙사.jpg" alt="" data-position="center center" id="dormitoryphoto" />
				</div>
				<div class="content">
					<div class="inner" style="color: black;">
						<h2>"아이들의 쉼터"</h2>
						<p>가정폭력에 노출되는 등 어떤 장소보다 따뜻해야 할 장소인 집에서 보호 받을 수 없는 청소년들을 위해 무료로 쉼터를 제공하고 있습니다.</p>
					</div>
					   <div id="counsel_action">
                     <form>
                        <input type="button" value="상담 예약" class="button"
                           data-bs-toggle="modal" data-bs-target="#exampleModal"
                           data-bs-whatever="@getbootstrap"
                           style="color: floralwhite; background-color: mediumseagreen;">
                     </form>
                  </div>
				</div>
			</section>
			<section id="one">
				<div id="foryou">
					<img src="${cp}/resources/images/건네주는.jpg" alt="" data-position="top center" id="foryouphoto" />
				</div>
				<div class="content">
					<div class="inner">
						<h2>"생필품 지원"</h2>
						<p>경제활동이 불가능한 아이들에게 도움이 되는 약속하는 생필품을 무료로 지원하고 있습니다.</p>
						<ul class="actions">
							<li><a href="${cp}/user/shopping" class="button" id="doOrder">생필품 주문</a></li>
						</ul>
					</div>
				</div>
			</section>
			<section id="one">
				<div id="commu">
					<img src="${cp}/resources/images/커뮤니티.jpg" alt="" data-position="25% 25%" id="communityphoto" />
				</div>
				<div class="content">
					<div class="inner">
						<h2>서로간의 소통</h2>
						<p>같은 처지의 놓인 아이들이 서로에게 힘이 될 수 있도록 국내 청소년 지원 단체 중 최대 규모의 커뮤니티를 개설 및 관리하여 서로 간 도움이 될 수 있게끔 하고
							있습니다.</p>
						<ul class="actions">
							<li><a href="${cp}/board/list" class="button" id="doCommu">커뮤니티 이동</a></li>
						</ul>
					</div>
				</div>
			</section>
		</section>
		<!-- Two -->
		<section id="two" class="wrapper style3 fade-up">
			<div class="inner">
				<h2>여러분의 후원으로 청소년들의 미래를 만들어주세요.</h2>
				<p>
					평범한 일상이 간절한 아이들에게 그들이 올바른 길로 나아갈 수 있도록 도와주세요.<br>
					여러분의 후원은 청소년들이 바른 어른으로 자랄 수 있는 힘이 됩니다.
				</p>
				<div class="features">
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/man1.jpg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>허우진</h3>
						<p style="color: black;">"저도 청소년 시절 방황하던 시기가 있었습니다. 얼마나 위험하고 힘든 환경에 놓일지 알기 때문에 그들에게 미약하게 나마 안전하게 성장할 수 있는 발판을 마련해주고
							싶습니다."</p>
					</section>
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/girl1.jpg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>이수진</h3>
						<p style="color: black;">"덜컥 두려움이 앞서는 낯선 변화들<br>어른이 되어가는 과정이<br>삶의 불행한 순간이 되지 않도록,<br>아이들에게 따스한 빛이 되어주세요."</p>
					</section>
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/man2.jpg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>이경진</h3>
						<p style="color: black;">"건강하지 못한 가정에서 자랄 수 밖에 없는 청소년들이 생각하는 것 보다 많습니다. 그 끔찍한 가정환경으로 나온 청소년들에게 더욱 비참한 현실이 존재한다는 것을 알기에
							아이들이 안전하게 머물 수 있도록 후원합니다."</p>
					</section>
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/girl2.jpeg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>류수아</h3>
						<p style="color: black;">"아이가 방황하던시기 걱정과 우려와는 달리 스위트홈을 통해 안전하고 건강하게 방황을 마쳤습니다. 받은 은혜를 환원하고 똑같은 환경에 놓인 아이들이 안전한 환경에서 머물
							수 있도록 도와주고 싶습니다."</p>
					</section>
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/man3.jpg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>배준태</h3>
						<p style="color: black;">"작은 후원이 모여 한명 한명을 인생의 갈림길에서 도와줄 수 있다고 생각해 후원했습니다."</p>
					</section>
					<section>
						<span class="icon solid major" style="background-image: url(${cp}/resources/images/girl3.jpg); background-repeat : no-repeat;
						background-size : cover;"></span>
						<h3>조유진</h3>
						<p style="color: black;">"새로운 꿈을 꾸는 새해입니다. 2023년의 출발선에서 여러분이 희망의 천사가 되어주신다면 아이들에게 큰 도움이 될 수 있습니다."</p>
					</section>
				</div>
				<ul class="actions">
					<li><a href="${cp}/user/donate" class="button" style="background-color: mediumseagreen;">후원하러 가기</a></li>
				</ul>
			</div>
		</section>
		<!-- shop-->
		
		<!-- three -->
      	<section id="three" class="wrapper style2 spotlights">
			<div class="inner" style="height: 1500px !important;">
				<h2>찾아오시는 길</h2>
				<div id="map" style="width: 70%; height: 30%; margin-left: 10%;"></div>
				<div>
					<img alt="" src="${cp}/resources/images/mapexplain.png" style="margin-left: 120px; width: 70%; height: 650px; text-align: center;">
				</div>
			</div>
		</section>
         <!-- 7818938cd5803cd1ddd17927327a20b1 -->
		<!-- Three -->
		<c:if test="${user == null}">
			<section id="four" class="wrapper style1 fade-up">
				<div class="inner">
					<a href="javascript:kakaoLogin();"><img
						src="${cp}/resources/images/kakaologin.png" style="width: 250px; position: absolute; bottom: 300px;"></a>
					<h2>로그인</h2>
					<div class="split style1">
						<section>
							<form method="post" action="${cp}/user/login" name="loginForm" onsubmit="return validateForm()") >
								<div class="fields">
									<div class="field half">
										<label for="name" style="color: mediumseagreen;">아이디</label> <input
											type="text" name="userid" id="name"
											style="border: 1px solid mediumseagreen; color: black;" />
									</div>
									<div class="field half">
										<label for="email" style="color: mediumseagreen;">비밀번호</label>
										<input type="password" name="userpw" id="email"
											style="border: 1px solid mediumseagreen; color: black;" />
									</div>
								</div>
								<ul class="actions">
									<li><a href="#" id="loginsubmit" class="button submit"
										style="background-color: mediumseagreen;">로그인</a></li>
									<li><a href="${cp}/user/join" class="button"
										style="background-color: mediumseagreen;">회원가입</a></li>
									<li><a href="${cp}/user/checkid" class="button"
										style="background-color: mediumseagreen;">id/pw찾기</a></li>
								</ul>
							</form>
						</section>
						<section>
							<ul class="contact">
								<li>
									<h3 style="color: mediumseagreen;">Address</h3>
									<span style="color: black;">서울시 강남구 테헤란로<br />
										36길 285<br />
										스위트홈 청소년 보금자리 제단</span>
								</li>
								<li>
									<h3 style="color: mediumseagreen;">Email</h3>
									<a href="#" style="color: black;">sweethome@gmail.com</a>
								</li>
								<li>
									<h3 style="color: mediumseagreen;">Phone</h3>
									<span style="color: black;">02-700-0000</span>
								</li>
								<li>
									<h3 style="color: mediumseagreen;">SNS</h3>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter" style="color: black;"><span
													class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f" style="color: black;"><span
													class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-github" style="color: black;"><span
													class="label">GitHub</span></a></li>
										<li><a href="#" class="icon brands fa-instagram" style="color: black;"><span
													class="label">Instagram</span></a></li>
									</ul>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</section>
		</c:if>
	</div>
	<!-- Scripts -->
	<script src="${cp}/resources/assets/js/jquery.min.js"></script>
	<script src="${cp}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="${cp}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="${cp}/resources/assets/js/browser.min.js"></script>
	<script src="${cp}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${cp}/resources/assets/js/util.js"></script>
	<script src="${cp}/resources/assets/js/main.js"></script>
	

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	const cp = "${cp}";
</script>
<script>
        //7818938cd5803cd1ddd17927327a20b1

         Kakao.init('7818938cd5803cd1ddd17927327a20b1');

function kakaoLogin() {
	
    Kakao.Auth.login({
        success: function(response) {
            Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: (response) => {
                	var kakaoid = response.id+"K";
                    $.ajax({
    					type : "get",
    					url : '${cp}/user/overlapidok', // ID중복체크를 통해 회원가입 유무를 결정한다.
    					data : {"userid":kakaoid},
    					dataType:"json",
    					success : function(json){   
    						 console.log(json);
    						if(json.idExists){
    							// 존재하는 경우 로그인 처리
    							createHiddenLoginForm(kakaoid);
    							
    						} else{
    							// 회원가입
    							$.ajax({
    								  type: "post",
    								  url: '${cp}/user/kakaoSignUp',
    								  data: {"userid": kakaoid,"username": response.properties.nickname,"email": response.kakao_account.email},
    								  dataType: "JSON", // 반환 데이터가 HTML 형식임을 명시
    								  success: function(response) {
    									  console.log('response');
    								    if (response.trim() == "O") {
    								      // 로그인
    								      createHiddenLoginForm(kakaoid);
    								    } else {
    								      alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
    								    }
    								  },
    								  error: function(request, status, error) {
    								    alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
    								  }
    								});
    						}						
    					},
    					error: function(request, status, error){
    		                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    		                }
    				});
                }
            });
            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
        },
        fail: function(error) {
            alert(error);
        }
    });
}

function createHiddenLoginForm(kakaoId){
	
	var frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', '/member/kakaoLogin.go');
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','userid');
	hiddenInput.setAttribute('value',kakaoId);
	frm.appendChild(hiddenInput);
	document.body.appendChild(frm);
	frm.submit();
	
}
    </script>
<script>
 function validateForm() {
  var userid = document.forms["loginForm"]["userid"].value;
  if (userid == "") {
    alert("사용자 ID를 입력해주세요.");
    return false;
  }
} 
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7818938cd5803cd1ddd17927327a20b1"></script>


<script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
<script>
$(document).ready(function() {$('#datepicker').change(function() {
    let date = $('#datepicker').val();
    console.log(date);
    $('#time').empty();
    for (let i = 9; i <= 17; i++) {
       let startHour = i.toString().padStart(2,'0');
       let endHour = (i + 1).toString().padStart(2,'0');
       let time = (startHour+":00 - "+endHour+":00");
       console.log(i);
       console.log(startHour);
       console.log(endHour);
       console.log(time);
       let checkbox = $("<label for='"+startHour+"' style='color:black; width:20%;  margin:0 2%; display:inline-block;'><input style='width:10%; color:red; appearance:auto; opacity:inherit; float:inherit;' type='checkbox' name='time' id='"+startHour+"' value="+"'"+time+"'"+">"+time+"</label>");
       console.log(checkbox);

       $('#time').append(checkbox);
           $.ajax({
                url :'${cp}/reserv/checktime',
                method : 'POST',
                data : {
                   date : date,
                   time : time,
                },
                success : function(
                      data) {
                      console.log(data);                                                   
                   if (data == "true") {
                      console.log(true);
                      checkbox.find('input').prop('disabled', true);
                   }
                   else{
                      console.log(false);
                      checkbox.find('input').prop('disabled', false);
                   }
                }
             }); 
          }
       });
  });
$(document).on('click', "input[type='checkbox']", function(){
    if(this.checked) {
        const checkboxes = $("input[type='checkbox']");
        for(let ind = 0; ind < checkboxes.length; ind++){
            checkboxes[ind].checked = false;
        }
        this.checked = true;
    } else {
        this.checked = false;
    }
});


    </script>
    <script>
    const form = document.querySelector('#counselForm');
    const recipientName = document.querySelector('#recipient-name');

    form.addEventListener('submit', (event) => {
      if (!recipientName.value) {
        event.preventDefault();
        alert('로그인 후 이용해주세요.');
      }
    });
    </script>
</html>