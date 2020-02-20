<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title> Affrah Shop - ${title} </title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="${css}/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="${css}/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="${css}/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="${css}/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="${css}/menu.css" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>

<body>
	<!-- top-header -->

	<!-- banner-2 -->
	<div class="page-head_agile_info_w3l">
		<!-- watch & phone -->
	</div>
	<!-- //banner-2 -->
	<!-- page -->
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			<div class="container">
				<ul class="w3_short">
					<li>
						<a href="${contextRoot}/home">Home</a>
						<i>|</i>
					</li>
					<li>Affrah shop</li>
				</ul>
			</div>
		</div>
	</div>

		
		<!-- Page Content -->

		<div class="content">
			
   <div class="container">
    
		   	<c:if test="${not empty message}">
				<div class="row">
					<div class="col-xs-12 col-md-offset-2 col-md-8">
						<div class="alert alert-danger fade in">${message}</div>
					</div>
				</div>
			</c:if>
		         
		   	<c:if test="${not empty logout}">
				<div class="row">
					<div class="col-xs-12 col-md-offset-2 col-md-8">
						<div class="alert alert-success">${logout}</div>
					</div>
				</div>
			</c:if>
		       
		    <div class="row">
		     
		     <div class="col-md-offset-3 col-md-6">
		      
		      <div class="panel panel-primary">
		       
		       <div class="panel-heading">
		        <h4>Login</h4>
		       </div>
		       
		       <div class="panel-body">
			        <form action="${contextRoot}/login" method="POST" class="form-horizontal"
			         id="loginForm"
			        >
			         <div class="form-group">
			          <label for="username" class="col-md-4 control-label">Email: </label>
			          <div class="col-md-8">
			           <input type="text" name="username" id="username" class="form-control"/>
			          </div>
			         </div>
			         <div class="form-group">
			          <label for="password" class="col-md-4 control-label">Password: </label>
			          <div class="col-md-8">
			           <input type="password" name="password" id="password" class="form-control"/>
			          </div>
			         </div>
			         <div class="form-group">
			          <div class="col-md-offset-4 col-md-8">
			           <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			           <input type="submit" value="Login" class="btn btn-primary"/>
			          </div>
			         </div>
		        </form>
		       
		       </div>
		       <div class="panel-footer">
		       	<div class="text-right">
		       		New User - <a href="${contextRoot}/register">Register Here</a>
		       	</div>
		       </div>
		      <br><br><br>
		      </div> 
		    
		     </div>
		     
		    </div>    
		   
  		 </div>

			
		</div>


		<!-- Footer comes here -->
		<%@include file="./canal/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>

		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>
		
		<!-- Self coded javascript -->
		<script src="${js}/myapp.js"></script>

	

</body>

</html>