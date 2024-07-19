
package com.blog.entities;

public class AdminEntity {
    private int admin_id;
    private String admin_username;
    private String password;

    public AdminEntity(int admin_id, String admin_username, String password) {
        this.admin_id = admin_id;
        this.admin_username = admin_username;
        this.password = password;
    }

    public AdminEntity(String admin_username, String password) {
        this.admin_username = admin_username;
        this.password = password;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_username() {
        return admin_username;
    }

    public void setAdmin_username(String admin_username) {
        this.admin_username = admin_username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "AdminEntity{" + "admin_id=" + admin_id + ", admin_username=" + admin_username + ", password=" + password + '}';
    }
    
    
    
}
