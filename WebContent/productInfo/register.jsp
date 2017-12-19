<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>포스트 등록</title>
</head>
<style>
	<%@ include file="../css/bootstrap.min.css"%>
</style>
<body>
	<%@include file="../navBeforeLogin.jsp"%>
    <div style="align: center;">
	    <div class="container" style="margin-top: 70px; margin-bottom: 50px; align: center;">
		    <h1 class="well">상품 등록</h1>
			<div class="col-lg-12">
				<div class="row">
							<form action="/product/registration" class="col-sm-12" enctype="multipart/form-data" method="POST">
									<div class="row">
										<div class="col-lg-12 form-group">
											<label>상품 분류</label>
												<select name="category" class="form-control">
												  <option value="perl">진주</option>
												  <option value="sand">색모래</option>
												  <option value="etc">기타</option>
												</select>
										</div>
										<div class="col-lg-12 form-group">
											<label>상품 이름</label>
											<input type="text" name="name" placeholder="상품 이름을 입력하세요." class="form-control">						
										</div>										
										<div class="col-lg-12 form-group">
											<label>상품 설명</label>
											<input type="text" name="description" placeholder="상품 설명을 입력하세요." class="form-control">
										</div>
										<div class="col-lg-12 form-group">
											<label>상품 가격</label>
											<input type="text" name="price" placeholder="상품 가격을 입력하세요." class="form-control">						
										</div>			
										<div class="col-lg-12 form-group">
											<label>상품 이미지</label>
											<input type="file" name="file" placeholder="파일 업로드" class="form-control">
										</div>																		
									</div>								
								<button type="submit" class="btn btn-lg btn-info" style="align: center;">등록하기</button>					
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