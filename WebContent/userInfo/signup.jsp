<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>회원가입</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%@include file="../navBeforeLogin.jsp"%>
    <div style="align: center;">
	    <div class="container" style="margin-top: 70px; margin-bottom: 50px; align: center;">
		    <h1 class="well">회원가입</h1>
			<div class="col-lg-12 well">
				<div class="row">
							<form action="/ShoppingMall/userInfo/signup" method="POST">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-6 form-group">
											<label>이메일 주소</label>
											<input type="text" name="email" placeholder="slimemon@slime.com" class="form-control">
										</div>
										<div class="col-sm-6 form-group">
											<label>닉네임</label>
											<input type="text" name="nickname" placeholder="닉네임을 입력하세요." class="form-control">						
										</div>										
										<div class="col-sm-6 form-group">
											<label>비밀번호</label>
											<input type="password" name="password" placeholder="비밀번호를 입력하세요." class="form-control">
										</div>
										<div class="col-sm-6 form-group">
											<label>비밀번호 확인</label>
											<input type="password" name="checkPassword" placeholder="비밀번호를 또 입력하세요." class="form-control">
										</div>																				
									</div>					
									<div class="form-group">
										<label>핸드폰 번호</label>
										<input type="text" name="phone" placeholder="000-0000-0000" class="form-control">
									</div>	
									<div class="form-group">
										<label>거주지 주소</label>
										<div class="row">
											<div class="col-sm-4 form-group">
												<label>시/도</label>
												<select name="add1" class="form-control">
												  <option value="광주">광주</option>
												  <option value="대구">대구</option>
												  <option value="부산">부산</option>
												  <option value="서울">서울</option>
												  <option value="수원">수원</option>
												  <option value="인천">인천</option>
												</select>
											</div>	
											<div class="col-sm-4 form-group">
												<label>군/구</label>
												<select name="add2" class="form-control">
												  <option value="강남구">강남구</option>
												  <option value="서초구">서초구</option>
												  <option value="동작구">동작구</option>
												  <option value="남구">남구</option>
												  <option value="마포구">마포구</option>
												  <option value="은평구">은평구</option>
												  <option value="노원구">노원구</option>
												</select>
											</div>	
											<div class="col-sm-4 form-group">
												<label>상세 주소</label>
												<input type="text" name="add3" placeholder="대치4동 340-03 2001호" class="form-control">
											</div>		
										</div>										
									</div>					
								<button type="submit" class="btn btn-lg btn-info" style="align: center;">회원가입</button>					
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