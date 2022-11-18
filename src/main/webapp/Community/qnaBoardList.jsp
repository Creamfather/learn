<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�����Խ��Ǹ���Ʈ</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>
	<%@include file="/Community/tape.jsp" %>

<div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<p>-------���ʳ׺�-------</p>
			</div>
			
			<div class="col-sm-8 align-content-center">
				<nav class="navbar navbar-expand-sm navbar-light">
                    <ul class="navbar-nav gray-botton">
                        <li class="nav-item active black-line">
                        <a class="nav-link" href="#">��ü</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#">���ذ�</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#">�ذ��</a>
                        </li>
                    </ul>
				</nav>
				
				<div class="searchByText row d-flex flex-row justify-content-center">
					<form action="">
						<input type="text" name="search" placeholder="�ñ��� ������ �˻��غ�����!">
						<button class="btn btn-success ml-4">�˻�</button>
					</form>
				</div>
				
				<div class="row d-flex">
					<div class="col-10">
					<nav class="navbar navbar-expand-sm navbar-light" style="margin-top: 10px">
                        <ul class="navbar-nav ">
                            <li class="nav-item active">
                            <a class="nav-link" href="#">�ֽż�</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">��Ȯ����</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">�亯������</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">���ƿ��</a>
                            </li>
                        </ul>
					</nav>
					</div>
					<div class="col-2 mt-auto">
						<button class="btn btn-dark ml-auto">�۾���</button>
					</div>
				
				</div>
				
				
				<table class="table table-hover mt-5">
					<tbody>
						<tr>
							<td style="height: 100px">
							<div class="row">
								<div class="col-10">
								<h4>������ ������ ����� ���¿���</h4>
								<p>������ ��¼�� ��¼��</p>
								<p>���̵� �����������������</p>
								</div>

								<div class="col-2">
									<div class="row d-flex justify-content-center">
										<div class="ball">
											<p>0</p>
											<p>�亯</p>
										</div>
									</div>
									<div class="row d-flex justify-content-center">
										<p class="text-center">�� 0</p>
									</div>
								</div>
							</div>
							</td>
						</tr>

				</table>

				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">����������</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">����������</a></li>
				</ul>				
				
			</div>			
			
			<div class="col-sm-2">
				<p>------�����ʳ׺�--------</p>
			</div>
		</div>
	</div>
</div>




</body>
</html>