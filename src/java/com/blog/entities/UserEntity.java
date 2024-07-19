
package com.blog.entities;

import java.sql.Date;
import java.sql.Timestamp;

public class UserEntity {
    private int user_id;
    private String username;
    private String birthday;
    private String email;
    private String password;
    private String gender;
    private Timestamp  reg_time;
    private String profile_pic;
    private String security_q_no;
    private String ans;

    public UserEntity() {
    }
    
    

    // for use when fetching data to DB
    public UserEntity(int user_id, String username, String birthday, String email, String password, String gender, Timestamp reg_time, String profile_pic,String security_q_no, String ans) {
        this.user_id = user_id;
        this.username = username;
        this.birthday = birthday;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.reg_time = reg_time;
        this.profile_pic = profile_pic;
        this.security_q_no = security_q_no;
        this.ans = ans;
    }

    //for use when inserting data to DB
    public UserEntity(String username, String birthday, String email, String password, String gender,String security_q_no, String ans) {
        this.username = username;
        this.birthday = birthday;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.security_q_no = security_q_no;
        this.ans = ans;
    }

    public String getSecurity_q_no() {
        return security_q_no;
    }

    public void setSecurity_q_no(String security_q_no) {
        this.security_q_no = security_q_no;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getReg_time() {
        return reg_time;
    }

    public void setReg_time(Timestamp reg_time) {
        this.reg_time = reg_time;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    @Override
    public String toString() {
        return "UserEntity{" + "user_id=" + user_id + ", username=" + username + ", birthday=" + birthday + ", email=" + email + ", password=" + password + ", gender=" + gender + ", reg_time=" + reg_time + ", profile_pic=" + profile_pic + '}';
    }
    
    
    
}
