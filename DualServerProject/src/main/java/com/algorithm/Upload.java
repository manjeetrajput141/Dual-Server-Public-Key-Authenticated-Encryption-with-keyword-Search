
package com.algorithm;


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
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.db.DbConnection;
import com.algorithm.CipherText;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.util.Random;

public class Upload extends HttpServlet {
	
		

	
    File file;
    final String filepath = "D:\\uploads\\";
    
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String key=(String)request.getParameter("keyword");
    	String fileData = request.getParameter("fileData");
    	String receiver=request.getParameter("receiverName");
    	String owner=request.getParameter("owner");
    	System.out.println("Key is "+key);
    	System.out.println("Data  is "+fileData);
    	
    	
    	
    	try {
    	  KeyPair keyPair = RSAEncryption.generateKeyPair();
          PublicKey publicKey = keyPair.getPublic();
          PrivateKey privateKey = keyPair.getPrivate();
          try {
        	  Connection con = null;
        	    Statement st = null;
        	    ResultSet rs = null;
        	    con = DbConnection.getConnection();
                System.out.println("After Getting Connection");
                st = con.createStatement();
                
               
                        try {
                             st.execute("insert into allfile (owner,receiver,filestatus) value ('"+owner+"','"+receiver+"','Upload Pending')");
                           
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
        	  
          }catch (Exception e) {
			// TODO: handle exception
        	  e.printStackTrace();
		}
          SearchableEncryption.storeDocument(fileData, key, publicKey,privateKey,receiver);
          response.sendRedirect("ownerHome.jsp?dataUpload=1");
          
          
    	}
    	catch (Exception e) {
    		
			e.printStackTrace();
			response.sendRedirect("ownerHome.jsp?dataUpload=0");
		}
    	
    	
      
    }
   


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
