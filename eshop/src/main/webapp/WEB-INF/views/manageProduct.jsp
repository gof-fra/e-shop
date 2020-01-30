<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
	

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Affrah</title>
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
	
	<style type="text/css">
		.help-block {
			color: red;
		}
		
		.adminDatatableImg {
			width: 50px;
			height: 50px;
		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.js"></script>


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
	<link href="${css}/admin.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${css}/myapp.css" rel="stylesheet" type="text/css" media="all" />
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
	<!-- //navigation -->

	<!-- banner-2 -->
	<div class="page-head_agile_info_w3l">

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
					<li>Manage</li>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		
		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>
	</div><br>
	
	<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
		<span>M</span>anage
		<span>P</span>roducts
	</h3>
	
	<div class="container">
		<div class="agileinfo-ads-display col-lg-12">
			<div class="wrapper">
				<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">	
				
					<sf:form class="form-horizontal" modelAttribute="product"
					action="${contextRoot}/manage/products"
					method="POST"
					enctype="multipart/form-data"
					>
	
						<div class="form-group">
							<label class="control-label col-md-44" for="name">Enter Product Name</label>
							<div class="col-md-44">
								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-44" for="name">Enter Brand Name</label>
							<div class="col-md-44">
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-44" for="description"> Product Description: </label>
								<div class="col-md-44">
									<sf:textarea path="description" id="description" rows="4" placeholder="Write some description" class="form-control" />
									<sf:errors path="description" cssClass="help-block" element="em" />
								</div>
						</div>
																		
						<div class="form-group">						
							<label class="control-label col-md-44" for="unitPrice"> Enter Unit Price: </label>						
							 <div class="col-md-44">							
								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Write price" class="form-control"/>
							 	<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							 </div>
						</div>
																				
						<div class="form-group">						
							<label class="control-label col-md-44" for="quantity"> Quantity: </label>								
							<div class="col-md-44">									
								<sf:input type="number" path="quantity" id="quantity" placeholder="Write quantity" class="form-control"/>									
							</div>
						</div>
						
						<div class="form-group">						
							<label class="control-label col-md-44" for="file"> Select Image: </label>								
							<div class="col-md-44">									
								<sf:input type="file" path="file" id="file" class="form-control"/>	
								<sf:errors path="file" cssClass="help-block" element="em" />								
							</div>
						</div>
						
						<div class="form-group">		
							<label class="control-label col-md-44" for="categoryId"> Select Category: </label>								
							<div class="col-md-44">									
								<sf:select class="form-control" id="categoryId" path="categoryId"
									items="${categories}"
									itemLabel="name"
									itemValue="id"	
								/>																																	
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-offset-4 col-md-44" >
								<input type="submit" name="submit" id="submit"  class="bt btn-primary" />		
								
								<sf:hidden path="id"/>
								<sf:hidden path="code"/>
								<sf:hidden path="supplierId"/>
								<sf:hidden path="activate"/>
								<sf:hidden path="purchases"/>
								<sf:hidden path="views"/>
							
							</div>
							
						</div>
	
					</sf:form>	
		
				</div>
			</div>
		</div>
	</div>

	<!-- //first section -->
	

	<!-- Admin table -->
	<hr>
	<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
		<span>A</span>vailable 
		<span>P</span>roducts
	</h3>

	<div class="container">
		<div class="agileinfo-ads-display col-lg-12">
		  <div class="wrapper">
			<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">	
				<div style="overflow:auto">
					<table id="adminProductsTable" class="table table-striped table-bordered">
				
					<thead>
							<tr>
								<th>ID</th>
								<th>&#160;</th>
								<th>Name</th>
								<th>Brand</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Active</th>
								<th>Edit</th>
							</tr>
					</thead>
					
	     			<tbody>
							<tr>
								<td> 4 </td>
								<td> 
									
									<img class="adminDatatableImg" src="${contextRoot}/resources/images/PRDDEF121OPMC.jpg"
									alt="Mac OS" />
									
								</td>
								
								<td> Mac OS</td>
								
								<td>Apple</td>
								
								<td> 115 </td>  <!-- 3 quantity -->
								
								<td> &#8377; 7950.00 /- </td>
								
								<td> 
									<!-- toggle switch -->
									<label class="switch">
										<input type="checkbox" checked="checked" value="4"/>
										<div class="slider"></div>
									</label>
								</td>
								
								<td> 
									
									<a href="${contextRoot}/manage/4/product" class="btn btn-warning">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
									
								</td>
							</tr>
							
							<!-- ------- -->
							
							<tr>
								<td> 4 </td>
								<td> 
									
									<img class="adminDatatableImg" src="${contextRoot}/resources/images/PRDDEF121OPMC.jpg"
									alt="Mac OS" />
									
								</td>
								
								<td> Mac OS</td>
								
								<td>Apple</td>
								
								<td> 115 </td>
								
								<td> &#8377; 7950.00 /- </td>
								
								<td> 
									<!-- toggle switch -->
									<label class="switch">
										<input type="checkbox"  value="4"/>
										<div class="slider"></div>
									</label>
								</td>
								
								<td> 
									
									<a href="${contextRoot}/manage/4/product" class="btn btn-warning">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
									
								</td>
							</tr>
							
							
					</tbody>  
					
					<tfoot>
							<tr>
								<th>ID</th>
								<th>&#160;</th>
								<th>Name</th>
								<th>Brand</th> 
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Active</th>
								<th>Edit</th>
							</tr>
					</tfoot>
				
				
				</table>
				</div>	
			  </div>
			</div>
		</div>
	</div>
		
	<hr>

	<!-- //first section -->
	
	
	<!-- js-files -->
	<!-- jquery -->
	<script src="${js}/jquery-2.2.3.min.js"></script>
	<!-- //jquery -->

	<!-- nav smooth scroll -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //nav smooth scroll -->

	<!-- popup modal (for location)-->
	<script src="${js}/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="${js}/minicart.js"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!-- quantity -->
	<script>
		$('.value-plus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) + 1;
			divUpd.text(newVal);
		});

		$('.value-minus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) - 1;
			if (newVal >= 1) divUpd.text(newVal);
		});
	</script>
	<!--quantity-->
	<script>
		$(document).ready(function (c) {
			$('.close1').on('click', function (c) {
				$('.rem1').fadeOut('slow', function (c) {
					$('.rem1').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close2').on('click', function (c) {
				$('.rem2').fadeOut('slow', function (c) {
					$('.rem2').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close3').on('click', function (c) {
				$('.rem3').fadeOut('slow', function (c) {
					$('.rem3').remove();
				});
			});
		});
	</script>
	<!-- //quantity -->

	<!-- smoothscroll -->
	<script src="${js}/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="${js}/move-top.js"></script>
	<script src="${js}/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
		 	$().UItoTop({
				easingType: 'easeOutQuart'
			});
 
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="${js}/bootstrap.js"></script>
	<script src="${js}/jquery-2.2.3.min.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<!-- //jquery -->
	<script src="${js}/myapp.js"></script>
	<script src="${js}/dataTables.bootstrap4.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/bootbox.min.js"></script>
	<script src="${js}/bootbox.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->

</body>

</html>