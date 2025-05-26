<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home | Page</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/main1.css" rel='stylesheet' type='text/css' />
        <link href="css/main2.css" rel='stylesheet' type='text/css' />
        <script type="application/x-javascript"></script>
        <!--<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){		
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
                });
            });
        </script>
        <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Login Successfully');</script>
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
                    <h3><font style="font-family: cursive; color: #F7FDFF ">Dual-Server Public-Key Encryption With Keyword Search for Secure Cloud Storage</font></h3><br>
                </div><br>
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
                </div><br>
                <div class="clear"></div>
            </div>
        </div>
        <div class="menu" id="menu">
            <div class="container">
                <div class="h_menu4"><!-- start h_menu4 -->
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="receiverHome">Data Receiver Home</a></li>
                        <li><a href="receive.jsp">Download File</a></li>
                        <li><a href="file_de.jsp">Send File</a></li>
                        <li><a href="receive.jsp">Receive file</a></li>
                        <li><a href="search.jsp">Search file</a></li>
                        <li><a href="down.jsp">MyFile </a></li>
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
                <center><br><br>
                    <img src="images/file_share1.jpg"  height="400" width="900">
                </center>

				<center>
				<form action="Download" method="get" enctype="multipart/form-data">

					<select class="inputss" name="receiver">
						<%
						System.out.println("hi");
						String user = (String) session.getAttribute("sssname");
						System.out.println("hi" + user);
						Connection con = null;
						Statement st = null;
						ResultSet rs = null;
						try {
							con = DbConnection.getConnection();
							st = con.createStatement();
							rs = st.executeQuery("select * from reg where name!='" + user + "'");
							while (rs.next()) {
								String name = rs.getString("name");
						%>
						<option value="<%=name%>"><%=name%></option>

						<%
						}
						} catch (Exception ex) {
						ex.printStackTrace();
						}
						%>
					</select><br> 
					<input type="text" class="inputs" name="keyword"
						required="" placeholder="Enter File Keyword" /><br>
					<%
					Random RANDOM = new SecureRandom();
					int PASSWORD_LENGTH = 25;
					String letters = "qwertyuioplkjhgfdsazxcvbnm123456789ASDFGHJKLZXCVBNMQWERTYUIOP";
					String key = "";
					for (int i = 0; i < PASSWORD_LENGTH; i++) {
						int index = (int) (RANDOM.nextDouble() * letters.length());
						key += letters.substring(index, index + 1);
					}
					%>
					
					<!-- Just For Checking -->
					 <input type="text" class="inputs" name="buplic" readonly=""
						Value="<%=key%>" />
						
						
						<!-- <input type="text" class="inputs"
						name="myfile" required="" value="myfile" /> -->
						<br> 
					
						<br>
				    <input type="Submit"
						value="Download" class="button">
				</form>
			</center>
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
                    <p>© 2017 All right received <a href="#" target="_blank">/a></p>
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