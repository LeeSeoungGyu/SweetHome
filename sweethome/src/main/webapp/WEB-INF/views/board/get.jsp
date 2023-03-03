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
<script>
   const cp = "${cp}";
</script>
</head>
<body class="is-preload">
   <c:if test="${not empty s}">
      <script>
         alert("${s}번 게시글 수정 완료!")
      </script>
   </c:if>
   <c:if test="${not empty f}">
      <script>
         alert("게시글 수정 실패!")
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
      <div class="wrapper style1 special">
         <div class="board" style="height: 1700px;">
            <h1 class="heading alt" style="color:mediumseagreen; margin-top: 200px;">커뮤니티</h1>
            <a href="${cp}/board/list${cri.listLink}" style="float:right; color: mediumseagreen;">목록 보기</a>
            <div class="boardmain">
               <form name="boardForm" method="post" action="${cp}/board/remove">
                  <input name="boardnum" value="${board.boardnum}" type="hidden">
                  <input name="pagenum" value="${cri.pagenum}" type="hidden">
                  <input name="amount" value="${cri.amount}" type="hidden">
                  <input name="type" value="${cri.type}" type="hidden">
                  <input name="keyword" value="${cri.keyword}" type="hidden">
                  
                  <div class="inputsky" >
                     <input name="boardtitle" type="text" value="${board.boardtitle}" readonly style="font-size:30px">
                     <input name="userid" type="text" value="${board.userid}" readonly style="width:10%; float:left;">
                     <input name="regdate" type="text" value="${board.regdate}" readonly style="width:20%">
                  </div>
                  <div class="" style="margin-top:10px; font-size: 20px">
                     <textarea name="boardcontents" rows="10" readonly>${board.boardcontents}</textarea>
                  </div>
                  <c:if test="${user.userid == board.userid }">
                     <div style="text-align: right;">
                        <input type="button" value="수정" class="" onclick="modify()" style="background-color: mediumseagreen">
                        <input type="submit" value="삭제" class="" style="background-color: mediumseagreen">
                     </div>
                  </c:if>
               </form>
                <div>
                <div style="border-bottom: solid 1px mediumseagreen; padding:10px; margin-bottom:20px; border-top: solid 1px mediumseagreen;">
               <h3>댓 글</h3>
               </div>
               <c:if test="${user.userid != null}">
               <div class="show row" style="width:100%; margin-left: 10px;">
                  <div style="width:15%; text-align:center;">
                     <h4>작성자</h4>
                     <input name="userid" style="width:100%; border: none; background-color: floralwhite; color:black; text-align: right;"  value="${user.userid}" readonly >
                  </div>
                  <div style="width:65%;">
                     <h4>내 용</h4>
                     <textarea name="replycontents" placeholder="Contents" style="resize:none; border:solid 1px mediumseagreen;"></textarea>
                  </div>
                  <div style="width:20%">
                     <h4>&nbsp;</h4>
                     <a href="#" class="button primary small finish" style="margin-bottom:1rem; background-color: mediumseagreen; width:70%; margin-top:30px;">등록</a>
                  </div>
                </div>
                </c:if>
               <!-- 댓글 띄우는 ul -->
               <ul class="alt replies"></ul>
               <!-- 댓글 페이징 처리할 div -->
               <div class="page" style="width:50%; text-align:center; margin:0 auto;">
               </div>
              </div>
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
   <script src="${cp}/resources/assets/js/reply.js"></script>
   

</body>
<script>
   const replies = $(".replies")
   const page = $(".page");
   const loginUser = "${user.userid}"
   let maxCnt = 0;
   //내가 보고 있는 댓글의 페이지 번호
   let pagenum = 0;
   let boardnum = "${board.boardnum}"
   //현재 보고 있는 게시글의 댓글이 있는지 없는지를 표기하는 flag
   let flag = true;
   
   
   $(document).ready(function(){
      pagenum = 1;
      showList(1);
   })
   
   $(".finish").on("click",function(e){
      e.preventDefault();
      let replycontents = $("[name='replycontents']").val();
      replyService.add(
         {"boardnum":boardnum, "userid":loginUser, "replycontents":replycontents},
         function(result){
            //alert("");
            if(maxCnt<5 || Math.ceil(maxCnt/5) == pagenum && maxCnt%5 != 0){
               let str = "";
               
               str += '<li style="clear:both;" class="li'+result+'">'
               str += '<div style="display:inline; float:left; width:80%; border-bottom:solid 1px mediumseagreen;">';
               str += '<strong class="userid'+result+'" style="color:black;">'+loginUser+'</strong>'
               str += '<p class="reply'+result+'">'+replycontents+'</p>'
               str += '</div><div style="text-align:right;">'
               str += '<strong style="color:black;">방금 전</strong><br>'
               str += '<a href="'+result+'" class="modify">수정</a>';
               str += '<a href="'+result+'" class="mfinish" style="display:none;">수정 완료</a>';
               str += '<a href="'+result+'" class="remove">&nbsp;&nbsp;삭제</a>';
               str += '</div></li>'
               
               if(flag){
                  replies.append(str);
               }
               else{
                  replies.html(str);
                  flag = true;
               }
               
               $(".remove").on("click",deleteReply);
               $(".modify").on("click",modifyReply);
               $(".mfinish").on("click",modifyReplyOk);
               
               maxCnt++;
            }
            else{
               showList(pagenum);
            }
         }
      )
   
      
      $("[name='replycontents']").val("");
   })
   function showList(pagenum){
      //ajax
      replyService.getList(
         {boardnum:boardnum,pagenum:pagenum||1},
         function(replyCnt, list){
            let str = "";
            if(list == null || list.length == 0){
               flag = false;
               str += '<li style="clear:both; text-align:center;">등록된 댓글이 없습니다</li>'
               replies.html(str);
               return;
            }
            
            maxCnt = replyCnt;
            for(let i=0;i<list.length;i++){
               str += '<li style="clear:both;" class="li'+list[i].replynum+'">'
               str += '<div style="display:inline; float:left; width:80%; border-bottom:solid 1px mediumseagreen;">';
               //<strong class="userid123">apple</strong>
               str += '<strong class="userid'+list[i].replynum+'" style="color:black;">'+list[i].userid+'</strong>'
               str += '<p class="reply'+list[i].replynum+'">'+list[i].replycontents+'</p>'
               str += '</div><div style="text-align:right;">'
               str += '<strong style="color:black;">'+replyService.displayTime(list[i])+'</strong><br>'
               if(list[i].userid == loginUser){
                  str += '<a href="'+list[i].replynum+'" class="modify">수정</a>';
                  str += '<a href="'+list[i].replynum+'" class="mfinish" style="display:none;">수정 완료</a>';
                  str += '<a href="'+list[i].replynum+'" class="remove">&nbsp;&nbsp;삭제</a>';
               }
               str += '</div></li>'
            }
            replies.html(str);
            
            $(".remove").on("click",deleteReply);
            $(".modify").on("click",modifyReply);
            $(".mfinish").on("click",modifyReplyOk);
            
            showReplyPage(replyCnt);
         }
      )
   }
   function showReplyPage(replyCnt){
      let endPage = Math.ceil(pagenum/5)*5;
      let startPage = endPage - 4;
      
      let prev = startPage!=1;
      endPage = (endPage-1)*5 >= replyCnt ? Math.ceil(replyCnt/5) : endPage
      let next = endPage*5 < replyCnt ? true : false ;
      
      let str = "";
      if(prev){
         str += '<a class="changePage" href="'+(startPage-1)+'"><code>&lt;</code></a>'
      }
      for(let i=startPage;i<=endPage;i++){
         str+='<a class="changePage" href="'+i+'"><code>'+i+'</code></a>'
      }
      if(next){
         str+= '<a class="changePage" href="'+(endPage+1)+'"><code>&gt;</code></a>'
      }
      page.html(str);
      
      $(".changePage").on("click",function(e){
         e.preventDefault();
         let target = $(this).attr("href");
         pagenum = parseInt(target);
         showList(pagenum)
      })
   }
   
   function deleteReply(e){
      e.preventDefault();
      let replynum = $(this).attr("href");
      replyService.remove(
         replynum,
         function(result){
            if(result == "success"){
               alert(replynum+"번 댓글 삭제 완료!");
               showList(pagenum)
            }
         },
         function(err){
         }
      );
   }
   let replyFlag = false;
   function modifyReply(e){
      e.preventDefault();
      if(!replyFlag){
         replyFlag = true;
         let replynum = $(this).attr("href");
         const replyTag = $(".reply"+replynum);
         replyTag.html('<textarea class="'+replynum+' mdf">'+replyTag.text()+'</textarea>')
         $(this).hide();
         $(this).next().show();
      }
      else{
         alert("수정중인 댓글이 있습니다!");
      }
   }
   function modifyReplyOk(e){
      e.preventDefault();
      replyFlag = false;
      
      let replynum = $(this).attr("href");
      let replycontents = $("."+replynum).val();
      
      if(replycontents == ""){
         alert("수정할 댓글 내용을 입력하세요!");
         return;
      }
      
      replyService.modify(
         {replynum:replynum, replycontents:replycontents, boardnum:boardnum, userid:loginUser},
         function(result){
            if(result == "success"){
               alert(replynum+"번 댓글 수정 완료!");
               showList(pagenum);
            }
         }
      )
   }

   function modify(){
      const boardForm = document.boardForm;
      //location.href = "${cp}/board/modify${cri.listLink}&boardnum=${board.boardnum}"
      boardForm.setAttribute("action","${cp}/board/modify")
      boardForm.setAttribute("method","get");
      boardForm.submit()
   }
   
   
</script>
</html>





