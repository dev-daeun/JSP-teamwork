<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ page import="controller.Error" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
</head>
	<style type="text/css">
		<%@ include file="./css/bootstrap.min.css" %>
		<%@ include file="./css/shop-homepage.css" %>
	</style>
<body>
	<div class = "container">
		<div class="row">
			<%if(request.getSession().getAttribute("uid")==null) {%>
				<%@include file="./navBeforeLogin.jsp"%>
			<% } else { %>
				<%@include file="./navigation.jsp" %>
			<% } %>	
			<h4><%=((Error)request.getAttribute("error")).getMessage()%></h4>
		</div>
	</div>
</body>
</html>