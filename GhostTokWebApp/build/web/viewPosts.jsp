<%-- 
    Document   : viewPosts
    Created on : May 12, 2025, 10:08:09 PM
    Author     : musaw
--%>

<%@page import="tut.ejb.bl.ConfessionFacadeLocal"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.List"%>
<%@page import="tut.entities.Confession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Confession> confessions = null;
    try {
        InitialContext ctx = new InitialContext();
        ConfessionFacadeLocal cb = (ConfessionFacadeLocal) ctx.lookup("java:global/GhostTok/ConfessionFacade!ejb.ConfessionFacadeLocal");
        confessions = cb.getAllConfessions();
    } catch (NamingException e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Confessions</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: #fff;
        }

        header {
            padding: 40px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.6);
        }

        h1 {
            font-size: 48px;
            color: #ff69b4;
            margin-bottom: 10px;
        }

        .tagline {
            font-size: 22px;
            animation: blink 2s infinite;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        .btn-container {
            margin: 30px 0;
            text-align: center;
        }

        .btn {
            background-color: #ff69b4;
            border: none;
            padding: 14px 26px;
            margin: 10px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #e35caa;
        }

        .preview-section {
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.05);
            margin: 20px auto;
            width: 80%;
            border-radius: 12px;
        }

        .post {
            border-bottom: 1px solid #555;
            padding: 15px 0;
        }

        .how-it-works {
            display: flex;
            justify-content: space-around;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.03);
            margin-top: 40px;
        }

        .step {
            max-width: 200px;
            text-align: center;
        }

        #topBtn {
            position: fixed;
            bottom: 20px;
            right: 30px;
            background-color: #ff69b4;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 50%;
            font-size: 18px;
            display: none;
            cursor: pointer;
        }

        footer {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .action-buttons {
            margin-top: 30px;
            text-align: center;
        }

        .post-card {
            background: rgba(0, 0, 0, 0.4);
            padding: 20px;
            margin: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.6);
        }

        .post-card h4 {
            color: #ff69b4;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .post-card p {
            color: #fff;
            font-size: 16px;
        }

        .post-card .timestamp {
            font-size: 14px;
            color: #aaa;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <header>
        <h1>Recent Confessions</h1>
        <p class="tagline">Read what others are thinking...!</p>
    </header>

    <div class="preview-section">
        <!-- post cards added here  -->
        
        <c:forEach var="confession" items="${confessions}">
                <div class="post-card">
                        <h4>${confession.username}</h4>
                        <p>${confession.confession}</p>
                        <p class="timestamp">Posted on: ${confession.timestamp}</p>
                </div>
        </c:forEach>

        <!-- Add more posts here dynamically from the backend -->
    </div>

    <div class="action-buttons">
        <a href="index.html">
            <button class="btn">Back to Home</button>
        </a>
    </div>

    <footer>
        <p>© 2025 GhostTok | All rights reserved.</p>
    </footer>
</body>

</html>

