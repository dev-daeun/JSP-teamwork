<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>사용자 게시판</title>



  </head>

  <body>
  <style type="text/css">
  	<%@ include file="../css/bootstrap.min.css"%>
  </style>
   	<%if(request.getSession().getAttribute("uid")==null) {%>
		<%@include file="../navBeforeLogin.jsp"%>
	<% } else { %>
		<%@include file="../navigation.jsp" %>
	<% } %>	

    <!-- Page Content -->
    <div class="container" style="margin-top: 70px;">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">회원 게시판  <a href="/ShoppingMall/postInfo/register.jsp"><button class="btn btn-info">글 등록하기</button></a></h1>
	<% for(UserPostDto element: (ArrayList<UserPostDto>)request.getAttribute("list") ) {%>
      <hr>
      <div class="row">
      	 <div class="col-md-5">
      	 	<img src="${pageContext.request.contextPath}/WebContent/static/2729985ef1b1182df241f7a80be60966.jpg">
      	 </div>
        <div class="col-md-7">
          <span style="font-size: 30px; margin-right: 20px;"><%=element.getPost().getTitle() %></span>
          <a href="#"><span><%=element.getUser().getNickname() %></span></a>
          <p><%=element.getPost().getContent() %></p>
			<p style="float: right;"><%=element.getPost().getPostedTime() %></p>
          </a>
        </div>
      </div>
      <hr>
      <!-- /.row -->
	<% } %>
      <hr>

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
    <!-- /.container -->

    <!-- Footer -->
 	<%@include file="../footer.html"%>

    <!-- Bootstrap core JavaScript -->
    <script src="jquery/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

  </body>

</html>
