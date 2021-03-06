<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메세지</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<input type="hidden" value="${order.orderNo }" id="original"/>

<script>
var origin = $("#original").val();
swal({
	title : "해당 주문을 취소하시겠습니까?",
	text : "주문을 취소하시면 해당 주문 적립금은 소멸되며, 사용하셨던 적립금과 결제액은 환불됩니다.",
	icon : "warning",
	buttons: ["취소", "확인"],
	dangerMode : true,
})
.then((willDelete)=>{
	if(willDelete){
			location.replace('${path}/member/order/cancelEnd.do?orderNo='+origin);
	}else{
		swal("주문취소가 유보되었습니다.","주문 배송 조회 화면으로 돌아갑니다.","info")
		.then((value)=>{		
			location.replace('${path }/member/order/orderList.do');
		});		
	}
})
</script>
</body>
</html>