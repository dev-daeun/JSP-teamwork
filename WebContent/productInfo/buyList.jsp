<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dto.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록</title>
   
</head>
<style type="text/css">
	<%@ include file="../css/bootstrap.min.css"%>
</style>
<body>
	<%@include file="../navigation.jsp"%>
	<div class="container" style="margin-top: 70px;">
	    <h1>구매목록</h1>

	        <div class="col-lg-12">
	            <table class="table table-hover">
	                <thead>
	                    <tr class="col-lg-12 media">
	                        <th class="col-lg-5">품목</th>
	                        <th class="col-lg-1">수량</th>
	                        <th class="col-lg-2 text-center">가격</th>
	                        <th class="col-lg-2 text-center">합계</th>
	                        <th class="col-lg-2">취소</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <% for(CartProductDto cart: (ArrayList<CartProductDto>)request.getAttribute("buyList")){ %>
	                	  <tr class="col-lg-12 media" value="<%=cart.getProduct().getCode() %>">
								<td class="col-lg-5">		                    
		                          <div class="media-body">
		                          	<h4 class="media-heading">
		                          		<a class="thumbnail pull-left" href="/ShoppingMall/productInfo/item?code=<%=cart.getProduct().getCode() %>"> 
		                          			<img style="width: 120px; height: 80px;" class="media-object" src="<%=cart.getProduct().getImagePath()%>">
		                                	<%=cart.getProduct().getName() %>
		                                </a>
		                            </h4>
		                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
		                          </div>
	                        	</td>
	                        <td class="col-lg-1" style="text-align: center">
	                        		<strong><%=cart.getCart().getAmount() %></strong>
	                        </td>
	                        <td class="col-lg-2 text-center element-price"><strong><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="col-lg-2 text-center element-total-price"><strong><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="col-lg-2 ">
	                        		<button type="button" class="btn btn-danger cancel-button">구매취소</button>
	                        </td>
	                    </tr>
					<%} %>
	                </tbody>
	            </table>
	        </div>
	  
	</div>	   
   <div class="container" style="margin-bottom: 120px;"> 
	</div>  	   
	    <!-- Footer -->
 	<%@include file="../footer.html"%>
</body>
<script>
	<%@include file="../jquery/jquery.min.js"%>
</script>
<script type="text/javascript">
	$(function(){

		$("body").on("click", ".cancel-button", function(ent){
			if(confirm("구매취소 하시겠습니까?")){
				var code = $(ent.target).parents("tr").attr("value");
				$.ajax({
					url: "/ShoppingMall/purchase?code="+code,
					method: "DELETE",
					error: function(xhr, status, err){
						alert(xhr.responseText);
					},
					success: function(){
						alert("구매취소 되었습니다.");
						$(ent.target).parents("tr").remove();
					}
				})
			}
		})
	})
</script>
</html>