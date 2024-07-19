
package com.blog.helper;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class encrypt {
    
    public static String generateHash(String password){
        try {
            MessageDigest msgDigest = MessageDigest.getInstance("SHA");
            
            msgDigest.update(password.getBytes());
            
            byte[] resultByteArray = msgDigest.digest();
            
            StringBuilder sb = new StringBuilder();
            for (byte b :resultByteArray){
                sb.append(String.format("%02x", b));
            }
            
            return sb.toString();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return "";
    }
}
