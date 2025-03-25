<%-- 
    Document   : index
    Created on : Feb 28, 2025, 9:31:57 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="assets/image/jpg" href="assets/image/z6344218901443_e4fd8ed41ec42487b1140ea5a3e4832d.jpg">
        <title>The Best Game Online</title>
        <!-- Look of this document is driven by a CSS referenced by an href attribute. See http://www.w3.org/TR/xml-stylesheet/ -->
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .slideshow-container {  
                position: relative;
                width: 100%;
                height: 100vh;
                overflow: hidden;
            }

            .slideshow img {
                position: absolute;
                width: 100%;
                height: 100%;
                object-fit: cover;
                opacity: 0;
                animation: fade 12s infinite;
            }

            .slideshow img:nth-child(1) { animation-delay: 0s; }
            .slideshow img:nth-child(2) { animation-delay: 4s; }
            .slideshow img:nth-child(3) { animation-delay: 8s; }
            .slideshow img:nth-child(4) { animation-delay: 12s; }

            @keyframes fade {
                0% { opacity: 0; }
                10% { opacity: 1; }
                30% { opacity: 1; }
                40% { opacity: 0; }
                100% { opacity: 0; }
            }

            .welcome-container {
                position: absolute;
                width: 100%;
                top: 70%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
                background: rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(255, 255, 255, 0.3);
            }

            .welcome-title{
                margin-bottom: 250px;
            }
            .welcome-title h1 {
                font-size: 3rem;
                margin-bottom: 10px;
            }

            .welcome-title h4 {
                font-size: 1.2rem;
                margin-top: 0;
            }

            .welcome-title a {
                color: lightblue;
                text-decoration: none;
            }

            .welcome-title a:hover {
                color: red;
                text-decoration: underline;
            }

            .divider {
                border: none;
                height: 10px;
                background: linear-gradient(to right, #ff5722, #007bff);
                margin: 0 auto;
                width: 100%; /* Hoặc % tùy theo ý */
                opacity: 0.7;
            }
        </style>
    </head>
    <body>
        <%@include file='partials/header.jsp' %>
        <hr class="divider">
            
            <div class="slideshow-container">
                <div class="slideshow">
                    <img src="assets/image/20240818214820_1.jpg" alt="Slideshow Image 1">
                    <img src="assets/image/background_index.jpg" alt="Slideshow Image 2">
                    <img src="assets/image/1551360_2.jpg" alt="Slideshow Image 3">
                    <img src="assets/image/1551360_383.jpg" alt="Slideshow Image 4">
                </div>
            </div>
        
            <div class="welcome-container">
                <div class="welcome-title">
                    <h1 style="color: white">Welcome to <span style="color: purple">The Best </span> <span style="color: pink">Game Online</span></h1>
                    <h4>
                        <a href="login.jsp">Login</a> to continue / Use as <a href="menu.jsp">Guest</a>
                    </h4>
                </div>
            </div>

        <hr class="divider">

        <%@include file='partials/footer.jsp' %>
    </body>
</html>
