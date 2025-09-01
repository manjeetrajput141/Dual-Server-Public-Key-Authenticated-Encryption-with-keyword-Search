
<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="com.algorithm.CipherText"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;


   
    try {
        con = DbConnection.getConnection();
        System.out.println("After Getting Connection");
        st = con.createStatement();
     
        
        
        String dataId = (String) session.getAttribute("ssdataId");
        if (dataId != null) {
            System.out.println("Data ID from session: " + dataId);
        } else {
            System.out.println("No Data ID found in session");
        }
   
                try {
                     st.executeUpdate("delete from testserverrequest where dataID='"+dataId+"'");
                     st.executeUpdate("delete from assistantserverfile where dataId='"+dataId+"'");
                     st.executeUpdate("delete from receiverdata where dataId='"+dataId+"'");
                   
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    response.sendRedirect("receiverHome.jsp?approved=approved");

%>


