<%-- <%@ include file="/WEB-INF/includes/header.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page errorPage="error.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/custom.css"/>"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	/* 		$(document).ready(function() {
	 resize_to_fit();
	 });

	 function resize_to_fit() {
	 var fontsize = $('.dyanamic_font').css('font-size');
	 $('.dyanamic_font').css('fontSize', parseFloat(fontsize));

	 if ($('.dyanamic_font').height() >= $('.dyanamic_font div').height()) {
	 resize_to_fit();
	 }
	 } */
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="../redirectDisplay">Shopp-E</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="../redirectDisplay">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="index.jsp" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Products</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="cat" items="${Category }" varStatus="status">
						<a class="dropdown-item"
							href="../getCategory/${cat.pk_g11_categories }"><c:out
								value="${cat.gc_name }" /></a>
					</c:forEach>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="../getCategory/9">All Products</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">Compare</a></li>
		</ul>
		<!-- <form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form> -->

		<ul class="nav justify-content-end">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <%=session.getAttribute("user_name")%>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">My Orders</a> <a
						class="dropdown-item" href="#">My Profile</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="../redirectLogout">Logout</a>
				</div></li>
			<li class="nav-item"><a class="nav-link active" href="../myCart/9">Cart</a>
			</li>
		</ul>
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<c:forEach var="cprod" items="${Category_Product }"
				varStatus="status">
				<div class="card col-sm-3 product_card">
					<img class="card-img-top" src="<c:url value="${cprod.gp_image }" />"
						alt="Card image cap" style="margin-top:15px;width: 200px;height:200px; !important""/>
					<div class="card-body">
						<h5 class="card-title"><a href="../productdata/${cprod.pk_g11_products }/${cprod.gp_cid }">
							<c:out value="${cprod.gp_name }" />
							</a>
						</h5>
						<p class="card-text">
							Price:&nbsp; &#8377;
							<c:out value="${cprod.gp_price }" />
						</p>
					</div>
					<div class="card-body">
						<a href="../addCartData/${cprod.pk_g11_products }" class="card-link">Cart</a> <a href="#"
							class="card-link">Compare</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>

</body>
</html>