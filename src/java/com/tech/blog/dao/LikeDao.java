package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;

        try {
            String query = "insert into liked(pid, uid) values (?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        try {
            String q = "select count(*) form liked where pid = ?";

            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikeByUser(int pid, int uid) {
        boolean f = false;

        try {
            String query = "select * from liked where pid = ? and uid = ? ";

            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteLike(int pid, int uid){
        boolean f = false;
        
        try {
            String q = "delete from liked where pid = ? and uid = ? ";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}