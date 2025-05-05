
<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="algorithm.CiperText"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;


   
    try {
        con = DbConnection.getConnection();
        System.out.println("After Getting Connection");
        st = con.createStatement();
        System.out.println("After Firing Statement");
       
                try {
                     st.executeUpdate("update reg set status='Approved' where name='varsha'");
                   
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    response.sendRedirect("ser_home.jsp?approved=approved");

%>


