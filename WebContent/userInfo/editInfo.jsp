<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>회원정보 수정</title>
</head>
<style>
	<%@ include file="../css/bootstrap.min.css"%>
</style>
<body>
	<%@include file="../navBeforeLogin.jsp"%>
    <div style="align: center;">
	    <div class="container" style="margin-top: 70px; margin-bottom: 50px; align: center;">
		    <h1 class="well">회원정보 수정</h1>
			<div class="col-lg-12 well">
				<div class="row">
							<form action="/ShoppingMall/userInfo/edit" method="POST">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-6 form-group">
											<label>이메일 주소</label>
											<input type="text" name="email" value="<%=request.getAttribute("email") %>" placeholder="slimemon@slime.com" class="form-control">
										</div>
										<div class="col-sm-6 form-group">
											<label>닉네임</label>
											<input type="text" name="nickname" value="<%=request.getAttribute("nickname") %>"placeholder="닉네임을 입력하세요." class="form-control">						
										</div>										
										<div class="col-sm-6 form-group">
											<label>비밀번호</label>
											<input type="password" name="password" value="<%=request.getAttribute("password") %>" placeholder="비밀번호를 입력하세요." class="form-control">
										</div>
										<div class="col-sm-6 form-group">
											<label>비밀번호 확인</label>
											<input type="password" name="checkPassword" value="<%=request.getAttribute("password") %>" placeholder="비밀번호를 또 입력하세요." class="form-control">
										</div>																				
									</div>					
									<div class="form-group">
										<label>핸드폰 번호</label>
										<input type="text" name="phone" value="<%=request.getAttribute("phone") %>" placeholder="000-0000-0000" class="form-control">
									</div>	
									<div class="form-group">
										<label>거주지 주소</label>
										<input type="text" name="address" value="<%=request.getAttribute("address") %> "placeholder="대치4동 340-03 2001호" class="form-control">
									</div>		
									<div class="form-group">
										<label>보유 마일리지</label>
										<h5><%=request.getAttribute("mileage")%>p</h5>
									</div>			
									<button type="submit" class="btn btn-lg btn-info" style="float: right;">회원정보 수정</button>					
								</div>
							</form> 
						</div>	
				</div>
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