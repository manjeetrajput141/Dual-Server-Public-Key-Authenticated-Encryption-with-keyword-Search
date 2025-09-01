<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>User Details | Page</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="css/main1.css" rel="stylesheet" type="text/css" />
    <link href="css/main2.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $("html,body").animate({
                    scrollTop: $(this.hash).offset().top
                }, 1200);
            });
        });
    </script>

    <!-- grid-slider -->
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <!-- //grid-slider -->
     <%
        if (request.getParameter("approved") != null) {
            %>
            
            
            <script>alert('Request Sent Success ');</script>
            <%        
        }
        else if (request.getParameter("msg") != null) {
        %>
        
        
        <script>alert('Sent Successfully');</script>
        <%        
        
        
        }
        %>
    
    
</head>
<body>
    <div class="header-bottom">
        <div class="container">
            <div class="header-bottom_left">
                <h3>
                    <font style="font-family: cursive; color: #F7FDFF">
                        Dual-Server Public-Key Encryption With Keyword Search for Secure Cloud Storage
                    </font>
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
                    <li class="active"><a href="assistantHome.jsp">Assistant Server</a></li>
                    <li><a href="fileDetails.jsp">File Details</a></li>
                    <li ><a href="userDetail.jsp">User Details</a></li>
                    <li><a href="req1.jsp">User Request</a></li>
                    <li><a href="allAssistantServerRequest.jsp">All Assistant Server Request</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
                <script type="text/javascript" src="js/nav.js"></script>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="main">
        <div class="container">
            <!-- start content-top -->
            <br><br>
            <h2 style="font-size: 26px; color: #00AEFF; font-family: cursive">
               <div class="text-center"> All Data Requests are as follows</div>
            </h2>
            <br>

            <table border="2" style="text-align: center; margin-left: 0; border-color: black">
                <tr>
                    <th style="width: 200px; font-size: 16px; color: brown;">Data Id</th>
                    <th style="width: 200px; font-size: 16px; color: brown;">Receiver Name</th>
                    <th style="width: 400px; font-size: 16px; color: brown;">Owner Name</th>
                    <th style="width: 200px; font-size: 16px; color: brown;">Status</th>
                    <th style="width: 200px; font-size: 16px; color: brown;">Approve/Reject</th>
                </tr>

                <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;
                    try {
                        con = DbConnection.getConnection();
                        st = con.createStatement();
                        rs = st.executeQuery("select * from assistantserverfile");
                        while (rs.next()) {
                %>
                <tr>
                    <form method="get" action="approveFile.jsp">
                        <td style="font-size: 16px;"><%=rs.getString("dataId")%></td>
                        <td style="font-size: 16px;"><%=rs.getString("receiver")%></td>
                        <td style="font-size: 16px;"><%=rs.getString("owner")%></td>
                        <td style="font-size: 16px;"><%=rs.getString("filestatus")%></td>
                        <td style="font-size: 16px;"><%=rs.getString(5)%></td>

                        <input type="hidden" name="dataId" value="<%=rs.getString("dataId")%>" />

                        <td style="font-size: 16px;">
                            <button type="submit" class="primary">Approve</button>
                        </td>
                    </form>
                </tr>
                <%
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>
            </table>
            <br><br><br><br><br><br><br><br><br><br><br>
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
                    © 2025 All rights reserved <a href="#" target="_blank"></a>
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
