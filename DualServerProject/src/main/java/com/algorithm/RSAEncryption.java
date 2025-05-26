package com.algorithm;
import java.security.*;
import java.util.Base64;

import javax.crypto.Cipher;

public class RSAEncryption {

   // Generation Key Pair
    public static KeyPair generateKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048);  // Set key size
        return keyPairGenerator.generateKeyPair();  // Return key pair
    }

    //Encrypting data with public key
    public static String encrypt(String data, PublicKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] encryptedData = cipher.doFinal(data.getBytes());  
        return Base64.getEncoder().encodeToString(encryptedData);  // Return encrypted data as Base64 string
    }

    //Decrypting data with private key
    public static String decrypt(String encryptedData, PrivateKey privateKey) throws Exception {
    	
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        
        byte[] decodedData = Base64.getDecoder().decode(encryptedData); 
        System.out.println("After Decode Data");// Decode Base64 string
        
        byte[] decryptedData = cipher.doFinal(decodedData);  // Decrypt data
        System.out.println("After byte Decrypt");
        return new String(decryptedData);  
        
        
        
        
        
    }
}