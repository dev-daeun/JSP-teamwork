<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dto.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
   
</head>
<style type="text/css">
	<%@ include file="../css/bootstrap.min.css"%>
</style>
<body>
	<%@include file="../navigation.jsp"%>
	<div class="container" style="margin-top: 70px;">
	    <h1>장바구니</h1>

	        <div class="col-lg-12">
	            <table class="table table-hover">
	                <thead>
	                    <tr class="col-lg-12 media">
	                        <th class="col-lg-5">품목</th>
	                        <th class="col-lg-1">수량</th>
	                        <th class="col-lg-2 text-center">가격</th>
	                        <th class="col-lg-2 text-center">합계</th>
	                        <th class="col-lg-2">수정/삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <% for(int i = 0; i<((ArrayList<CartProductDto>)request.getAttribute("cartList")).size(); i++){ %>
	                  <% CartProductDto cart =  ((ArrayList<CartProductDto>)request.getAttribute("cartList")).get(i);%>
	                	  <tr class="col-lg-12 media" value="<%=cart.getProduct().getCode() %>">
								<td class="col-lg-5">		                    
		                          <div class="media-body">
		                          	<h4 class="media-heading">
		                          		<a class="thumbnail pull-left" href="/productInfo/item?code=<%=cart.getProduct().getCode() %>"> 
		                          			<img style="width: 120px; height: 80px;" class="media-object" src="<%=cart.getProduct().getImagePath()%>">
		                                	<%=cart.getProduct().getName() %>
		                                </a>
		                            </h4>
		                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
		                          </div>
	                        	</td>
	                        <td class="col-lg-1" style="text-align: center">
	                        		<input type="number" class="form-control" class="amount-input" id="amount-input<%=i%>" >
	                        </td>
	                        <td class="element-price col-lg-2 text-center"><strong ><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="element-total-price col-lg-2 text-center"><strong><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="col-lg-2 ">
	                        		<button type="button" class="btn btn-danger edit-amount"> 수정</button>
	                        		<button type="button" class="btn btn-danger"> 삭제</button>
	                        </td>
	                    </tr>
					<%} %>
	                </tbody>
	            </table>
	        </div>
	  
	</div>	   
   <div class="container" style="margin-bottom: 120px;">
   <% if(((ArrayList<CartProductDto>)request.getAttribute("cartList")).size()>0){%>
	   		<button type="button" id="buy-button" style="float: right; margin-right: 50px; margin-left: 10px;" class="btn btn-info btn-lg-6">구매하기</button>
	   		<span>합계 :</span> <span id="total-price" style="float: right; font-weight: bold"> <%=request.getAttribute("totalPrice") %></span>
	<% }  %>
	</div>  	   
	    <!-- Footer -->
 	<%@include file="../footer.html"%>
</body>
<script>
	<%@include file="../jquery/jquery.min.js"%>
</script>
<script type="text/javascript">
	$(function(){
		document.getElementsByClassName("amount-input").defaultValue = "1";
		
		var amountArray = new Array();
		$(".amount-input").each(function(idx, element){
				
		});
		$("body").on("click", ".edit-amount", function(ent){
			var amount = parseInt($(ent.target).parent().siblings("td.col-lg-1").children().val());
			var productPrice = parseInt($(ent.target).parent().siblings("td.element-price").children().text());
			var eachTotalPrice = $(ent.target).parent().siblings("td.element-total-price").children();
			eachTotalPrice.text(productPrice * amount);
			
			var totalPrice = parseInt($("#total-price").text());
			totalPrice += parseInt(eachTotalPrice.text());
			$("#total-price").text(totalPrice);
			
		})
		
		var productArray = new Array();
		
		$("#buy-button").click(function(){
			if(confirm("구매하시겠습니까?")){
				$("tr").each(function(idx, element){ 
					if($(element).attr("value")!=null) productArray.push($(element).attr("value")); 
				});
	
				$.ajax({
					url: "/purchase?value=post",
					method: "POST",
					data: {
						buyList: JSON.stringify(productArray),
						mileage: parseInt($("#total-price").text()) * 0.05
					},
					error: function(xhr, status, err){
						alert(xhr.responseText);
					},
					success: function(){
						alert("구매완료 되었습니다.");
						location.href="/purchase";
					}
				})
			}
		})
	})
</script>
</html>