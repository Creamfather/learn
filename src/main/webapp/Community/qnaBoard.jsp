<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link href="${pageContext.request.contextPath}/summernote/summernote-bs4.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>

	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,                 // set editor height
				minHeight: null,             // set minimum height of editor
				maxHeight: null,             // set maximum height of editor
				focus: true,                  // set focus to editable area after initializing summernote
				callbacks: { // �ݹ��� ���
				// �̹����� ���ε��� ��� �̺�Ʈ�� �߻�
				onImageUpload: function(files, editor, welEditable) {
				sendFile(files[0], this);
				}
				}
			});
		});

		function sendFile(file, editor) {
		  // ���� ������ ���� ������
			data = new FormData();
			data.append("uploadFile", file);
		  	$.ajax({ // ajax�� ���� ���� ���ε� ó��
				data : data,
				type : "POST",
				url : "knowhowImageUpload.do", // controller
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) { // ó���� ������ ���
				// �����Ϳ� �̹��� ���
					$(editor).summernote('editor.insertImage', data.url);
				//$("#thumbnail").val(data.url); // ����� ����
				}
			});
		}
	</script>


</head>
<body>

	<div class="container mt-5 d-flex justify-content-center">
		<div class="row w-100">
			<div class="col-2" style="border: 1px solid black;">
				<p>-------���ʳ׺�-------</p>
				<p>���⿡ ȭ��ǥ ��ư ��?</p>
			</div>

			<div class="col-8">
				<div class="row">
					<img src="qqqq.png">&nbsp;<h3><b>github ���� ��û �帳�ϴ�!</b></h3>
				</div>
				<div class="row mt-2">
					<p><b>���̵�</b></p>&nbsp;&nbsp;<p class="text-muted">2022.11.18 ���� 9:20</p>
				</div>
				<hr>

				<div class="row">
					<p>���� ��¼��</p>
					<p>��ʾ�¼��</p>
					<p>��ʾ�¼��</p>
				</div>
			</div>

			<div class="col-2"  style="border: 1px solid black;">
				<p>------�����ʳ׺�--------</p>
			</div>
		</div>
		
	</div>

	<div class="container-fluid mt-5 pb-5"  style="background-color: #F8F9FA;">
		<div class="row mb-5">

		</div>

		<div class="row w-50 border mx-auto rounded bg-white p-3" >
			<div class="w-100 text-editor-block d-flex align-items-center mb-3">
				<div class="ml-3">
					<img src="��������ũ.png">	
				</div>
				<div class="ml-4">
					<div class="row">
					<span><h5><b><a href="#">jaepang Im</a>��, �亯���ּ���!</b></h5></span>
					</div>
					<div class="row">
					<span class="text-secondary">��ο��� ������ �Ǵ� �亯�� ���ΰ��� �Ǿ��ּ���!</span>
					</div>
				</div>

			</div>

			<div class="row ml-5">
				<form method="post">
					<textarea id="summernote" name="editordata"></textarea>
				</form>
			</div>
		</div>

		<!-- �亯 ���, �� ���� �ɼ�-->
		<div class="w-75 d-flex flex-row justify-content-center mx-auto mt-4 p-3">
			<div class="row w-75 d-flex flex-row justify-content-around align-items-center" >
					<span class="w-75 ml-4">
					<h3 class="text-success">A</h3><p>�� 1���� �亯�� �޷Ƚ��ϴ�</p>
					</span>
					
					<span class="mr-4">
					<select>
						<option>�ֽż�</option>
						<option>���ƿ��</option>
					</select>
					</span>
			</div>				
		</div>

		<!-- ��� -->
		<div class="row w-50 border mx-auto rounded bg-white p-3 " >

			<div class="w-100 text-editor-block d-flex align-items-center mt-3 mb-3">				
				<div class="ml-3">
					<img src="��������ũ.png">
				</div>
				<div class="ml-4">
					<div class="row">
					<span><h5><b><a href="#">OMG</a></b></h5></span>
					</div>
					<div class="row text-secondary">
					<span>2022.11.18 ���� 1:52</span>
					</div>
				</div>

			</div>

			<div class="row ml-5">
				<pre > Lorem ipsum dolor sit, �̰� ��� �ؾ� �ϳ���? pre�� �ߴµ� ��Ĩ�ϴ�.</pre>
			</div>


			<!-- ���� -->
			<div class="row w-100 border mx-auto rounded p-3" style="background-color: #F8F9FA;" >
				<div class="d-flex flex-row ml-3 mt-3 w-100 align-items-center">
					<span>
						<h5><b>���</b></h5>
					</span>
					<span class="ml-auto">
						<button data-toggle="collapse" data-target=".comments">������/����</button>
					</span>
				</div>
				<div class="comments">
				<div class="w-100 text-editor-block d-flex align-items-center mt-3 mb-3">
					<div class="ml-3">					
						<img src="��������ũ.png">	
					</div>
					<div class="ml-4">
						<div class="row">
						<span><h5><b><a href="#">OMG</a></b></h5></span>
						</div>
						<div class="row text-secondary">
						<span>2022.11.18 ���� 1:52</span>
						</div>
					</div>
				</div>
				
				<div class="row ml-5">
					<pre > Lorem ipsum dolor sit, �̰� ��� �ؾ� �ϳ���? pre�� �ߴµ� ��Ĩ�ϴ�.</pre>
				</div>
				</div>
			</div>

			<!-- ���� �ޱ�-->

			<div class="d-flex flex-row ml-3 mt-3 w-100 align-items-center">
				<span class="mx-auto">
					<button data-toggle="collapse" data-target=".writeComments">��۾���</button>
				</span>
			</div>

			<div class="row ml-5 writeComments">
				<form method="post">
					<textarea id="summernote" name="editordata"></textarea>
				</form>
			</div>


		</div>






	</div>




</body>
</html>