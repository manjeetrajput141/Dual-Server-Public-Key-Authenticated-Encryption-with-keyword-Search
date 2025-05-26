package com.algorithm;

import java.io.File;
import java.io.IOException;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download extends HttpServlet {
	
		

	
    File file;
    final String filepath = "D:\\uploads\\";
    
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("Inside Process");
    	
    	String key=(String)request.getParameter("keyword");
    	String fileData = request.getParameter("fileData");
    	System.out.println("Key is "+key);
    	
    	
    	
    	
    	try {
    	  
          
          String documentInfo = SearchableEncryption.searchDocument(key);
          request.setAttribute("data", documentInfo);
          System.out.println("Data  is "+documentInfo);
          
          
          RequestDispatcher dispatcher = request.getRequestDispatcher("dataReceieveByReceiver.jsp");
          dispatcher.forward(request, response);
    	}
    	catch (Exception e) {
    		
			e.printStackTrace();
			response.sendRedirect("receiverHome.jsp?dataUpload=notupload");
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
