<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.ProductDto" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="">
    <meta name="author" content="">

    <title>액괴쇼핑몰</title>



  </head>
	<style type="text/css">
		<%@ include file="../css/bootstrap.min.css"%>
		<%@ include file="../css/shop-homepage.css"%>
	</style>
  <body>

	<%if(request.getSession().getAttribute("uid")==null) {%>
		<%@include file="../navBeforeLogin.jsp"%>
	<% } else { %>
		<%@include file="../navigation.jsp" %>
	<% } %>	

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

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="https://i.ytimg.com/vi/XTwHo-RNnBg/maxresdefault.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="https://i.ytimg.com/vi/0LhUusTr3ok/maxresdefault.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="https://i.ytimg.com/vi/FfCiXznbWuk/maxresdefault.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

  			<h2>카테고리 - <%=request.getAttribute("category") %></h2>
  			<hr>
          <div class="row">
			<% for(ProductDto product: (ArrayList<ProductDto>)request.getAttribute("productList")) { %>
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="/ShoppingMall/productInfo/item?code=<%=product.getCode()%>">
                	<img class="card-img-top" src=<%=product.getImagePath()%> alt="">
                </a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="/ShoppingMall/productInfo/item?code=<%=product.getCode()%>"><%=product.getName()%></a>
                  </h4>
                  <h5>￦<%=product.getPrice()%></h5>
                  <p class="card-text"><%=product.getDescription()%></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
			<% } %>
          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

        <!-- Footer -->
 	<%@include file="../footer.html"%>
    <!-- Bootstrap core JavaScript -->
    <script src="../jquery/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>

  </body>

</html>
