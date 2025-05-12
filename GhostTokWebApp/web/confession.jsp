<%-- 
    Document   : confession
    Created on : May 12, 2025, 5:44:51 PM
    Author     : musaw
--%>
<%@page import="tut.entities.Confession"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <title>GhostTok - Confessions</title>
    <link rel="stylesheet" href=" style.css" />
</head>
<body class="homepage">
    <div class="container">
        <h1>GhostTok - Share Your Secret</h1>

        <form action="ConfessionServlet.do" method="post" class="confession-form">
            <label for="confessionText">Your Confession:</label><br>
            <textarea name="confessionText" id="confessionText" cols="5" rows="5" required></textarea><br>
            <button type="submit">Post Confession</button>
        </form>

        <h2>Recent Confessions</h2>
        <div class="recent-confessions">
            <!-- These would be generated dynamically from the database -->
            <%
                List<Confession> confessions = ( List<Confession>) request.getAttribute("confessions");
                if(confessions != null && !confessions.isEmpty()){
                        for (Confession c : confessions) {
            %>
            <div style="background-color: #2c2c3e; padding: 15px; margin-bottom: 10px; border-radius: 10px;">
                            <strong><%= c.getUsername() %></strong>
                            <p><%= c.getMessage() %></p>
                            <small><%= c.getTimestamp() %></small>
            </div>
            <%
                        }
                }else {
            %>
                <p>No confessions yet. Be the first to share something!</p>
            <%
                }
            %>
            <div class="confession-box">
                <p>I stole my friend's sandwich and blamed the dog 🐶</p>
            </div>
            <div class="confession-box">
                <p>I told my mom I was studying, but I was watching TikTok for 3 hours 😬</p>
            </div>
            <div class="confession-box">
                <p>I have a huge crush on my best friend but I act like I don’t care 😓</p>
            </div>
        </div>
    </div>
</body>
</html>
