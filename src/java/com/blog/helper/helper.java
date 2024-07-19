package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class helper {

    public static boolean deleteFile(String path) {
        boolean f = false;
        try {

            File file = new File(path);
            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //send email method for verification
    public static boolean sendEmail(String to, String subject, String text) {
        boolean flag = false;
         String from = "geauthenticate@gmail.com";
        //smtp properties 
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.host", "smtp.gmail.com");

        final String username = "geauthenticate";
        final String password = "zhlvlnuinvdcrhmo";

        //session
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }

        });

        try {

            Message msg = new MimeMessage(session);
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setFrom(new InternetAddress(from));
            msg.setSubject(subject);
            msg.setText(text);

            Transport.send(msg);

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
    
    
    //create the otp to send
    public static int createOTP() {

        Random rand = new Random();
        int otp = rand.nextInt((9999 - 1000) + 1) + 10;
        return otp;
    }
}
