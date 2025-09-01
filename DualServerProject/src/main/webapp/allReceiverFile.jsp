<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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

 <%
        if (request.getParameter("approved") != null) {
            %>
            
            
            <script>alert('Request Not Sent');</script>
            <%        
        }
        else if (request.getParameter("msg") != null) {
        %>
        
        
        <script>alert('Request Sent Successfully...');</script>
        <%        
        
        
        }
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
                        <li class="active"><a href="receiverHome.jsp">Data Receiver Home</a></li>
                        <li><a href="receive.jsp">Download File</a></li>
                        <li><a href="allReceiverFile.jsp">My Files</a></li>
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
							style="text-align: center; width: 200px; font-size: 16px; color: brown">File Id
							</th>
						<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Data Owner
							</th>
						<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Data Available for Receiver Name</th>
						<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Status
							</th>
							<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Get Key For Download
							</th>
							
							<th
							style="text-align: center; width: 200px; font-size: 16px; color: brown">Remove File
							</th>
						
	
					</tr>
					<tr>
					
						<%
						Connection con = null;
						Statement st = null;
						ResultSet rs = null;
						try {
							con = DbConnection.getConnection();
							st = con.createStatement();
							rs = st.executeQuery("select * from assistantserverfile where receiver ='"+(String) session.getAttribute("sssname")+"'");
							while (rs.next()) {
						%>
						<form method="get" action="getKeyRequest.jsp">
						<input type="hidden" value=<%=rs.getString("dataId") %> name="dataId" />
						
						<td  style="font-size: 16px"><%=rs.getString("fileId")%></td>
						<td  style="font-size: 16px"><%=rs.getString("owner")%></td>
						<td style="font-size: 16px"><%=rs.getString("receiver")%></td>
						<td style="font-size: 16px"><%=rs.getString("filestatus")%></td>
						<td style="font-size: 16px">
						<% if(rs.getString("filestatus").startsWith("2")) 
							{
							%>
						<button type="submit" 
								class="primary">Get Key</button></td>
						
						<%}
						else if(rs.getString("filestatus").startsWith("3")){
							
							
							%>
							Pending...</td>
								
							<%} 
                            else if(rs.getString("filestatus").startsWith("4")){
							
							
							%>
							<a href="availableDataKey.jsp">Download Key</a></td>
								
							<%} 
							
						else{
							
						
						%>
						Request Submit to Assistant Server</td>
							
						<%}
						  session.setAttribute("ssdataId", rs.getString("dataId"));
						%>
						

						<td style="font-size: 16px"><a href="deleteDownloadKey.jsp">Delete</a></td>
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