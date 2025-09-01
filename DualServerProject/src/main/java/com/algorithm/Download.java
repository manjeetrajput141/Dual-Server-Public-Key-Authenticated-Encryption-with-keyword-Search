package com.algorithm;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
    	String receiverName = request.getParameter("receiver");
    	System.out.println("Key is "+key);
    	
    	
    	
    	
    	try {
    	  
          
          String documentInfo = SearchableEncryption.searchDocumentByKey(key);
          
          request.setAttribute("data", documentInfo);
          System.out.println("Data  is "+documentInfo);
          
          
          RequestDispatcher dispatcher = request.getRequestDispatcher("dataReceieveByReceiver.jsp");
          dispatcher.forward(request, response);
    	}
    	catch (Exception e) {
    		
			e.printStackTrace();
			response.sendRedirect("receiverHome.jsp?dataUpload=notupload");
		}
//    	try {
//    	    // Example: assume searchDocument() returns the file path
//    	    String filePath = SearchableEncryption.searchDocumentByKey(key); 
//    	    File file = new File(filePath);
//
//    	    if (!file.exists()) {
//    	        response.sendRedirect("receiverHome.jsp?dataUpload=notfound");
//    	        return;
//    	    }
//
//    	    // Set response headers
//    	    response.setContentType("application/octet-stream"); 
//    	    response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
//    	    response.setContentLengthLong(file.length());
//
//    	    // Write file to response
//    	    FileInputStream in = new FileInputStream(file);
//    	    OutputStream out = response.getOutputStream();
//
//    	    byte[] buffer = new byte[4096];
//    	    int bytesRead;
//    	    while ((bytesRead = in.read(buffer)) != -1) {
//    	        out.write(buffer, 0, bytesRead);
//    	    }
//
//    	    in.close();
//    	    out.close();
//
//    	} catch (Exception e) {
//    	    e.printStackTrace();
//    	    response.sendRedirect("receiverHome.jsp?dataUpload=error");
//    	}

    	
    	
      
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
