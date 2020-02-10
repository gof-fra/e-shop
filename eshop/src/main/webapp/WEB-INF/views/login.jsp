<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="images" value="/resources/images"/>
<spring:url var="fonts" value="/resources/fonts"/>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Affrah - ${title} </title>
	
	<script type="text/javascript">
	
		window.menu = '${title}';
		
		window.contextRoot = '${contextRoot}'
		
	</script>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content=""
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
	<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${css}/jquery.dataTables.css" rel="stylesheet" type="text/css" media="all" />
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
	<!-- navigation -->
	<%@ include file = "./canal/navbar.jsp" %>
	
		<!-- Sing Up -->
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Login</h5>
						
					</div>
					<div class="modal-body">
						<sf:form 
						action="${contextRoot}/login" 
						method="POST"
						class="form-horizontal"
						id="loginForm"
						>
							<div class="form-group">
								<label class="col-form-label">Email</label> 
									<div class="col-md-8">
								    	<sf:input type="text" path="username" class="form-control" id="username"/>
								    	<sf:errors path="firstName" cssClass="help-block" element="em" />
									</div>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Password</label> 
									<div class="col-md-8">
										<sf:input type="text" path="password" class="form-control" id="password"/>
										<sf:errors path="lastName" cssClass="help-block" element="em" />
									</div>
							</div>
							
							<div class="form-group">
								<label class="col-form-label">Conform Password</label> 
									<div class="col-md-8">
										<sf:input type="password" path="confirmPassword" class="form-control" placeholder="Password again"/>
										<sf:errors path="confirmPassword" cssClass="help-block" element="em" />
									</div>
							</div>
							
							<div class="right-w3l">
								
								<button type=submit class="btn btn-primary" value="Login" ></button>
				
							</div>
							
							<div>
								<p class="text-center dont-do mt-3">
									Don't have an account? <a href="#" data-toggle="modal"
										data-target="#exampleModal2"> Register Now</a>
								</p>
							</div>
							
							<div class="sub-w3l">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input"
										id="customControlAutosizing2"> <label
										class="custom-control-label" for="customControlAutosizing2">I
										Accept to the Terms & Conditions</label>
								</div>
							</div>
						</sf:form>
					</div>
				</div>
			</div>
		
		<br><br><br><br>
	
	<!-- footer -->
		<%@ include file = "./canal/footer.jsp" %>
	<!-- //copyright -->

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
	
	<!-- scroll seller -->
	<script src="${js}/scroll.js"></script>
	<!-- //scroll seller -->

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
		/* 	$().UItoTop({
				easingType: 'easeOutQuart'
			}); 
 */
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="${js}/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
	
	<!-- js-files -->
	<!-- jquery -->
	<script src="${js}/jquery-2.2.3.min.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/myapp.js"></script>
	<script src="${js}/dataTables.bootstrap4.js"></script>
	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/bootbox.min.js"></script>
	<script src="${js}/jquery.validate.js"></script>
	<script src="${js}/jquery.validate.min.js"></script>
	
</body>

</html>

