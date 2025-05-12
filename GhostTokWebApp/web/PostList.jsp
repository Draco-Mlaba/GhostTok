<%-- 
    Document   : postList
    Created on : 12 May 2025, 8:42:45 PM
    Author     : Mpashi Makgabo
--%>

<%@page import="tut.entities.Confession"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GhostTok - All Posts</title>
    </head>
    <body class="post-page">
    <div class="container">
        <h1>All Confessions & Dares</h1>
        <div class="confession-list">
            <%
                List<Confession> confessions = (List<Confession>) request.getAttribute("confessions");
                if (confessions != null && !confessions.isEmpty()) {
                    for (Confession c : confessions) {
            %>
                <div class="confession-box">
                    <strong><%= c.getUsername() %></strong><br>
                    <p><%= c.getMessage() %></p>
                    <small><%= c.getTimestamp() %></small>
                </div>
            <%
                    }
                } else {
            %>
                <p>No posts available yet. Be the first to post!</p>
            <%
                }
            %>
        </div>
        <button onclick="location.href='index.jsp'" class="btn">Back to Home</button>
    </div>
</body>
</html>
