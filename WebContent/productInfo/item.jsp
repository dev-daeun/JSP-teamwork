<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.ProductDto" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>액괴쇼핑몰 - 슬라임슬라임</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/shop-item.css" rel="stylesheet">

  </head>

  <body>

    <%@include file="../navigation.jsp"%>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h3 class="my-4">슬라임슬라임<img width="70px" height="70px" src="http://file2.instiz.net/data/cached_img/upload/201506049/639f49dc5697497e782ad306c4aa0d16.png"></h3>
          <div class="list-group">
            <a href="/ShoppingMall/productInfo/list?category=perl" class="list-group-item">진주</a>
            <a href="/ShoppingMall/productInfo/list?category=sand" class="list-group-item">색모래</a>
            <a href="/ShoppingMall/productInfo/list?category=etc" class="list-group-item">기타</a>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">
          <div class="card mt-4">
            <img class="card-img-top img-fluid" style="width: 824px; height: 360px;" src="<%=((ProductDto)request.getAttribute("item")).getImagePath()%>" alt="">
            <div class="card-body">
              <h3 class="card-title"><%=((ProductDto)request.getAttribute("item")).getName() %></h3>
              <h4>￦<%=((ProductDto)request.getAttribute("item")).getPrice() %></h4>
              <p class="card-text"><%=((ProductDto)request.getAttribute("item")).getDescription() %></p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
              	<button name="productCode" id="product-code" value="<%=((ProductDto)request.getAttribute("item")).getCode()%>" style="display: none;"></button>
              	<input type="submit" style="float: right;" class="btn btn-success" value="찜 하기">
              	<input type="submit" id="add-cart" style="float: right; margin-right: 10px;" class="btn btn-info" value="장바구니">
              	
              <div>
 
              </div>
            </div>
          </div>
          <!-- /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              Product Reviews
            </div>
            <div class="card-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <a href="#" class="btn btn-success">Leave a Review</a>
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->

       <!-- Footer -->
 	<%@include file="../footer.html"%>

    <!-- Bootstrap core JavaScript -->
    <script src="../jquery/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
	<script>
	<!--
	$("#add-cart").click(function(){
		$.ajax({
			url: "/ShoppingMall/cart",
			method: "POST",
			data: {
				productCode: $("#product-code").val()
			},
			error: function(xhr, status, err){
				alert(xhr.responseText);
			},
			success: function(){
				alert("장바구니에 담겼습니다.")
			}
		})
	})
		-->
	</script>
  </body>

</html>
