<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>



<%
						Connection con = null;
						Statement st = null;
						ResultSet rs = null;
						try {
							con = DbConnection.getConnection();
							st = con.createStatement();
							 int i=st.executeUpdate("update cloudData set testServerApproval='"+1+"' where dataID='"+request.getParameter("fileId")+"'");
							 st.executeUpdate("update testServerRequest set status='Approved' where dataID='"+request.getParameter("fileId")+"'");
								
                        
						
					
					
					
					} catch (Exception ex) {
					ex.printStackTrace();
					}
					%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>User Details | Page</title>
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
					<li><a href="assistantHome.jsp">Assistant Server</a></li>
					<li><a href="fileDetails.jsp">File Details</a></li>
					<li class="active"><a href="userDetail.jsp">User Details</a></li>
					<li><a href="req1.jsp">User Request</a></li>
					<li><a href="down1.jsp">Download Details</a></li>
					<li><a href="index.jsp">logout</a></li>
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="main">
	<form action="approve.jsp" method="get">
		<div class="container">
			<!-- start content-top -->
			<br>
			<br>
			<center>
				<h2 style="font-size: 26px; color: #00AEFF; font-family: cursive">User
					Details</h2>
				<br>
				<table border="2"
					style="text-align: center; margin-left: 0px; border-color: black">
					<tr>
						
						<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Request By Name</th>
						
						
						<th
							style="text-align: center; width: 400px; font-size: 16px; color: brown">Test Server Approval Status</th>
						<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Approve/Reject</th>
	
					</tr>
					<tr>
					
						<%
					
						try {
							con = DbConnection.getConnection();
							st = con.createStatement();
							rs = st.executeQuery("select * from testServerRequest");
							while (rs.next()) {
						%>
						<form method="get" action="approveTestRequest.jsp">
						<td  style="font-size: 16px"><%=rs.getString("dataID")%></td>
						
						<td style="font-size: 16px"><%=rs.getString("receiverName")%></td>
						<td style="font-size: 16px"><%=rs.getString("status")%></td>
						
						<input type="hidden" name="fileId" value=<%=rs.getString("fileId")%>></input>
                        
						

						<td style="font-size: 16px"><button type="submit" 
								class="primary">Approve</button></td>
								</form>
					</tr>
					
					<%
					}
					} catch (Exception ex) {
					ex.printStackTrace();
					}
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

				<!-- end content-top -->
		</div>
		<div class="container">
		
			<div class="row content_middle_bottom">
				<div class="clear"></div>
			</div>

		</div>
		</form>
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