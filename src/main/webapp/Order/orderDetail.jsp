<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>주문 내역</title>
<style>
th, td {
	vertical-align: middle;
}

.active-menu {
        color: #1dc078;
        font-weight: bold;
      }
      .norm-menu {
        color: black;
      }
      .tape {
        height: 100px;
        margin: 50px auto;
        padding-top: 30px;
        color: white;
      }
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
	<%@include file="/Common/header.jsp"%>
<div class="container-fluid bg-dark">
    <div class="container tape">
        <section class="tapeContent">
            <h2>구매내역</h2>          
        </section>
    </div>
</div>
<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
    <div class="row w-100 pb-4 justify-content-center">
        <div class="col-2 d-flex justify-content-center">
            <%@ include file="../Member/sidebar.jspf"%>
            <script>
              var menu = $('#buylistMenu');
              console.log(menu);
              menu.removeClass('norm-menu');
              menu.addClass('active-menu');
            </script>
        </div>
				<div class="col-8 table table-striped table-hover">
					<br>
					<h5>
						<b>내 구매 내역</b>
					</h5>
					<table class="table table-bordered" style="table-layout:fixed">
						<thead>
							<tr>
								<th style="width: 10%; vertical-align: middle; text-align: center;">주문 번호</th>
								<th style="width: 15%; vertical-align: middle; text-align: center;">주문 날짜</th>
								<th style="width: 55%; vertical-align: middle; text-align: center;">주문명</th>
								<th style="width: 10%; vertical-align: middle; text-align: center;">금액</th>
								<th style="width: 10%; vertical-align: middle; text-align: center;">결재타입</th>
							</tr>
						</thead>
						<c:if test="${empty orderList }">
							<tr>
								<td colspan="5">구매내역이 비어 있습니다</td>
							</tr>
						</c:if>
						<c:if test="${not empty orderList}">
							<tbody>
								<c:forEach var="orderList" items="${orderList }">
									<tr class="order_row">
										<td style="vertical-align: middle; text-align: center;">${orderList.orderDetailNo }</td>
										<td style="vertical-align: middle; text-align: center;">${fn:substring(orderList.orderRegdate,0,10) }</td>
										<td class="order_name" style="vertical-align: middle; overflow : hidden; white-space : nowrap; text-overflow:ellipsis;">
											<a class="link_to" href="${pageContext.request.contextPath}/Common/getLecture.do?lectureNo=${orderList.lectureNo }"<%-- ${orderList.lectureNo } --%>
											style="color: black; text-decoration: underline;"><B>${orderList.lectureTitle }</B></a></td>
										<td class="pay_price" style="vertical-align: middle; text-align: right;">
										<c:if test="${orderList.lectureSalerate != 0}">
											<span>₩<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.lecturePrice }"/></span><br>
											<span
											style="background-color: lightgray; border-bottom: 1px solid; width: 100%; display: inline-block;">-
												₩<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.realSalePrice }"/></span><br>
												 <span>₩<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.lectureSalePrice }"/></span>
										</c:if>
										<c:if test="${orderList.lectureSalerate == 0}">
												<span>₩<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderList.lecturePrice }"/></span>
										</c:if>
										</td>
										<td style="vertical-align: middle; text-align: center;">${orderList.orderPayment }</td>
									</tr>
								</c:forEach>
						</c:if>
									<%-- 연습용 tr 필요한거 있으면 이거 살려서 ㄱㄱ 
									<tr class="order_row">
										<td style="vertical-align: middle; text-align: center;"></td>
										<td style="vertical-align: middle; text-align: center;"></td>
										<td class="order_name" style="vertical-align: middle; overflow : hidden; white-space : nowrap; text-overflow:ellipsis;">
											<a class="link_to" href="#"${orderList.lectureNo }
											style="color: black; text-decoration: underline; "><B>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사1234</B></a></td>
										<td class="pay_price" style="vertical-align: middle; text-align: right;">
											<span></span><br>
											<span
											style="background-color: lightgray; border-bottom: 1px solid; width: 100%; display: inline-block;">-
												</span><br>
												 <span></span>
										</td>
										<td style="vertical-align: middle; text-align: center;"></td>
									</tr> --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<footer>
		<%@ include file="../Common/footer.jsp"%>
	</footer>
</body>
</html>