<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>회원가입완료</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%@include file="../navigation.jsp"%>
    	<div class="col-lg-4"></div>
		<div class="container col-lg-4" style="margin-top: 70px; margin-bottom: 50px; align: center;">
			<div class=" well">
				<form>
					<div class="form-group">
						<h2 class="well" style="text-align: center;">회원가입이 완료되었습니다.</h2>
					</div>
					<div class="form-group">
						<a href="/ShoppingMall/userInfo/login.jsp">
							<a href="/ShoppingMall/userInfo/login.jsp"><input type="button" class="btn btn-lg btn-info form-control" style="align: center;" value="로그인"></a>
						</a>
					</div>
				</form>	
			</div>
		</div>

    <!-- Footer -->
 	<%@include file="../footer.html"%>

    <!-- Bootstrap core JavaScript -->
    <script src="../jquery/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>