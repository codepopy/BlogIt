/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.DAO;

import com.blog.entities.CategoryEntity;
import com.blog.entities.PostsEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<CategoryEntity> getAllCategory() {
        ArrayList<CategoryEntity> list = new ArrayList<>();

        try {

            String query = "select * from CATEGORY";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                int c_id = set.getInt("CATEGORY_ID");
                String c_name = set.getString("CATEGORY_NAME");

                CategoryEntity c = new CategoryEntity(c_id, c_name);
                list.add(c);

            }

            st.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteCategoryById(int ID) {
        boolean flag = false;
        try {
            String query = "delete from category where category_id=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, ID);
            smt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean addCategory(String catName) {
        boolean flag = false;
        try {
            String query = "insert into category(category_name) values(?)";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setString(1, catName);
            smt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public String getCategoryById(int catId) {
        String name = null;
        String query = "select CATEGORY_NAME from CATEGORY where CATEGORY_ID = ?";
        try {
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, catId);
            ResultSet set = smt.executeQuery();

            if (set.next()) {
                name = set.getString("category_name");
            }
            smt.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public boolean savePost(PostsEntity p) {
        boolean flag = false;
        try {

            String query = "insert into posts(category_id, post_title, post_description, post_content, post_pic, user_id) values(?,?,?,?,?,?)";
            PreparedStatement s = con.prepareStatement(query);
            s.setInt(1, p.getCategory_id());
            s.setString(2, p.getPost_title());
            s.setString(3, p.getPost_desc());
            s.setString(4, p.getPost_content());
            s.setString(5, p.getPost_pic());
            s.setInt(6, p.getUser_id());

            s.executeUpdate();
            flag = true;
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean deletePostByPostId(int postId) {
        boolean flag = false;
        try {
            String query = "delete from posts where post_id=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, postId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<PostsEntity> getAllPost() {
        List<PostsEntity> pList = new ArrayList<>();
        //fetch all post 
        try {
            PreparedStatement p = con.prepareStatement("select * from POSTS order by POST_ID desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {

                PostsEntity ps = new PostsEntity(set.getInt("category_id"), set.getInt("post_id"), set.getInt("user_id"), set.getString("post_title"), set.getString("post_pic"), set.getDate("post_date"), set.getString("post_description"), set.getString("post_content"));
                pList.add(ps);
            }
            p.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;
    }

    public List<PostsEntity> getPostByCategoryId(int catId) {
        List<PostsEntity> pList = new ArrayList<>();
        //fetch all post 
        try {
            PreparedStatement p = con.prepareStatement("select * from POSTS where CATEGORY_ID=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                PostsEntity ps = new PostsEntity(set.getInt("category_id"), set.getInt("post_id"), set.getInt("user_id"), set.getString("post_title"), set.getString("post_pic"), set.getDate("post_date"), set.getString("post_description"), set.getString("post_content"));
                pList.add(ps);
            }
            p.close();
            set.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;
    }

    public PostsEntity getPostByPostId(int postId) {
        PostsEntity post = null;
        String query = "select * from posts where post_id = ?";
        try {
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, postId);
            ResultSet set = smt.executeQuery();

            if (set.next()) {

                post = new PostsEntity(set.getInt("category_id"), set.getInt("post_id"), set.getInt("user_id"), set.getString("post_title"), set.getString("post_pic"), set.getDate("post_date"), set.getString("post_description"), set.getString("post_content"));

            }
            smt.close();
            set.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

    public List<PostsEntity> getPostByUserId(int userId) {
        List<PostsEntity> pList = new ArrayList<>();
        //fetch all post 
        try {
            PreparedStatement p = con.prepareStatement("select * from POSTS where USER_ID=?");
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                PostsEntity ps = new PostsEntity(set.getInt("category_id"), set.getInt("post_id"), set.getInt("user_id"), set.getString("post_title"), set.getString("post_pic"), set.getDate("post_date"), set.getString("post_description"), set.getString("post_content"));
                pList.add(ps);
            }
            p.close();
            set.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;
    }

    public boolean savePostForUser(int postId, int userId) {
        boolean flag = false;
        try {
            String query = "insert into SAVEDPOST(USER_ID, POST_ID) values(?, ?)";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, userId);
            smt.setInt(2, postId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public List<PostsEntity> getSavedPostsByUserId(int userId) {
        List<PostsEntity> pList = new ArrayList<>();
        //fetch all post 
        try {
            String query = "select posts.category_id, posts.post_content, posts.post_description,posts.post_title,posts.user_id,posts.post_date,posts.post_pic,savedpost.post_id\n"
                    + "from posts\n"
                    + "inner join savedpost\n"
                    + "on savedpost.post_id = posts.post_id\n"
                    + "where savedpost.user_id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                PostsEntity ps = new PostsEntity(set.getInt("category_id"), set.getInt("post_id"), set.getInt("user_id"), set.getString("post_title"), set.getString("post_pic"), set.getDate("post_date"), set.getString("post_description"), set.getString("post_content"));
                pList.add(ps);
            }
            p.close();
            set.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pList;
    }

    public boolean isPostSaved(int postId, int UserId) {
        boolean flag = true;
        try {
            String query = "select * from SAVEDPOST where USER_ID=? and POST_ID=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, UserId);
            smt.setInt(2, postId);
            ResultSet set = smt.executeQuery();

            if (set.next() == false) {
                flag = false;
            }
            set.close();
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updatePost(int catId, int postId, String postTitle, String postDesc, String postContent) {
        boolean flag = false;
        try {
            String query = "update posts set CATEGORY_ID=?, POST_TITLE=?, POST_DESCRIPTION=?, POST_CONTENT=? where POST_ID=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, catId);
            smt.setString(2, postTitle);
            smt.setString(3, postDesc);
            smt.setString(4, postContent);
            smt.setInt(5, postId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean updatePost(int catId, int postId, String postTitle, String postDesc, String postContent, String fileName) {
        boolean flag = false;
        try {
            String query = "update posts set CATEGORY_ID=?, POST_TITLE=?, POST_DESCRIPTION=?, POST_CONTENT=?,POST_PIC=? where POST_ID=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, catId);
            smt.setString(2, postTitle);
            smt.setString(3, postDesc);
            smt.setString(4, postContent);
            smt.setString(5, fileName);
            smt.setInt(6, postId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean addLike(int postId, int userId) {
        boolean flag = false;
        try {
            String query = "insert into likes(post_id, user_id) values(?,?)";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, postId);
            smt.setInt(2, userId);
            smt.executeUpdate();
            flag = true;
            smt.close();
        } catch (Exception e) {

        }
        return flag;
    }

    public int getLikeCountByPostId(int postId) {
        int count=0;
        try {
            String query = "select count(user_id) as cnt from likes where post_id=?";
            PreparedStatement smt= con.prepareStatement(query);
            smt.setInt(1, postId);
            ResultSet set = smt.executeQuery();
            if(set.next()){
                count = set.getInt("cnt");
            }
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean unlike(int postId, int userId){
        boolean flag = false;
        try {
            String query="delete from likes where post_id=? and user_id=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, postId);
            smt.setInt(2, userId);
            smt.executeUpdate();
            flag=true;
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public boolean isPostLikedByUser(int postId, int userId){
        boolean flag = true;
        try {
             String query = "select * from likes where USER_ID=? and POST_ID=?";
            PreparedStatement smt = con.prepareStatement(query);
            smt.setInt(1, userId);
            smt.setInt(2, postId);
            ResultSet set = smt.executeQuery();

            if (set.next() == false) {
                flag = false;
            }
            set.close();
            smt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
