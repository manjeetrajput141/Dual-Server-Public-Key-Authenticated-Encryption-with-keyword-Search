<%@page import="Dbcon.DbConnection"%>
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
                        <li><a href="uhome.jsp">User Home</a></li>
                        <li><a href="share.jsp">Share File</a></li>
                        <li class="active"><a href="file_de.jsp">Send File</a></li>
                        <li><a href="receive.jsp">Receive file</a></li>
                        <li><a href="search.jsp">Search file</a></li>
                        <li><a href="down.jsp">Download</a></li>
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
                <br><br><center><h2 style="font-size: 26px; color: #00AEFF; font-family: cursive">Sent File Details</h2>
                    <br><table border="2" style="text-align: center; margin-left: 0px; border-color: black">
                        <tr>
                            <th style="text-align: center;width: 200px; font-size: 16px; color: brown">File ID</th>
                            <th style="text-align: center;width: 200px; font-size: 16px; color: brown">File Name</th>
                            <th style="text-align: center;width: 400px;  font-size: 16px; color: brown">Receiver</th>
                            <th style="text-align: center;width: 200px;  font-size: 16px; color: brown">Time</th>
                            <th style="text-align: center;width: 200px;  font-size: 16px; color: brown">Public Key</th>
                        </tr>
                        <tr>
                            <%
                                String User = (String)session.getAttribute("sssname");
                                System.out.println(User);;
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from ser where sent_name='" + User + "'");
                                    while (rs.next()) {
                            %>
                            <td style="font-size: 16px"><br><%=rs.getString("id")%></td>  
                            <td style="font-size: 16px"><br><%=rs.getString("filename")%></td>   
                            <td style="font-size: 16px"><br><%=rs.getString("receicer")%></td>  
                            <td style="font-size: 16px"><br><%=rs.getString("time")%></td>  
                            <td style="font-size: 16px"><br><%=rs.getString("public_key")%></td>   
                        </tr>
                        <%
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                    </table>
                    <br><br><br><br><br><br><br><br><br><br><br><br>

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