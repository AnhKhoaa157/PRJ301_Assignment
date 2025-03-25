<%-- 
    Document   : slidebar
    Created on : Mar 24, 2025, 9:21:58 PM
    Author     : LENOVO
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slide Bar</title>
        <style>
            .sidebar {
                width: 250px;
                height: 100vh;
                background-image: url('assets/image/Forza-Horizon-5-Xbox-Game-Studios-2252690.jpg');
                background-size: cover;
                background-position: center;
                padding: 20px;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1500;
            }
            
            .sidebar h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .sidebar ul {
                list-style: none;
                padding: 10px;
                gap: 10px;
            }

            .sidebar ul li {
                margin: 15px 0;
            }

            .sidebar ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
            }

            .sidebar ul li a:hover {
                color: #ffcc00;
            }
            
        </style>
    </head>
    <body>
        <div class="sidebar">
                <h2>Admin DashBoard</h2>
            <ul>
                <li><a href="admin.jsp">Trang Chủ</a></li>
                <li><a href="<%= request.getContextPath() %>/MainController?page=searchUser">🔍 Tìm kiếm User</a></li>
                <li><a href="<%= request.getContextPath() %>/GameController?page=searchGame">🎮 Tìm kiếm Game</a></li>
                <li><a href="admin.jsp?page=managePosts">📝 Quản lý Mua Hàng</a></li>
                <li><a href="admin.jsp?page=settings">Cài đặt</a></li>
                <li><a href="MainController?action=logout">Đăng xuất</a></li>


            </ul>
        </div>
    </body>
</html>
