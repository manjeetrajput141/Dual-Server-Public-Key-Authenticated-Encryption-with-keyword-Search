<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DbConnection"%>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;
String receiver = (String) session.getAttribute("sssname");
System.out.println("Receiver :"+receiver);

String dataId = request.getParameter("dataId");
System.out.println("DataID  :"+dataId);

String redirectUrl = "receiverHome.jsp?msgg=failed";  // default

try {
    con = DbConnection.getConnection();
    st = con.createStatement();

    rs = st.executeQuery("select * from assistantserverfile where dataId='" + dataId + "'");
    
    if (rs.next()) {
    	String owner=rs.getString(2);
    	String actualReceiver=rs.getString(2);
    	String Did=rs.getString(2);
    	String status="3 Key Request Submitted to Test Server";
    	rs.close();
    	

    	Statement st2 = con.createStatement();
    	st2.execute("update assistantserverfile set filestatus='3 Key Request Submitted to Test Server' where dataId='"+dataId+"'");
    	st2.executeUpdate("update cloudserver set status='3 Key Request Submitted to Test Server' where dataId ='"+ dataId +"'");
    	
        /* st2.executeUpdate("insert into testServerRequest (requestReceiver,ownerName,actualReceiver,dataId,fileStatus) values('"
            + receiver + "','" + rs.getString(2) + "','" + rs.getString(3) + "','" + dataId + "','3 Key Request Submitted to Test Server'"); */
       
            st2.execute("insert into testserverrequest (requestReceiver,ownerName,actualReceiver,dataId,fileStatus) values('"
            +receiver+"','"+owner+"','"+actualReceiver+"','"+dataId+"','"+status+"')");
            redirectUrl = "receiverHome.jsp?msgg=success";
    } else {
        redirectUrl = "receiverHome.jsp?msgg=notfound";
    }

} catch (Exception ex) {
    ex.printStackTrace();
    redirectUrl = "receiverHome.jsp?msgg=error";
} finally {
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (st != null) try { st.close(); } catch(Exception e) {}
    if (con != null) try { con.close(); } catch(Exception e) {}

    response.sendRedirect(redirectUrl); // only ONE redirect
}
%>
