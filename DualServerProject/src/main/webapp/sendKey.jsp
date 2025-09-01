<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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

    rs = st.executeQuery("select * from cloudserver where dataId='" + dataId + "'");
    if (rs.next()) {
     /*   st.execute("insert into receiverdata(receiverName,ownerName,dataId,downloadKey) values('"+rs.getString("receiverName")+"','"+rs.getString("ownerName")+"','"+rs.getString("dataId")+"','"+rs.getString("randomUUID")+"')");
  	 int i=st.executeUpdate("update cloudserver set testServerApproval='"+1+"' where dataId ='"+rs.getString(1)+"'");
		 */
		 
		  String receiverName = rs.getString("receiverName");
	        String ownerName    = rs.getString("ownerName");
	        String dataIdVal    = rs.getString("dataId");
	        String randomUUID   = rs.getString("randomUUID");

	        rs.close(); // ✅ close before reusing Statement

	        // Insert into receiverdata
	        st.executeUpdate("insert into receiverdata(receiverName,ownerName,dataId,downloadKey) " +
	                         "values('" + receiverName + "','" + ownerName + "','" + dataIdVal + "','" + randomUUID + "')");

	        // Update cloudserver
	        st.executeUpdate("update cloudserver set testServerApproval='1' where dataId ='" + dataIdVal + "'");
			st.executeUpdate("update testServerRequest set fileStatus='4 Available for Download' where dataID ='"+ dataId +"'");
			st.executeUpdate("update assistantserverfile set filestatus='4 Available for Download' where dataId ='"+ dataId +"'");
			 
		 
       redirectUrl = "testHome.jsp?msgg=success";
    } else {
        redirectUrl = "testHome.jsp?msgg=notfound";
    }

} catch (Exception ex) {
    ex.printStackTrace();
    redirectUrl = "testHome.jsp?msgg=error";
} finally {
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (st != null) try { st.close(); } catch(Exception e) {}
    if (con != null) try { con.close(); } catch(Exception e) {}

    response.sendRedirect(redirectUrl); // only ONE redirect
}
%>
