
package com.blog.entities;

import java.sql.Date;

public class CommentEntity {
    private int post_id;
    private int comment_id;
    private int user_id;
    private String comment_content;
    private Date comment_date;

    public CommentEntity(int post_id, int comment_id, int user_id, String comment_content, Date comment_date) {
        this.post_id = post_id;
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.comment_content = comment_content;
        this.comment_date = comment_date;
    }

    public CommentEntity(int post_id, int user_id, String comment_content) {
        this.post_id = post_id;
        this.user_id = user_id;
        this.comment_content = comment_content;
    }
    
    

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    @Override
    public String toString() {
        return "CommentEntity{" + "post_id=" + post_id + ", comment_id=" + comment_id + ", user_id=" + user_id + ", comment_content=" + comment_content + ", comment_date=" + comment_date + '}';
    }

   
    
}
