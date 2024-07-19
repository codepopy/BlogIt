
package com.blog.entities;

import java.sql.Clob;
import java.sql.Date;

public class PostsEntity {
    
    private int category_id;
    private int post_id;
    private int user_id;
    private String post_title;
    private String post_pic;
    private Date post_date;
    private String post_desc;
    private String post_content;
    
    // for use when fetching data from DB
    public PostsEntity(int category_id, int post_id, int user_id, String post_title, String post_pic, Date post_date, String post_desc, String post_content) {
        this.category_id = category_id;
        this.post_id = post_id;
        this.user_id = user_id;
        this.post_title = post_title;
        this.post_pic = post_pic;
        this.post_date = post_date;
        this.post_desc = post_desc;
        this.post_content = post_content;
    }

    //for use when inserting data to DB
    public PostsEntity(int category_id, int user_id, String post_title, String post_pic, String post_desc, String post_content) {
        this.category_id = category_id;
        this.user_id = user_id;
        this.post_title = post_title;
        this.post_pic = post_pic;
        this.post_desc = post_desc;
        this.post_content = post_content;
    }

    public PostsEntity(int category_id, int user_id, String post_title, String post_desc, String post_content) {
        this.category_id = category_id;
        this.user_id = user_id;
        this.post_title = post_title;
        this.post_desc = post_desc;
        this.post_content = post_content;
    }
    
    

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_pic() {
        return post_pic;
    }

    public void setPost_pic(String post_pic) {
        this.post_pic = post_pic;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }

    public String getPost_desc() {
        return post_desc;
    }

    public void setPost_desc(String post_desc) {
        this.post_desc = post_desc;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    @Override
    public String toString() {
        return "PostsEntity{" + "category_id=" + category_id + ", post_id=" + post_id + ", user_id=" + user_id + ", post_title=" + post_title + ", post_pic=" + post_pic + ", post_date=" + post_date + ", post_desc=" + post_desc + ", post_content=" + post_content + '}';
    }
    
    
    
    
  }
