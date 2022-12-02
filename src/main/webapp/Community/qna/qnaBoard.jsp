<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>
	
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		var qboardNo = ${board.qboardNo};
		
		
		var fontList = ['맑은 고딕','굴림','돋움','바탕','궁서','NotoSansKR','Arial','Courier New','Verdana','Tahoma','Times New Roamn'];
		var setting = {
				height: 300,                 // set editor height
				minHeight: null,             // set minimum height of editor
				maxHeight: null,             // set maximum height of editor
				focus: true,                  // set focus to editable area after initializing summernote
				lang : 'ko-KR',
				fontNames: fontList,
				callbacks: { // 콜백을 사용
				// 이미지를 업로드할 경우 이벤트를 발생
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						uploadSummernoteImageFile(files[i], this);
						}
					}
				}
		};
		
		$(document).on("click", "#adoptNo", function(){
			$(this).text("해결");
			$(this).removeAttr("id", "adoptNo");
			$(this).attr("id", "adoptOk");
			
			QnaBoardAdoptToggleCommon()
		});
		
		$(document).on("click", "#adoptOk", function(){
			$(this).text("미해결");
			$(this).removeAttr("id", "adoptOk");
			$(this).attr("id", "adoptNo");
			
			QnaBoardAdoptToggleCommon()
		});
		
		
		function QnaBoardAdoptToggleCommon(){
			var gogo = '${pageContext.request.contextPath}/board/QnaBoardAdoptToggle.do?qboardNo=' + qboardNo;
			
			$.ajax({
				url: gogo,
				type : "post",
				async : true,
				success : function(data){
					console.log("ajax 성공");
				},
				error : function(){
					console.log("ajax 실패");
				},
			});
		}
		
		$(document).on("click", "#LikeOn", function(){
			$(this).removeAttr("src", "${pageContext.request.contextPath}/Community/img/LikeOn.png");
			$(this).attr("src", "${pageContext.request.contextPath}/Community/img/LikeOff.png");
			
			$(this).removeAttr("id", "LikeOn");
			$(this).attr("id", "LikeOff");
			
			QnaBoardLikeToggleCommon();

		});
		
		$(document).on("click", "#LikeOff", function(){
			$(this).removeAttr("src", "${pageContext.request.contextPath}/Community/img/LikeOff.png");
			$(this).attr("src", "${pageContext.request.contextPath}/Community/img/LikeOn.png");
			
			$(this).removeAttr("id", "LikeOff");
			$(this).attr("id", "LikeOn");
			
			QnaBoardLikeToggleCommon();
			
		});
		
		function QnaBoardLikeToggleCommon(){
			var gogo = '${pageContext.request.contextPath}/board/QnaBoardLikeToggle.do?qboardNo=' + qboardNo;
			
			$.ajax({
				url: gogo,
				type : "post",
				async : true,
				success : function(data){
					console.log("ajax 성공");
					
					var likeCnt = data.boardLike;
					
					$("#boardLike").html(likeCnt);
					
				},
				error : function(){
					console.log("ajax 실패");
				},
			});
		}
		
		
		$('#summernote').summernote(setting);
		   
		$('.summernote').summernote(setting);
		
		function uploadSummernoteImageFile(file, editor) {
			  // 파일 전송을 위한 폼생성
				data = new FormData();
				data.append("file", file);
			  	$.ajax({ // ajax를 통해 파일 업로드 처리
					data : data,
					type : "POST",
					url : "${pageContext.request.contextPath}/board/uploadSummernoteImageFile.do", // controller
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) { // 처리가 성공할 경우
						
						console.log("에이젝스 성공!!");
					// 에디터에 이미지 출력
						$(editor).summernote('editor.insertImage', data.url);
					//$("#thumbnail").val(data.url); // 썸네일 설정
					},
					error : function(){
						console.log("에이젝스 실패!!");
					}
				});
		};
			 
		 $(document).on("click", "#reportBoard", function(){
			 
			 if ($("#boardReport").text() != ""){
				 alert("이미 신고한 사용자 입니다");
				 $('#myModal').modal('hide');
				 return false;
			 };
			 
			 if (${user.userId == null}){
				 alert("로그인 후 입력해주시기 바랍니다");
				 $('#myModal').modal('hide');
				 return false;
			 }
			 
			 reportBoard();
			 
			 $("#boardReport").text('입력함')
		 });
		 
		 
		 function reportBoard(){
			 
			 var reporter = "${user.userId}";
			 var repperson = "${board.userId}";
			 
			 var reportReason = $("input:radio[name=reason]:checked").val();
			 
			 if (reportReason == '기타'){
				 reportReason = $("#reasonEtc").val();
			 }
			 
			 console.log(reportReason);
			 
			 
			 var gogo = '${pageContext.request.contextPath}/board/insertBoardReport.do?boardType=questionBoard&boardNo=' + qboardNo;
			 gogo += '&reporter='+ reporter +'&repperson='+ repperson + "&reportReason=" + reportReason;
			 
			 console.log(gogo);
			 
			 
			$.ajax({
				url: gogo,
				type : "post",
				async : true,
				success : function(data){
					console.log("ajax 성공");
					
					alert("신고가 완료되었습니다");					
					
				},
				error : function(){
					console.log("ajax 실패");
				},
			});
			 
			
			 $('#myModal').modal('hide');
			    return false;
		 };
		 
		 
		 
		 $(document).on("click", "#linkToTweet", function(){
			 var sendText = document.title;
			 var sendUrl = window.location.href;
			 window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		 });
		 
		 
		 $(document).on("click", "#linkToFace", function(){
			var sendUrl = window.location.href;
			document.execCommand('copy');
		 });
		 
		 $(document).on("click", "#linkTo", function(){
			var url = '';
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			url = window.document.location.href;
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("URL이 복사되었습니다.")
			 
		 });
		 
		 
	});	 
	
	 function deleteOk(commentNo){
		 if (confirm("삭제하시겠습니까??")){
			 location.href = "${pageContext.request.contextPath}/board/delComment.do?qboardNo="+commentNo; 
		 }
	 };	
	 
	 
	 function deleteBoard(obj){
		 if (confirm("삭제하시겠습니까??")){
			 location.href = "${pageContext.request.contextPath}/board/deleteBoard.do?qboardNo=${board.qboardNo }" 
		 }
	 };
	 
	 function modifyBoard(){
		 location.href = "${pageContext.request.contextPath}/board/boardModify.do?qboardNo=${board.qboardNo }";
	 };
	 
	 function addCoComent(frm){
		 alert(frm);
		 alert(frm.commentContent);
	 }
	
	
	</script>	
	
	<style type="text/css">
		.navbar {
			top: 70px;
		}
		
		#reason{
			padding: 10px;
			background-color: #eeeeee;
			border-radius: 10px;
		}
	</style>
	
	

</head>
<body>
	<%@include file="/Common/header.jsp" %>

	<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
	
		<div class="row w-100 pb-4 justify-content-center">
			
			<!-- 왼쪽 네비 -->
			<div class="col-2 d-flex justify-content-center">
				<a href="${pageContext.request.contextPath}/board/getQnaBoardList.do" style="position: fixed;"><img class="mt-3" height="35px" src="${pageContext.request.contextPath}/Community/img/back.png"></a>
			</div>

			<!-- 중앙 위 내용 - 글내용 -->
			<div class="col-6 pl-3">
				<div class="row align-items-center p-3">
					<img class="mr-2" style="height: 30px" src="${pageContext.request.contextPath}/Community/img/qqq.png">					
					<h3><b>${board.boardTitle }</b></h3>
				</div>
				<div class="row pl-3 pb-3 gray-line">
					<p><b>${board.userName }</b></p><p class="text-muted">${board.boardRegdate }</p>
					
					<!-- 수정, 삭제하기 -->
					<p class="ml-auto">
					<c:if test="${user.userId == board.userId }">
						<a class="mr-3" href="javascript:modifyBoard()">수정</a>
						<a class="mr-3" href="javascript:deleteBoard($(this))">삭제</a>
					</c:if>
					
					<!-- 신고하기 -->
					<c:if test="${user.userId != board.userId}">
						<a data-toggle="modal" href="#myModal" class="mr-3">신고하기</a>
					</c:if>
					</p>
						
							
					  <!-- The Modal -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog modal-lg">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">게시글 신고하기</h4>
					          <button type="button" class="close" data-dismiss="modal">×</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
						        <p>이 글이 이용규칙 위반으로 운영진에 의해 삭제되어야 마땅하다고 생각된다면 신고해주세요.</p>
								<p>신고 3회 이상의 글은 신고될 수 있으며</p>
								<p>이용규칙에 위배되는 글을 여러차례 게시하여 신고를 많이 받은 회원은 제한 조치가 취해집니다.</p>
								<br>
								<p>신고는 반대의견을 표시하는 기능이 아닙니다.</p>
								<p>신고에 부적합한 글을 지속적으로 신고하는 회원에게는 제한 조치가 취해질 수 있습니다.</p>
					          <div id="reason">
					          	<p><input type="radio" name="reason" value="집단간싸움유발"><strong> 집단간 싸움 유발</strong> (학과, 작업간 서열/비교, 지역감정, 종교등)</p>
					          	<p><input type="radio" name="reason" value="성(姓)관련순환주제"><strong> 성(姓)관련 순환 주제</strong> (양성평등, 군대, 혼전순결, 된장녀, 외모/몸매 등)</p>
					          	<p><input type="radio" name="reason" value="욕설,비속어,인신공격"><strong> 욕설, 비속어, 인신공격</strong> (심한 불쾌감 유발)</p>
					          	<p><input type="radio" name="reason" value="선정적,음란성"><strong> 선정적, 음란성</strong> (신고자가 선정적이라고 판단)</p>
					          	<p><input type="radio" name="reason" value="낚시성,도배,무의미"><strong> 낚시성, 도배, 무의미</strong> (무의미한 짧을 글 포함)</p>
					          	<p><input type="radio" name="reason" value="기타"><strong> 기타</strong> (신고자가 선정적이라고 판단)</p>
					          	<textarea id="reasonEtc" rows="3" cols="90" placeholder="기타 선택시 사유 입력해주세요"></textarea>
					          </div>
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <input type="button" class="btn btn-primary" id="reportBoard" value="신고">
					          <input type="button" class="btn btn-danger" data-dismiss="modal" value="취소">
					        </div>
					        
					      </div>
					    </div>
					  </div>	
					  
				</div>

				<div class="flex-row p-3">
					<p>${board.boardContent }</p>
				</div>
			</div>
			
			<!-- 오른쪽 네비 -->
			<div class="col-2">				
				<!-- A vertical navbar -->
				<nav class="navbar">
				  <!-- Links -->
				  <ul class="navbar-nav comNav">
				    
				    <c:if test="${user.userId == board.userId }">
				    <li class="nav-item d-flex justify-content-center align-items-center">
				    <c:choose>
				    	<c:when test="${board.boardAdopt eq 'TRUE' }">
							<a id="adoptOk" href="#">해결</a>
				    	</c:when>
				    	<c:otherwise>
							<a id="adoptNo" href="#">미해결</a>
				    	</c:otherwise>
				    </c:choose>	
				    </li>
				    
				    <li class="nav-item d-flex justify-content-center align-items-center">
				    	
				      <a href="#">
				      	<c:choose>
					      	<c:when test="${qnaLike.userId != null }">
					      		<img id="LikeOn" height="20px" src="${pageContext.request.contextPath}/Community/img/LikeOn.png">
					      	</c:when>
					      	<c:otherwise>
					      		<img id="LikeOff" height="20px" src="${pageContext.request.contextPath}/Community/img/LikeOff.png">
					      	</c:otherwise>
				      	</c:choose>
				      	<span id="boardLike" class="ml-3">${board.boardLike }</span>
				      </a>
				      
				    </li>
				    
				    </c:if>
				    
				    <!-- 링크, 공유 -->
				    <li class="nav-item d-flex justify-content-center align-items-center">
 						<img id="linkToTweet" height="20px" src="${pageContext.request.contextPath}/Community/img/tweeter.png">
<%-- 						<img id="linkToFace" height="20px" src="${pageContext.request.contextPath}/Community/img/face.png"> --%>
						<img id="linkTo" height="20px" src="${pageContext.request.contextPath}/Community/img/LinkTo.png">
				    </li>
				    
				  </ul>
				</nav>
				
			</div>
								
						
		</div>		
	</div>

	<!-- 글 아래 파트 회색부분 -->
	<div class="container-fluid py-5"  style="background-color: #F8F9FA;">

		<!-- 여기서부터 입력부분은 질문게시판(관리) 쪽은 관리자만 답변 할 수 있도록 해야 한다 -->
		
		<div class="row w-50 border mx-auto rounded bg-white px-3 py-5" >
			<div class="w-100 mb-3 ml-3 text-editor-block d-flex align-items-center">
				<div class="ml-3">
					<img class="mr-2" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">
				</div>
				<div class="ml-4">
					<div class="row">
					<span><h5><b>
					<c:choose>
						<c:when test="${user != null }">
						<a href="#" style="font-size: 1em">${user.userId}</a>님, 답변해주세요!
						</c:when>
						<c:otherwise>
						로그인 후 답변이 가능합니다.
						</c:otherwise>
					</c:choose>
					
					</b></h5></span>
					</div>
					<div class="row">
					<span class="text-secondary">모두에게 도움이 되는 답변의 주인공이 되어주세요!</span>
					</div>
				</div>
			</div>
		
		<c:if test="${user != null }">
		<!-- 댓글 입력 부분 -->
			<div class="row w-100 w-100 p-3 mx-auto">
				<form method="post" class="w-100" action="${pageContext.request.contextPath}/board/addComment.do?qboardNo=${board.qboardNo}">
					<textarea id="summernote" name="commentContent"></textarea>
					<div class="row mt-3">
						<button class="btn btn-success ml-auto">답변등록</button>
					</div>
				</form>
			</div>
			
		</c:if>
			
		</div>
		

		<!-- 답변 몇개인, 글 정렬 옵션-->
		<div class="w-75 d-flex flex-row justify-content-center mx-auto mt-4 p-3">
			<div class="row w-75 d-flex flex-row justify-content-around align-items-center" >
					<span class="w-75 ml-4">
					<h3 class="text-success">A</h3><p>총 ${board.commentCnt }개의 답변이 달렸습니다</p>
					</span>
					
					<span class="mr-4">
					<select>
						<option>최신순</option>
						<option>좋아요순</option>
					</select>
					</span>
			</div>				
		</div>


		<!-- 댓글 출력 부분 여기 포이치 문으로 해줘야 한다 -->
		
		<c:forEach var="cvo" items="${cvoList }">
		
		<div class="row w-50 border mx-auto rounded bg-white p-3 mb-5" >
			<div class="row w-100  mt-3 mb-3">
				<div class="w-100 flex-row d-flex">
					<P class="ml-auto">
<!-- 					<a>수정</a>  -->
					<a href="javascript:deleteOk(${cvo.commentNo })">삭제</a>
					</P>
				</div>
			
				<div class="text-editor-block flex-row d-flex w-100 mb-3">				
					<div class="ml-3">
						<img class="mr-2 ml-5" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">
					</div>
					<div class="ml-3">
						<div class="row">
						<span><h5><b><a href="#">${cvo.userId }</a></b></h5></span>
						</div>
						<div class="row text-secondary">
						<span>${cvo.commentRegdate }</span>
						</div>
					</div>
				</div>

				<div class="row w-100 ml-5">
					<p> ${ cvo.commentContent}</p>
				</div>
			</div>
			
			
			
			
		<!-- 대댓글 파트 -->
		<div class="row mx-auto">
			<div class="border row p-3 mx-auto rounded" style="background-color: #F8F9FA; width: 695px;" >
				<div class="d-flex flex-row ml-3 mt-3 w-100 align-items-center">
					<span>
						<h5><b>댓글</b></h5>
					</span>
				</div>
				
				<!-- 글 출력되는 부분 - 포이치문 써야함 -->
				<div class="comments">
					<div class="text-editor-block d-flex align-items-center my-3">
						<div class="ml-3">					
							<img class="mr-2" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">	
						</div>
						<div class="ml-4">
							<div class="row">
							<span><h5><b><a href="#">OMG</a></b></h5></span>
							</div>
							<div class="row text-secondary">
							<span>2022.11.18 오전 1:52</span>
							</div>
						</div>
					</div>
					
					<div class="row ml-5 ">
						<pre > Lorem ipsum dolor sit, 이거 어떻게 해야 하나요? 대댓글</pre>
					</div>
				</div>
				
				
			</div>

			<!-- 대댓글 달기 - 질문게시판에서는 안하기로 했음 -->

			<c:if test="${user != null }">
			<div class="row ml-3 mt-3 w-100 align-items-center">
				<span class="mx-auto">
					<button data-toggle="collapse" data-target=".cocoment">답글쓰기</button>
				</span>
			</div>
			
			<div class="row p-3 mx-auto rounded cocoment collapse">
				<form method="post" class="w-100">
					<textarea class="summernote" name="commentContent"></textarea>
					<div class="row mt-3">
					<input type="hidden" name="userId" value="${user.userId }">
					<input type="hidden" name="userGrade" value="${user.grade }">
					<input type="hidden" name="qboardNo" value="${board.qboardNo}">
					<input type="button" onclick="addCoComent(this.form)" class="btn btn-success ml-auto">답변등록</button>
					</div>
				</form>
			</div>
			</c:if>
			
		</div>
			
			
			
			
		</div>
		
		</c:forEach>
		
		





	</div>
	
	<p id="boardReport" style="visibility: hidden;">${boardReport }</p>
	
	<%@include file="/Common/footer.jsp" %>




</body>
</html>