

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

    <head>
        <title>New User Registration | Page</title>
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
        <script>
       /* 
        function phonenumber(inputtxt)  
        {  
        //  var phoneno = /^\d{10}$/;  
        var phoneno = /^\(?([7-9]{1})\)?d{9}$/;
          if((inputtxt.value.match(phoneno)))  
           {  
              return true;  
           }   
          else  
           {  
                alert("Invalid Phone No");  
                return false;  
           }  
        }*/  
        </script>
        <style> 

            .inputs {
                background: #BCEBFD;
                font-size: 0.9rem;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 200px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputs:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #72D0F4, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .inputss {
                background: #BCEBFD;
                font-size: 0.9rem;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 200px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputss:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #72D0F4, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .button {
                background-color: #4cae4c; /* Green */
                border: none;
                color: white;
                padding: 10px 27px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style> 
        <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Registration Successfully');</script>
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
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="dataOwner.jsp">Data Owner</a></li>
                        <li><a href="assistantServer.jsp">Assistant Server</a></li>
                        <li><a href="testServer.jsp">Test Server</a></li>
                        <li><a href="dataReceiver.jsp">Data Receiver</a></li>
                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="main">
            <div class="container">
                <!-- start content-top -->
                <br><br><br><!-- <center> -->
                <div class="text-center">
                <h2 style="font-size: 26px; color: #552200; font-family: cursive">Registration</h2>
                    <br><form action="login.jsp" method="get" name="form"> 
                         <select class="inputss" required="" name="role" >
                            <option value="select">Role</option>
                            <option value="owner">Owner</option>
                            <option value="receiver">Receiver</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        <br>
                        
                        <input type="text" class="inputs" name="name" required="" placeholder="Your Name" />&nbsp;&nbsp;&nbsp; 
                        <input type="password" class="inputs" name="pass" required="" placeholder="Password" /><br> 
                        <input type="email" class="inputs" name="email" required="" placeholder="e-mail" />&nbsp;&nbsp;&nbsp;
                        <input type="date" class="inputs" name="dob" required="" placeholder="Date Of Birth" /><br> 
                        <select class="inputss" required="" name="gen" >
                            <option value="select">Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        <input type="text" class="inputs" name="phone" id="phone" required="" placeholder="Phone Number" /><br> 
                        <input type="text"class="inputs" name="state" required="" placeholder="State" />&nbsp;&nbsp;&nbsp;
                        <input type="text"class="inputs" name="country" required="" placeholder="Country" /><br>
                        <input type="hidden" value="2" name="status" />
                        <input type="Submit" value="Register" class="button" onclick="phonenumber(document.form.phone)">
                        <input type="reset" value="Reset" class="button" >
                    </form>
                    </div>
                    
                   <!--  </center> -->


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