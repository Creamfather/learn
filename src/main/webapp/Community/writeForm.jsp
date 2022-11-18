<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�������ۼ���</title>
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
<%-- 	<%Include() %> --%>

<div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<p>-------���ʳ׺�-------</p>
			</div>
			
			<div class="col-sm-8 align-content-center">

                <div class="flex-row w-100">
                    <nav class="navbar navbar-expand-sm navbar-light w-100">
                        <ul class="navbar-nav gray-botton w-100" style="border-bottom: 1px solid gray;">
                            <li class="nav-item active black-line">
                            <a class="nav-link" href="#">����</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">��������</a>
                            </li>
                        </ul>
                    </nav>                        
                </div>

                <div class="d-flex flex-row p-3 ml-5 writeComments">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th><h2><b><input class="w-100 mx-auto border border-0" type="text" name="title" placeholder="������ �Է��ϼ���"></b></h2></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><textarea class="w-100 mx-auto border border-0" id="summernote" name="editordata" placeholder="�н��� ���õ� ������ �����ּ���"></textarea></td>
                            </tr>
                            <tr>
                                <td class="d-flex flex-row justify-content-end">
                                    <button class="btn btn-light mr-3">���</button>
                                    <button class="btn btn-success">���</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <form method="post">
                    </form>
                </div>
			</div>	

			<div class="col-sm-2">
				<p>------�����ʳ׺�--------</p>
			</div>
		</div>
	</div>
</div>




</body>
</html>