
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


    String name = request.getParameter("name");
    String role=request.getParameter("role");
    String pass = request.getParameter("pass");
    String Eamil = request.getParameter("email");
    String dob = request.getParameter("dob");
    String Gender = request.getParameter("gen");
    String phone = request.getParameter("phone");
    String State = request.getParameter("state");
    String Country = request.getParameter("country");
    String secret = request.getParameter("secret");
    System.out.println("User Details" + phone + Gender + dob + State + Eamil + name + pass + Country);
    
    String skey = request.getParameter("skey1");
    String skey2 = request.getParameter("skey2");
   
    System.out.println("Skey: " + skey+ "Skey2: "+skey2);
    session.setAttribute("secret_key1", skey);
    int status = Integer.parseInt(request.getParameter("status"));
    try {
        con = DbConnection.getConnection();
        System.out.println("After Getting Connection");
        st = con.createStatement();
        System.out.println("After Firing Statement");
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='owner'");
                    if (rs.next()) {
                        session.setAttribute("sssname", rs.getString("name"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        session.setAttribute("sssstate", rs.getString("state"));
                        session.setAttribute("ssscountry", rs.getString("country"));
                        response.sendRedirect("ownerHome.jsp?msg=success");
                    } else {
                        response.sendRedirect("dataOwner.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    
                    int i = st.executeUpdate("insert into reg(name, pass, email, dob, gen, phone, state, country,status,role) values ('" + name + "','" + pass + "','" + Eamil + "','" + dob + "','" + Gender + "','" + phone + "','" + State + "','" + Country + "','Pending','"+role+"')");
                    if (i != 0) {
                                                                                                                                     
                        response.sendRedirect("index.jsp?msg=success");
                    } else {
                        response.sendRedirect("reg.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 3:
                try {
                	
                	
                	//MyCode {
                		
                		try{
                    rs = st.executeQuery("select * from assistantServer where name='" + name + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sssname", rs.getString("name"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        session.setAttribute("sssstate", rs.getString("state"));
                        session.setAttribute("ssscountry", rs.getString("country"));
                        response.sendRedirect("assistantHome.jsp?msg=success");
                    } else {
                        response.sendRedirect("assistantServer.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
               
                		
                	}
                	catch(Exception e){
                		e.printStackTrace();
                	}
                	 break;
                	
                	
                	
                  /*   if (name.equalsIgnoreCase("server1") && pass.equalsIgnoreCase("server1")) {
                        response.sendRedirect("ser_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("server1.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break; */
                case 4:
                try {
                    if (name.equalsIgnoreCase("server2") && pass.equalsIgnoreCase("server2")) {
                        response.sendRedirect("server_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("server2.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 5:
                try {
                    rs = st.executeQuery("select * from ser where skey='" + skey + "' AND skey1='" + skey2 + "'");
                    if (rs.next()) {

                        response.sendRedirect("download.jsp?msg=success");
                    } else {
                        response.sendRedirect("down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 6:
                try {
                    rs = st.executeQuery("select * from upload where fileaccess='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("passd", pass);
                        response.sendRedirect("download.jsp?msg=success");
                    } else {
                        response.sendRedirect("down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 7:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='receiver'");
                    if (rs.next()) {
                        session.setAttribute("sssname", rs.getString("name"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        session.setAttribute("sssstate", rs.getString("state"));
                        session.setAttribute("ssscountry", rs.getString("country"));
                        response.sendRedirect("receiverHome.jsp?msg=success");
                    } else {
                        response.sendRedirect("dataReceiver.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
                
                
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>