package com.blog.DAO;

import com.blog.entities.UserEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDao {

    Connection Con;
    
    public UserDao(Connection Con) {
        this.Con = Con;
    }
    
    
    
    public boolean saveUser(UserEntity user) {
        boolean f = false;
        try {
            String query = "insert into users(USER_NAME, BIRTHDAY, EMAIL, PASSWORD, GENDER, SECURITY_Q_NO, ANS) values(?,?,?,?,?,?,?)";
            PreparedStatement smt = Con.prepareStatement(query);
            smt.setString(1, user.getUsername());
            smt.setString(2, user.getBirthday());
            smt.setString(3, user.getEmail());
            smt.setString(4, user.getPassword());
            smt.setString(5, user.getGender());
            
            smt.setString(6, user.getSecurity_q_no());
            smt.setString(7, user.getAns());
            smt.executeUpdate();
            f = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public UserEntity getUserEntityByEmailAndPassword(String email, String password) {
        UserEntity user = null;
        try {
            
            String query = "select * from users where email=? and password=?";
            PreparedStatement pstmt = Con.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            
            if (set.next()) {
                user = new UserEntity(set.getInt("USER_ID"),
                        set.getString("USER_NAME"), 
                        set.getString("BIRTHDAY"), 
                        set.getString("EMAIL"), 
                        set.getString("PASSWORD"), 
                        set.getString("GENDER"), 
                        set.getTimestamp("REG_TIME"), 
                        set.getString("PROFILE_PIC"), 
                        set.getString("SECURITY_Q_NO"), 
                        set.getString("ANS"));
                
            }
            pstmt.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public UserEntity getUserByID(int userID){
        UserEntity user=null;
        String query = "select * from USERS where USER_ID =?";
        
        try {
            
            PreparedStatement smt = Con.prepareStatement(query);
            smt.setInt(1, userID);
            ResultSet set = smt.executeQuery();
            if (set.next()) {
                user = new UserEntity(set.getInt("USER_ID"),
                        set.getString("USER_NAME"), 
                        set.getString("BIRTHDAY"), 
                        set.getString("EMAIL"), 
                        set.getString("PASSWORD"), 
                        set.getString("GENDER"), 
                        set.getTimestamp("REG_TIME"), 
                        set.getString("PROFILE_PIC"), 
                        set.getString("SECURITY_Q_NO"), 
                        set.getString("ANS"));
                
            }
            smt.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(UserEntity user) {
        boolean f = false;
        try {

            String query = "update users set user_name=?, birthday=?, Profile_pic=? where user_id=?";
            PreparedStatement pstmt = Con.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getBirthday());
            pstmt.setString(3, user.getProfile_pic());
            pstmt.setInt(4, user.getUser_id());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public ArrayList<UserEntity> getAllUser(){
        ArrayList<UserEntity> user = new ArrayList<>();
        try {
            String query = "select * from users";
            Statement smt = Con.createStatement();
            ResultSet set= smt.executeQuery(query);
            
            while(set.next()){
                
                UserEntity usr = new UserEntity(set.getInt("user_id"), set.getString("user_name"), set.getString("birthday"), set.getString("email"), set.getString("password"), set.getString("gender"), set.getTimestamp("reg_time"), set.getString("profile_pic"), set.getString("security_q_no"), set.getString("ans"));
                user.add(usr);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
    public UserEntity getUserEntityByEmailAndSecQuestion(String email, String q, String ans){
        UserEntity user = null;
        try {
            String query = "select * from users where email=? and security_q_no=? and ans=?";
            PreparedStatement smt = Con.prepareStatement(query);
            smt.setString(1,email);
            smt.setString(2, q);
            smt.setString(3, ans);
            
            ResultSet set = smt.executeQuery();
            if(set.next()){
                user = new UserEntity(set.getInt("user_id"), set.getString("user_name"), set.getString("birthday"), set.getString("email"), set.getString("password"), set.getString("gender"), set.getTimestamp("reg_time"), set.getString("profile_pic"), set.getString("security_q_no"), set.getString("ans"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return user;
    }
    
    public boolean updatePasswordByUserId(int userId, String password){
        boolean flag = false;
        try {
            String query = "update users set password=? where user_id=?";
            PreparedStatement smt = Con.prepareStatement(query);
            smt.setString(1,password);
            smt.setInt(2, userId);
            smt.executeUpdate();
            flag=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean deleteUserByUserId(int userId) {
        boolean flag = false;
        try {
            String query = "delete from users where user_id=?";
            PreparedStatement smt = Con.prepareStatement(query);
            smt.setInt(1, userId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
