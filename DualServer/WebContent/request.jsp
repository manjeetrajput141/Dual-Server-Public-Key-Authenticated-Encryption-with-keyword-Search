<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@ page import="Dbcon.DbConnection"%>

<%


    try {
        String User_Name = (String) session.getAttribute("sssname");
        String Email = (String) session.getAttribute("sssemail");
        String State = (String) session.getAttribute("sssstate");
        String Country = (String) session.getAttribute("ssscountry");

        String fname = request.getParameter("filename");
        String skey = request.getParameter("skey");
        String skey1 = request.getParameter("skey1");
        
        System.out.println("File Name: " + User_Name);
        System.out.println("File Name: " + Email);
        System.out.println("File Name: " + State);
        System.out.println("File Name: " + Country);
        System.out.println("File Name: " + fname);
        System.out.println("File Name: " + skey);
        System.out.println("File Name: " + skey1);
        String ser1 = "No";
        String ser2 = "No";

        Connection con = DbConnection.getConnection();
        Statement st = con.createStatement();

        String sql = "insert into request(user_name, email, state, country, filename, skey, skey1, ser1, ser2) values ('" + User_Name + "','" + Email + "','" + State + "','" + Country + "','" + fname + "','" + skey + "','" + skey1 + "','" + ser1 + "','" + ser2 + "')";
        int x = st.executeUpdate(sql);
        if (x != 0) {

            response.sendRedirect("search.jsp?msg=Request_send_Successfully");
        } else {
            response.sendRedirect("search.jsp?msgg=faild");
        }
        con.close();
        st.close();
    } catch (Exception e) {
        out.println(e);
    }
%>   