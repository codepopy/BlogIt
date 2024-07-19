
package com.blog.DAO;

import com.blog.entities.AdminEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    
    Connection con;

    public AdminDAO(Connection con) {
        this.con = con;
    }
    
    public AdminEntity getAdminEntity(String username, String password){
        AdminEntity ad = null;
        
        try {
            
            String query = "select * from admin where admin_username = ? and admin_password = ?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setString(1, username);
            smt.setString(2, password);
            
            ResultSet set = smt.executeQuery();
            while(set.next()){
                ad = new AdminEntity(set.getInt("ID"), set.getString("admin_username"), set.getString("admin_password"));
                
            }
            set.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return ad;
        
    }
}
