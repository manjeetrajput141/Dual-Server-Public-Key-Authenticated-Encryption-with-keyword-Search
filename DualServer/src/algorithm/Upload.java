
package algorithm;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dbcon.DbConnection;
import algorithm.CiperText;
import java.security.SecureRandom;
import java.util.Random;

public class Upload extends HttpServlet {
	
		

    File file;
    final String filepath = "D:\\uploads\\";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            MultipartRequest m = new MultipartRequest(request, filepath);
            String receiver = m.getParameter("receiver");
            String keyword = m.getParameter("keyword");
            String public_key = m.getParameter("buplic");
            File file = m.getFile("file");
            // Print get Value
            System.out.println("File ID" + keyword + receiver + public_key);
            String filename = file.getName().toLowerCase();

            Connection con = DbConnection.getConnection();
            Statement st3 = con.createStatement();
            ResultSet rt3 = st3.executeQuery("select * from ser where id='" + filename + "'");
            if (rt3.next()) {

                response.sendRedirect("share.jsp?failed='already used this file'");

            } else {

                BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
                StringBuffer sb = new StringBuffer();
                String temp = null;

                while ((temp = br.readLine()) != null) {
                    sb.append(temp);
                }
                System.out.println("string Buffer" + sb);
                
                CiperText CT = new CiperText();
                String Cipertext = CT.encrypt(sb.toString());
                FileWriter fw = new FileWriter(file);
                fw.write(Cipertext);
                fw.close();
                System.out.println("string Buffer" + Cipertext);

                //server 1
                Random RANDOM = new SecureRandom();
                int PASSWORD_LENGTH = 15;
                String letters = "qwertyuioplkjhgfdsazxcvbnmZXCVBNMASDFGHJKLQWERTYUIOP";
                String Secretkey = "";
                for (int i = 0; i < PASSWORD_LENGTH; i++) {
                    int index = (int) (RANDOM.nextDouble() * letters.length());
                    Secretkey += letters.substring(index, index + 1);
                }
                //server 2
                Random RANDOM1 = new SecureRandom();
                int PASSWORD_LENGTH1 = 15;
                String letter = "qwertyuioplkjhgfdsazxcvbnm1234567890";
                String Secretkey1 = "";
                for (int i = 0; i < PASSWORD_LENGTH1; i++) {
                    int index = (int) (RANDOM1.nextDouble() * letter.length());
                    Secretkey1 += letters.substring(index, index + 1);
                }

                HttpSession session = request.getSession(true);

                String sender = session.getAttribute("sssname").toString();
                DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd 'at' HH:mm:ss ");
                Date date = new Date();
                String time = dateFormat.format(date);
                System.out.println("current Date " + time);

                Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
                boolean status = new Ftpcon().upload(file);
               // boolean status= true;
                if(status){
                    int i = st1.executeUpdate("insert into ser(filename,content,sent_name,receicer,time,public_key,keyword,skey,skey1)values('" + file.getName() + "','" + Cipertext + "','" + sender + "','" + receiver + "','" + time + "','" + public_key + "','" + keyword + "','" + Secretkey + "','" + Secretkey1 + "')");
                    System.out.println(i);
                    if (i != 0) {
                        
                        int in = st2.executeUpdate("insert into server(filename,content,sent_name,receicer,time,public_key,keyword,skey1)values('" + file.getName() + "','" + Cipertext + "','" + sender + "','" + receiver + "','" + time + "','" + public_key + "','" + keyword + "','" + Secretkey1 + "')");
                        System.out.println(in);
                        if (in != 0) {

                            response.sendRedirect("share.jsp?msg='uploded'");
                        } else {
                            out.println("Error in Server 2");
                        }
                    } else {
                        out.println("Error in Server 1");
                    }
                }  
                else{
                	out.println("Not uploadd to cloud");
                }
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
