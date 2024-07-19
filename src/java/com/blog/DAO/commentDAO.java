/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.DAO;

import com.blog.entities.CategoryEntity;
import com.blog.entities.PostsEntity;
import com.blog.entities.CommentEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class commentDAO {
    Connection con;
    
    public commentDAO(Connection con) {
        this.con = con;
    }
    
    public ArrayList<CommentEntity> getComments(int postId){
        ArrayList<CommentEntity> list = new ArrayList<>();
        
        try {
            String query = "select * from COMMENTS where POST_ID = ?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, postId);
            ResultSet set = smt.executeQuery();
            while(set.next()){
                CommentEntity c = new CommentEntity(set.getInt("POST_ID"), set.getInt("COMMENT_ID"), set.getInt("USER_ID"), set.getString("COMMENT_CONTENT"), set.getDate("COMMENT_DATE"));
                list.add(c);
            }
            set.close();
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean addComment(CommentEntity c){
        boolean flag = false;
        try {
            String query = "insert into comments(post_id,user_id,comment_content) values(?,?,?)";
            PreparedStatement smt= con.prepareStatement(query);
            smt.setInt(1, c.getPost_id());
            smt.setInt(2, c.getUser_id());
            smt.setString(3, c.getComment_content());
            
            smt.executeUpdate();
            flag=true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return flag;
    }
    
    
}
