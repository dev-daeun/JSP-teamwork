<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>로그인</title>

</head>
<style type="text/css">
	<%@ include file="../css/bootstrap.min.css"%>
</style>
<body>
	<%@include file="../navBeforeLogin.jsp"%>
		<div class="col-lg-4"></div>
		<div class="container col-lg-4" style="margin-top: 70px; margin-bottom: 50px; align: center;">
			<div class=" well">
				<h1 class="well" style="text-align: center;">로그인</h1>
					<form action="/ShoppingMall/userInfo/login" method="POST">
						<div class="form-group">
							<label>이메일 주소</label>
							<input type="text" name="email" placeholder="slimemon@slime.com" class="form-control">
						</div>																	
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" name="password" placeholder="비밀번호를 입력하세요." class="form-control">
						</div>			
						<div class="form-group" style="align: center;">
							<button type="submit" class="btn btn-lg btn-info form-control">로그인</button>
						</div>					
					</form> 
			</div>
		</div>
    <!-- Footer -->
 	<%@include file="../footer.html"%>

    <!-- Bootstrap core JavaScript -->
    <script src="../jquery/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script>
    	
    </script>
</body>
</html>