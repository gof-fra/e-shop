<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${css}/jquery.dataTables.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${css}/admin.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${css}/myapp.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->
	
	<style type="text/css">
		.dataTableImg {
			width: 50px;
			height: 50px;
		}
	</style>
	
	
	<style type="text/css">
		.table-responsive {
			overflow-x: inherit;
		}
	</style>


</head>

<body>


	<!-- banner-2 -->
	<div class="page-head_agile_info_w3l">

	</div>
	<!-- //banner-2 -->
	<!-- page -->
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			
				<div class="container">
				<c:if test="${userClickAllProducts == true}">
				
					<script type="text/javascript">
						window.categoryId = ''; 
					</script>
					
					<ul class="w3_short">
						<li>
							<a href="${contextRoot}/home">Home</a>
							<i>|</i>
						</li>
						<li>Electronics</li>
					</ul>
				</c:if>
				
				<c:if test="${userClickCategorylProducts == true}">
				
					<script type="text/javascript">
						window.categoryId = '${category.id}'; 
					</script>
					
					<ul class="w3_short">
						<li>
							<a href="${contextRoot}/home">Home</a>
							<i>|</i>
						</li>
						<li class="active">Category
						<i>|</i>
						</li>
						<li class="active">${category.name}</li>
					</ul>
				</c:if>
				</div>
			
		</div>
	</div>
	<!-- //page -->

	<!-- top Products -->
	<div class="ads-grid py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>P</span>roduits
				<span>D</span>isponible</h3>
			<!-- //tittle heading -->
			<div class="row">
				<!-- product left -->
				
				<div class="agileinfo-ads-display col-lg-12">
					<div class="wrapper">

						<br>
						<hr>
						<div>
							
							<div class="container-fluid">
							
								<div class="table-responsive">
								
									<table id="productListTable" class="table table-striped table bordered">
					
										<thead>
											<tr>
												<th></th>
												<th>Nom</th>
												<th>Contact</th>
												<th>Prix</th>
												<th>Quantité</th>
												<th></th>
											</tr>
										</thead>
										
										<tfoot>
											<tr>
												<th></th>
												<th>Nom</th>
												<th>Contact</th>
												<th>Prix</th>
												<th>Quantité</th>
												<th></th>
											</tr>
										</tfoot>
									
									</table>
										
								
								</div>
							</div>
						</div>
						<hr><br><br>
						
						
						<!-- //fourth section -->
						
						<!-- //fourth section -->
					</div>
				</div>
				<!-- //product left -->
					
			</div>
				
		</div>
			
	</div>

	

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
<%-- 	<script src="${js}/jquery.magnific-popup.js"></script>
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
	</script> --%>
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
	/* 	 	$().UItoTop({
				easingType: 'easeOutQuart'
			});  */

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="${js}/bootstrap.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/myapp.js"></script>
	<script src="${js}/dataTables.bootstrap4.js"></script>
	<script src="${js}/jquery-2.2.3.min.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/bootbox.min.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->

</body>

</html>