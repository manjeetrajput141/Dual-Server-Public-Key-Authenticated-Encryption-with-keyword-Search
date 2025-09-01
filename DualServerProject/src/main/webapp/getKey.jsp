<%@page import="com.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
						Connection con = null;
						Statement st = null;
						ResultSet rs = null;
						try {
							con = DbConnection.getConnection();
							st = con.createStatement();
							 int i=st.executeUpdate("update testserverfile set filestatus='Download Key :Pending at test server' where fileId='"+request.getParameter("fileId")+"'");
							
							 int u=st.executeUpdate("update cloudserver set testServerApproval='"+0+"' where dataId='"+request.getParameter("dataId")+"'");
							
                        
						
					
					
					
					} catch (Exception ex) {
					ex.printStackTrace();
					response.sendRedirect("receiverHome.jsp?msgg=failed");
					}
						finally{
							con.close();
							response.sendRedirect("receiverHome.jsp?msgg=success");
						}
					%>


