<%@page import="Dbcon.Mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
{
   String url = "jdbc:mysql://localhost:3306/dual_server";
        String user = "uname";
        String password = "upass";
        int id=Integer.parseInt(request.getQueryString());
        session.setAttribute( "theSidd", id );
        System.out.println("id session id set successfully"+id);
      
            Connection conn = DriverManager.getConnection(url, user, password);
           
            
            String sql = "Select *  from request where id = '" + id + "' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
              String name =result.getString("user_name");   
             String key =result.getString("skey");
            String email =result.getString("email");
            session.setAttribute( "ssEmail", email );  
             String msg ="Server1\n Secret Key : "+key ;
             session.setAttribute( "Key", key );  
                      System.out.println("uour randome string"+msg);
            Mail m = new Mail();
            m.secretMail(msg, name, email);
           
           response.sendRedirect("update1.jsp");
     }else{
           response.sendRedirect("req2.jsp");
     }
     }
%>

 