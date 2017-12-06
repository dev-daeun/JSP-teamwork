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
		    <h1 class="well">포스트 등록</h1>
			<div class="col-lg-12">
				<div class="row">
							<form action="/ShoppingMall/post" class="col-sm-12" enctype="multipart/form-data" method="POST">
									<div class="row">
										<div class="col-lg-12 form-group">
											<label>포스트 분류</label>
												<select name="category" class="form-control">
												  <option value="후기">후기</option>
												  <option value="문의">문의</option>
												</select>
										</div>
										<div class="col-lg-12 form-group">
											<label>제목</label>
											<input type="text" name="title" placeholder="제목을 입력하세요." class="form-control">						
										</div>										
										<div class="col-lg-12 form-group">
											<label>내용</label>
											<textarea name="content" placeholder="내용을 입력하세요." class="form-control">
											</textarea>
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