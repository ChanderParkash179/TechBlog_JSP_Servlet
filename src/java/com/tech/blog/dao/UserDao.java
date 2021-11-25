package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;


public class UserDao {

    private Connection con;
    
    public UserDao(Connection con){
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean f = false;
        try {
//            user - database

        String q = "insert into user(name, email, password, gender) values(?,?,?,?)";
        
        PreparedStatement pstmt = this.con.prepareStatement(q);
        
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getPassword());
        pstmt.setString(4, user.getGender());
        
        pstmt.executeUpdate();
        f = true;
        
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public User getUserEmailAndPassword(String email, String password){
        User user = null;
        
        try {
            String query = "select * from user where email = ? and password = ?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                
                String name = set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user){
        boolean f = false;
        try {
            String query = "update user set name=?, email=?, password=?, gender=?, profile=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());
            pstmt.executeUpdate();
            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId){
        User user = null;
        
        try {
            String q = "select * from user where id = ? ";
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                
                String name = set.getString("name");
                user.setName(name);
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));
           
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}