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
        <link rel="icon" type="image/jpg" href="image/z6344218901443_e4fd8ed41ec42487b1140ea5a3e4832d.jpg">
        <title>The Best Game Online</title>
        <style>
            .welcome-container {
                background-image: url("image/20240818214820_1.jpg");
                background-size: cover;
                background-position: center;
                display: flex;
                justify-content: center;
                align-items: center;
/*                height: 100vh;*/
                min-height: 750px;
                text-align: center;
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
                color: yellow;
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
        <%@include file='header.jsp' %>
        <hr class="divider">

            <div class="welcome-container">
                <div class="welcome-title">
                    <h1 style="color: white">Welcome to <span style="color: ">The Best </span> <span>Game Online</span></h1>
                    <h4>
                        <a href="login.jsp">Login</a> to continue / Use as <a href="menu.jsp">Guest</a>
                    </h4>
                </div>
            </div>

        <hr class="divider">

        <%@include file='footer.jsp' %>
    </body>
</html>
