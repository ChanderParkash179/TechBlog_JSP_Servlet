package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList();

        try {
            String query = "select * from categories";
            Statement statement = this.con.createStatement();
            ResultSet set = statement.executeQuery(query);
            while (set.next()) {
                int id = set.getInt("cid");
                String name = set.getString("cname");
                String description = set.getString("cdescription");

                Category c = new Category(id, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Posts p) {
        boolean f = false;

        try {
            String q = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<Posts> getAllPosts() {
        List<Posts> list = new ArrayList();

        try {

            String query = "select * from posts";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pId");
                String ptitle = set.getString("pTitle");
                String pcontent = set.getString("pContent");
                String pcode = set.getString("pCode");
                String ppic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catid = set.getInt("catId");
                int userid = set.getInt("userId");

                Posts p = new Posts(pid, ptitle, pcontent, pcode, ppic, date, catid, userid);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Posts> getPostbyCatId(int catId) {
        List<Posts> list = new ArrayList();

        try {

            String query = "select * from posts where catId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pId");
                String ptitle = set.getString("pTitle");
                String pcontent = set.getString("pContent");
                String pcode = set.getString("pCode");
                String ppic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userid = set.getInt("userId");

                Posts p = new Posts(pid, ptitle, pcontent, pcode, ppic, date, catId, userid);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Posts getPostbyPostId(int postId) {
        Posts post = null;

        try {
            String q = "select * from posts where pId = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, postId);

            ResultSet set = pstmt.executeQuery();

            if(set.next()) {

                int pid = set.getInt("pId");
                String ptitle = set.getString("pTitle");
                String pcontent = set.getString("pContent");
                String pcode = set.getString("pCode");
                String ppic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userid = set.getInt("userId");
                int catid = set.getInt("catId");

                post = new Posts(pid, ptitle, pcontent, pcode, ppic, date, catid, userid);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

}