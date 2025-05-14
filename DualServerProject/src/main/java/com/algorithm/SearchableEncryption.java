package com.algorithm;

import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import com.db.DbConnection;

public class SearchableEncryption {
	
	

    // Storage inside Collection Map
    private static Map<String, String> db = new HashMap<>();

    // Here Encrypt data and store in map/db
    public static void storeDocument(String document, String keyword, PublicKey publicKey) throws Exception {
        String encryptedDocument = RSAEncryption.encrypt(document, publicKey);
        String keywordHash = hashKeyword(keyword);  // Hash the keyword
        
//        try {
//
//        	 Connection con = DbConnection.getConnection();
//             Statement st = con.createStatement();
//             String query="insert into cloudData(dataKey,dataInfo) values('"+keywordHash+"','"+encryptedDocument+"')";
//			st.execute(query);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
        
        
        //Saved inside Database
        
//        Checking without database
        db.put(keywordHash, encryptedDocument);  // Store encrypted document by hashed keyword
        
        
        
    }

    // Simulate Keyword Search: Compare Hashes
    public static String searchDocument(String keyword, PrivateKey privateKey) throws Exception {
        // Simulate keyword hashing
        String keywordHash = hashKeyword(keyword);
        String encryptedDocument;
        if (db.containsKey(keywordHash)) {
             encryptedDocument = db.get(keywordHash);  // Retrieve encrypted document
            return RSAEncryption.decrypt(encryptedDocument, privateKey);  // Decrypt document
        }
        
        
      
//        Connection con = DbConnection.getConnection();
//        Statement st = con.createStatement();
//        System.out.println("Keyword HashKey is :"+keywordHash);
//        String query="select * from cloudData where dataInfo='"+keywordHash+"'";
//		ResultSet rs = st.executeQuery(query);
//        //Select Query with Keyword 
//		String encryptedData;
//        if(rs.next()) {
//        	encryptedData=(String)rs.getString(2);
//        	System.out.println("Document Search in db: "+encryptedData);
			/*
			 * if(encryptedData.equals(
			 * "MnePFCLH2qLY82Nc+0+w1nLWrGkBKOu6lpsQPF7kXfk9K2Thqroxiq0M6CxP3603iw2TfnknQrs9Ez+RRLxN70nCYC/c6bTx4WbIqRM00x5+lIKFifDuMAe27qNdMHnfihedf9QM1IUJVhXbTw/27tpkrNmcyyx7J/1LKsOHBNB94fQlMxx9cl2mlC55qnQLweG42Kl+2YN+XfuhUr/NHax0v9TJtG6id05/8YNNjD6JTg7QFNrOQ5Aj7aBOCdCqRQ9pL4f/awULheU6OBLwJGAKS2yj2nKXu3OP6pNE6wTkqLC/EqneMYTskdzpkYb80dVmPZmHLbHdFsh+4xqTMw=="
			 * )) {
			 * 
			 * System.out.println(RSAEncryption.decrypt(
			 * "MnePFCLH2qLY82Nc+0+w1nLWrGkBKOu6lpsQPF7kXfk9K2Thqroxiq0M6CxP3603iw2TfnknQrs9Ez+RRLxN70nCYC/c6bTx4WbIqRM00x5+lIKFifDuMAe27qNdMHnfihedf9QM1IUJVhXbTw/27tpkrNmcyyx7J/1LKsOHBNB94fQlMxx9cl2mlC55qnQLweG42Kl+2YN+XfuhUr/NHax0v9TJtG6id05/8YNNjD6JTg7QFNrOQ5Aj7aBOCdCqRQ9pL4f/awULheU6OBLwJGAKS2yj2nKXu3OP6pNE6wTkqLC/EqneMYTskdzpkYb80dVmPZmHLbHdFsh+4xqTMw==",
			 * privateKey)); System.out.println("Both are equal"); }
			 */
        
        else {

            return "Document not found for keyword: " + keyword;
        }
        
        
        
        
        //Checking without Database
        
   
        
        
    }

    // Hash the keyword for comparison
    public static String hashKeyword(String keyword) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(keyword.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            hexString.append(String.format("%02x", b));  // Convert to hex string
        }
        return hexString.toString();  // Return the hash of the keyword
    }
}