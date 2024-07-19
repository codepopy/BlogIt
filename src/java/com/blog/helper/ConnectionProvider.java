
package com.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try {
            
          if(con==null){
              Class.forName("oracle.jdbc.driver.OracleDriver");
              con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##scott","password");
              
          }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
