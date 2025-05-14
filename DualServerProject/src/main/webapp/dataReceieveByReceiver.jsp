
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home | Page</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/main1.css" rel='stylesheet' type='text/css' />
<link href="css/main2.css" rel='stylesheet' type='text/css' />
<script type="application/x-javascript"></script>
<!--<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
<%
            if (request.getParameter("msg") != null) {
        %>
<script>
	alert('Login Successfully');
</script>
<%            }
        %>
<!-- grid-slider -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<!-- //grid-slider -->
</head>
<body>
	<div class="header-bottom">
		<div class="container">
			<div class="header-bottom_left">
				<h3>
					<font style="font-family: cursive; color: #F7FDFF">Dual-Server
						Public-Key Encryption With Keyword Search for Secure Cloud Storage</font>
				</h3>
				<br>
			</div>
			<br>
			<div class="social">
				<ul>
					<li class="facebook"><a href="#"><span> </span></a></li>
					<li class="twitter"><a href="#"><span> </span></a></li>
					<li class="pinterest"><a href="#"><span> </span></a></li>
					<li class="google"><a href="#"><span> </span></a></li>
					<li class="tumblr"><a href="#"><span> </span></a></li>
					<li class="instagram"><a href="#"><span> </span></a></li>
					<li class="rss"><a href="#"><span> </span></a></li>
				</ul>
			</div>
			<br>
			<div class="clear"></div>
		</div>
	</div>
	<div class="menu" id="menu">
		<div class="container">
			<div class="h_menu4">
				<!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="receiverHome.jsp">Data
							Receiver Home</a></li>
					<li><a href="receive.jsp">Download File</a></li>
					<li><a href="file_de.jsp">My Files</a></li>
					<li><a href="#">Keyword Index</a></li>
					<li><a href="#">File Transaction</a></li>

					<li><a href="index.jsp">logout</a></li>
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="main">
		<div class="container">
			<!-- start content-top -->
			<center>
				<br>
				<br> <img src="images/file_share1.jpg" height="400" width="900">
			</center>
			<div>
				<card> <cardbody>
				<h1>Document Information</h1>
				<p>

					<%
                      request.getParameter("data");
                    
            	%>

				</p>



				</cardbody> </card>

			</div>

			<!-- end content-top -->
		</div>
		<div class="container">
			<div class="row content_middle_bottom">
				<div class="clear"></div>
			</div>

		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<div class="copy">
				<p>
					© 2017 All right received <a href="#" target="_blank">/a>
				</p>
			</div>
			<div class="social">
				<ul>
					<li class="facebook"><a href="#"><span> </span></a></li>
					<li class="twitter"><a href="#"><span> </span></a></li>
					<li class="pinterest"><a href="#"><span> </span></a></li>
					<li class="google"><a href="#"><span> </span></a></li>
					<li class="tumblr"><a href="#"><span> </span></a></li>
					<li class="instagram"><a href="#"><span> </span></a></li>
					<li class="rss"><a href="#"><span> </span></a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>