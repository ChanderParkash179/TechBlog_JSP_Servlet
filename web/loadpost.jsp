<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">

    <%
        User U = (User) session.getAttribute("currentUser");
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        List<Posts> posts = null;

        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostbyCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class=\"display-4 text-center\">No Posts in this Category...</h3>");
            return;
        }

        for (Posts p : posts) {

    %>
    <div class="col-md-6">
        <div class="card mt-2">
            <img class="card-img-top mt-2" src="blogpics/<%= p.getPpic()%>" alter="Card Image Cap">
            <div class="card-body">
                <strong><%= p.getPtitle()%></strong>
                <p><%= p.getPcontent()%></p>
                <pre><%= p.getPcode()%></pre>
            </div>
            <div class="card-footer text-center bg-primary">
                <%
                    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                %>

                <a href="#" onclick="doLike(<%= p.getPid()%>, <%= U.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= likeDao.countLikeOnPost(p.getPid())%> </span></i></a>
                <a href="showBlogPage.jsp?postId=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span> </span></i></a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>