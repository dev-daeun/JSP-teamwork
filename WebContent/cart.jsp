<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dto.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@include file="./navigation.jsp"%>
	<div class="container" style="margin-top: 70px;">
	    <h1>장바구니</h1>
	    <div class="row">
	        <div class="col-sm-12 col-md-10 col-md-offset-1">
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th>품목</th>
	                        <th>수량</th>
	                        <th class="text-center">가격</th>
	                        <th class="text-center">합계</th>
	                        <th>수정/삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <% for(CartProductDto cart: (ArrayList<CartProductDto>)request.getAttribute("cartList")){ %>
	                    <tr>
	                        <td class="col-sm-8 col-md-6">
	                        <div class="media">
	                            <a class="thumbnail pull-left" href="/ShoppingMall/productInfo/item?code="+<%=cart.getProduct().getCode() %>> <img style="width: 40px; height: 40px;" class="media-object" src="<%=cart.getProduct().getImagePath()%>"> </a>
	                            <div class="media-body">
	                                <h4 class="media-heading"><a href=""><%=cart.getProduct().getName() %></a></h4>
	                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
	                            </div>
	                        </div></td>
	                        <td class="col-sm-1 col-md-1" style="text-align: center">
	                        <input type="email" class="form-control" id="exampleInputEmail1" value="1">
	                        </td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=cart.getProduct().getPrice() %></strong></td>
	                        <td class="col-sm-1 col-md-1">
	                        <button type="button" class="btn btn-danger">
	                            <span class="glyphicon glyphicon-remove"></span> 삭제
	                        </button></td>
	                    </tr>
					<%} %>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
	    <!-- Footer -->
 	<%@include file="./footer.html"%>
</body>
</html>