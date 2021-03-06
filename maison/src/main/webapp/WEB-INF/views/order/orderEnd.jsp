<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="결제완료"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/menuTitle.jsp">
	<jsp:param name="menuTitle" value="결제완료"/>
</jsp:include>
<style>
	.circle{
		width: 100px;height: 100px;border-radius: 50%;border: 5px solid black;
		left: 50%;
	}
</style>
<section>
	<div class="container" style="height: 500px;">
		<!-- <table class="table">
			<tr>
				<th>주문번호</th>
				<th>상품번호</th>
				<th>수량</th>
				<th>리뷰쓰기</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>
					<button class="btn btn-hover">review</button>
				</td>
			</tr>
		</table> -->
	
		<p class="text-center text-success" style="font-size: 50px;">결제가 완료되었습니다. <i class="far fa-check-circle"></i></p>
			
		<div class="container">
			<table class="table">
				<tr>
					<th>주문번호</th>
					<th>주문상세번호</th>
					<th>상품번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>리뷰</th>
				</tr>
				<c:forEach items="${list }" var="o">
				<tr>
					<td>${o.orderNo }</td>
					<td>${o.orderDetailNo }</td>
					<td>${o.productNo }</td>
					<td><img src="${path }/resources/upload/product/${o.productImg }" style="width: 50px;height: 50px;"></td>
					<td>${o.productName }</td>
					<td>${o.odAmount }</td>
					<td>${o.odAmount*o.price }</td>
					
					<td>
					<input type="hidden" value="${o.productNo }">
					<input type="hidden" value="${o.orderDetailNo }">
					<i class="fas fa-user-edit fa-2x addreview"></i>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="pop"></div>
</section>

<script>
	$(function(){
		//리뷰쓰는 팝띄우기		
		$(".addreview").click(function(){
			
			var productNo=$(this).prev().prev().val();
			var orderDetailNo=$(this).prev().val();
			
			$("#pop").css({
                "top": (($(window).height()-$("#pop").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#pop").outerWidth())/2+$(window).scrollLeft())+"px"
                //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
             
             }); 
			
			
			$.ajax({
				url : "${path }/shop/insertReview.do",
				data:{
					orderDetailNo : orderDetailNo,
					productNo : productNo	
				
				},
				dataType : "html",
				success : function(data){
					$("#pop").html("");
					$("#pop").html(data);
					$("#pop").show();
				}
						
			})
				
			});
		
		
		
		//닫기누르면 없애기
		$(".closebtn").click(function(){
			$("#pop").hide();
		});
		
		
		
		$(":checkbox").css("display","none"); 
		
		$(":checkbox").click(function(){
			var score= $(this).val();
			console.log(score);
			switch(score){
			
			case '1': 
				$("#rating1").prop("checked",true);
				$("#rating2").prop("checked",false);
				$("#rating3").prop("checked",false);
				$("#rating4").prop("checked",false);
				$("#rating5").prop("checked",false);
				$("#rating2").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating3").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating4").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating5").next().children("span").removeClass("starOn").addClass("starOff");
				break;
			case '2': 
				$("#rating1").prop("checked",false);
				$("#rating2").prop("checked",true);
				$("#rating3").prop("checked",false);
				$("#rating4").prop("checked",false);
				$("#rating5").prop("checked",false);
				$("#rating2").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating3").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating4").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating5").next().children("span").removeClass("starOn").addClass("starOff");
				break;
			case '3': 
				$("#rating1").prop("checked",false);
				$("#rating2").prop("checked",false);
				$("#rating3").prop("checked",true);
				$("#rating4").prop("checked",false);
				$("#rating5").prop("checked",false);
				$("#rating2").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating3").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating4").next().children("span").removeClass("starOn").addClass("starOff");
				$("#rating5").next().children("span").removeClass("starOn").addClass("starOff");
				break;
			case '4': 
				$("#rating1").prop("checked",false);
				$("#rating2").prop("checked",false);
				$("#rating3").prop("checked",false);
				$("#rating4").prop("checked",true);
				$("#rating5").prop("checked",false);
				$("#rating2").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating3").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating4").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating5").next().children("span").removeClass("starOn").addClass("starOff");
				break;
			case '5': 
				$("#rating1").prop("checked",false);
				$("#rating2").prop("checked",false);
				$("#rating3").prop("checked",false);
				$("#rating4").prop("checked",false);
				$("#rating5").prop("checked",true);
				$("#rating2").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating3").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating4").next().children("span").removeClass("starOff").addClass("starOn");
				$("#rating5").next().children("span").removeClass("starOff").addClass("starOn");
				break;
			
			
			}
		
		
		});

	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	