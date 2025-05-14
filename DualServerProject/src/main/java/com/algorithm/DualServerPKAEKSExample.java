package com.algorithm;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;

public class DualServerPKAEKSExample {
	RSAEncryption r=new RSAEncryption();

    public static void main(String[] args) {
        try {
            // Generate default public and private keys 
            KeyPair keyPair = RSAEncryption.generateKeyPair();
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
            
            //Just Checking the hashCode of publicKey
          //  System.out.println(publicKey.hashCode());

            // Step 2: Store encrypted documents with keyword
            String document1 = "This is Essential Data which is required to be secured";
            String document2 = "This is all about DualServer Public Key Auth. encryption.";
            
            String keyword1 = "eData";
            String keyword2 = "DSPK";

            // Store documents in dual-server simulated database
			
		//	  SearchableEncryption.storeDocument(document1, keyword1, publicKey);
			//  SearchableEncryption.storeDocument(document2, keyword2, publicKey);
			 
            // Step 3: Perform keyword-based search
            String result1 = SearchableEncryption.searchDocument("eData",privateKey);
            System.out.println("Search Result 1: " + result1);

            String result2 = SearchableEncryption.searchDocument("DSPK", privateKey);
            System.out.println("Search Result 2: " + result2);
            //Checking if data is not present inside then it can return data or not
            String result3 = SearchableEncryption.searchDocument("testKeyword", privateKey);
            System.out.println("Search Result 3: " + result3);  // No result for "AI"
            String enc=RSAEncryption.encrypt(document1, keyPair.getPublic());
            System.out.println("Encrypted Data :"+enc);
            System.out.println("Encrypted Data :"+RSAEncryption.decrypt(enc, privateKey));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}