<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
   <title>Untitled</title>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="${cp}/resources/assets/css/main.css" />
   <link rel="stylesheet" href="${cp}/resources/assets/css/noscript.css" />
   
</head>
<style>
   input{
        color: black !important;
    }
   #certificationNum{
   position: absolute;
   right: 2%;
   top: 4%;
}
   input[type="submit"]{
   font-size: 0.64em;
   }
   #userNum{
   float: none;
   }
   #userpw_re, #username{
   height: 2.75em;
   }
</style>
<body class="is-preload">
<c:if test="${not empty z}">
      <script>
         alert("프로필 사진이 성공적으로 바뀌었습니다!")
      </script>
   </c:if>
   <c:if test="${not empty c}">
      <script>
         alert("프로필 사진 변경에 실패하였습니다. 다시 시도해주세요!")
      </script>
   </c:if>
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
            <h1 class="major">마이페이지</h1>
            <div id="left_area">
               <form name="photoForm" id="photoForm" action="${cp}/user/adduserphoto" method="post" enctype="multipart/form-data">
                  <fieldset id="myprofilefield" style="margin-bottom: 20px; height:455px;">
                     <legend style="color: black; font-weight: bold;">PROFILE IMAGE</legend>
                     <table>
                        <tr>
                           <td>
                              <div id="myprofile_img">
                                 <img alt="" src="${cp}/resources/images/${userphoto}" id="userphoto" style="height:350px;">
                              </div>
                              <div class="filebox">
                                 <label for="ex_file" id="uploadbutton" style="margin-left:-15px;">업로드</label>
                                 <input type="file" id="ex_file" name="userphoto"
                                    accept=".jpg, .png, .jpeg, .gif">
                              </div>
                             <input type="hidden" name="userid" id="userid" value="${user.userid}">
                              <input type="submit" value="수정하기" id="modify" onclick="sendit()" style="margin-left:-8px; margin-top:-5px;">
                           </td>
                        </tr>
                     </table>
                  </fieldset>
                   </form>
                  <fieldset id="myinfofield" style="margin-bottom: 800px;">
                     <legend style="color: black; font-weight: bold;">INFO</legend>
                     <table>
                        <tr>
                           <th><label for="username" style="color: black;">이름</label></th>
                           <td>
                              <input type="text" name="username" id="username" value="${user.username}" readonly disabled
                                 style="border: 1px solid mediumseagreen; color: black;" />
                        </tr>
                        <tr>
                           <th><label for="userid" style="color: black;">아이디</label></th>
                           <td>
                              <input type="text" name="userid" id="userid" value="${user.userid}" readonly disabled
                                 style="border: 1px solid mediumseagreen; color: black;" />
                           </td>
                        </tr>
                        <tr>
                     </table>
                  </fieldset>
            </div>
            <div id="right_area">
               <form name="joinForm" action="${cp}/user/updatephone" method="post" onsubmit="return sendphone();">
               <fieldset id="phonefield" style="margin-bottom: 292px;">
                  <input type="hidden" name="userid" value="${user.userid}">
                  <legend style="color: black; font-weight: bold;">PHONE</legend>
                  <table>
                     <tr>
                        <th><label for="userphone" style="color: black;">휴대폰번호</label></th>
                        <td>
                           <input type="text" name="userphone" id="userphone" onkeyup="addHypen(obj)" maxlength="13" placeholder="핸드폰번호" style="border: 1px solid mediumseagreen; width: 50%; float:none; margin-bottom: 0px" />
                           <input type="button" value="인증번호" id="certificationNum"/>
                        </td>
                     </tr>
                     <tr>
                        <th><label for="userid" style="color: black;">인증번호</label></th>
                        <td>
                           <input type="text" name="check_number" id="userNum" placeholder="인증번호" style="border: 1px solid mediumseagreen; width: 50%;"/>
                           <input type="button" value="인증확인" id="certificationVerify"/>
                           <input type="submit" value="변경" id="modification" style="background-color: mediumseagreen; color: black;"/>
                        </td>
                     </tr>
                  </table>
               </fieldset>
               </form>
               <form name="joinForm" action="${cp}/user/mypagechangepw" method="post" onsubmit="return sendpw();">
               <input type="hidden" name="userid" value="${user.userid}">
               <fieldset id="passwordfield" style="margin-bottom: 156px;">
                  <legend style="color: black; font-weight: bold;">PASSWORD</legend>
                  <table>
                     <tr>
                        <th><label for="userpw" style="color: black;">현재 비밀번호</label></th>
                        <td>
                           <input type="password" name="correntpw" id="userpw" style="border: 1px solid mediumseagreen; color: black;"/>
                        </td>
                     </tr>
                     <tr>
                        <th><label for="userpw" style="color: black;">비밀번호</label></th>
                        <td>
                           <input type="password" name="userpw" id="changepw" style="border: 1px solid mediumseagreen; color: black;"/>
                        </td>
                     </tr>
                     <tr>
                        <th><label for="userpw_re" style="color: black;">비밀번호 확인</label></th>
                        <td>
                           <input type="password" name="userpw_re" id="userpw_re" onkeyup="pwcheck()" style="border: 1px solid mediumseagreen;"/>
                           <input type="submit" value="변경" id="modification1" style="background-color: mediumseagreen; color: black;"/>
                        </td>
                     </tr>
                  </table>
               </fieldset>
               </form>
               <form name="joinForm" action="${cp}/user/updateaddr" method="post" onsubmit="return sendit();">
               <fieldset id="addressfield" style="border: 2px solid mediumseagreen; margin-bottom: 30px;">
                  <legend style="color: black; font-weight: bold;">ARRDRESS</legend>
                  <table>
                     <tr class="zipcode_area">
                        <th style="color: black;">우편번호</th>
                        <td>
                           <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipcode"
                              value="${user.zipcode}" onclick="sample6_execDaumPostcode()" style="color: black; border: 1px solid mediumseagreen; margin-bottom: 40px; width: 50%;"/>
                           <input type="button" value="우편번호" onclick="sample6_execDaumPostcode()" id="sample6_postcode_btn"/>
                        </td>
                     </tr>
                     <tr class="addr_area">
                        <th style="color: black;">주소</th>
                        <td>
                           <input type="text" id="sample6_address" placeholder="주소" name="useraddr" value="${user.useraddr}"
                              readonly style="color: black; border: 1px solid mediumseagreen; margin-bottom: 40px;"/>
                        </td>
                     </tr>
                     <tr>
                        <th style="color: black;">상세주소</th>
                        <td>
                           <input type="text" id="sample6_detailAddress" placeholder="상세주소" value="${user.useraddrdetail}"
                              name="useraddrdetail" style="color: black; border: 1px solid mediumseagreen; margin-bottom: 40px;"/>
                        </td>
                     </tr>
                     <tr>
                        <th style="color: black;">참고항목</th>
                        <td>
                           <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="useraddretc"
                              value="${user.useraddretc}" readonly disabled style="color: black; border: 1px solid mediumseagreen; margin-bottom: 40px;"/>
                           <input type="button" value="변경" id="modification2" style="background-color: mediumseagreen; color: black;"/>
                        </td>
                     </tr>
                  </table>
               </fieldset>
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
<script>
//HTML 문서에서 id가 'ex_file'인 input 요소를 찾습니다.
const input = document.getElementById('ex_file');

// input 요소의 값이 변경되면 change 이벤트가 발생합니다.
input.addEventListener('change', () => {
  const file = input.files[0];
  if (file) {
    // FileReader 객체를 생성합니다.
    const reader = new FileReader();
    reader.onload = () => {
      // id가 'userphoto'인 img 요소의 src 속성을 변경합니다.
      const img = document.getElementById('userphoto');
      img.src = reader.result;
    };
    reader.readAsDataURL(file);
  }
});
</script>
   <script>
   var code2 = "";
   $('#certificationNum').click(function() {
       const userphone = $('#userphone').val();
        if(userphone.length == 13){ 
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
               alert('checkNum:'+ checkNum);
               
               $('#certificationVerify').click(function() {   
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
       else {
          alert('휴대폰번호를 정확하게 입력해주세요 !')
       } 
      });
   </script>
<script>
   function sendphone() {
  // 입력 필드 가져오기
  const userphone = document.getElementById('userphone');
  const userNum = document.getElementById('userNum');

  // 정규식 패턴
  const pattern1 = /[^\d]/g;  // 숫자가 아닌 문자
  const pattern2 = /(^[01]{2,3}$|^02.{0}$)(^[0-9]{3,4}$)(^[0-9]{4}$)/;  // 휴대폰번호 패턴
  const pattern3 = /^[0-9]{4}$/;  // 인증번호 패턴

  // 유효성 검사
  if (!userphone.value) {
    alert("휴대폰번호를 입력하세요.");
    userphone.focus();
    return false;
  }
  if (!userNum.value) {
    alert("인증번호를 입력하세요.");
    userNum.focus();
    return false;
  }
  if (!pattern3.test(userNum.value)) {
    alert("인증번호는 4자리의 숫자입니다.");
    userNum.focus();
    return false;
  }

  // 모든 검사를 통과하면 true 반환
  return true;
}

   function sendpw() {
  const userpw = document.getElementById("changepw").value;
  const userpw_re = document.getElementById("userpw_re").value;

  // 현재 비밀번호와 변경할 비밀번호가 일치하는지 확인
  const correntpw = document.getElementById("userpw").value;
  if (correntpw === userpw) {
    alert("현재 비밀번호와 변경할 비밀번호가 일치합니다.");
    return false;
  }

  // 비밀번호와 비밀번호 확인 값이 일치하는지 확인
  if (userpw !== userpw_re) {
    alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
    return false;
  }

  // 비밀번호가 8자 이상이고, 영문자, 숫자, 특수문자가 포함되어 있는지 확인
  const passwordRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^+=])[A-Za-z\d$@$!%*#?&^+=]{8,}$/;
  if (!passwordRegExp.test(userpw)) {
    alert(
      "비밀번호는 8자 이상이어야 하며, 영문자, 숫자, 특수문자를 모두 포함해야 합니다."
    );
    return false;
  }

  return true;
}

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="${cp}/resources/assets/js/user.js"></script>
</html>