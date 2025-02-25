<%-- 
    Document   : header
    Created on : Feb 17, 2025, 10:55:12 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body, html {
        overflow: visible; /* Đảm bảo không bị che mất */
        position: relative; /* Tránh lỗi layout */
    }
    .header {
        background-image: url('image/minimal-geometric-background-orange-elements-with-fluid-gradient-for-posters-banners-and-website-landing-pages-free-vector.jpg');
        background-size: cover;
        background-position: center;
        padding: 2rem 0;
        width: 100%;
        position: relative;
        padding: 3rem 0;
    }
    
    .container {
        max-width: 1700px;
        margin-left: auto;
        margin-right: auto;
        max-width: 1700px;
        padding: 0 auto;
    }
    
    .nav{
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 10px;
        position: relative;
        z-index: 2;
    }
    
    .logo {
        display: relative;
        text-decoration: none;
        margin-left: 50px;
    }
    .logo img {
        max-width: 80px;
        height: auto;
        margin-left: 50px;
        display: block;
        top: 0;
        border-radius: 100px;
    }
    
    .logo p {
        display: flex;
        font-weight: bold;
        align-items: center;
        font-size: 20px;
        top: 10px;
        color: #FFFFFF;
    
    }
    .menu {
        display: flex;
        flex-wrap: wrap; /* Đảm bảo menu tự động xuống dòng khi thu nhỏ */
        list-style: none;
        padding: 10px 0;
        justify-content: center; /* Căn giữa menu */
        align-items: center;
        width: 100%; /* Đảm bảo menu co giãn theo kích thước */
        max-width: 800px;
        margin-top: 100px;
        margin-right:  350px;
        border-radius: 10px;
        background-color: #495D5F;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    
    .menu-item {
        display: flex;
        align-items: center; /* Căn giữa nội dung theo chiều dọc */
        justify-content: center; /* Căn giữa theo chiều ngang */
        padding: 0;
    }
    
    .menu ul {
        display: flex;
        list-style: none;
        justify-content: center;
        background-color: #1483BA;
        padding: 10px;
    }
    .menu-item a {
        color: #FFFFFF;
        font-weight: bold;
        text-decoration: none;
        font-size: 1.3rem;
        transition: color 0.3s ease;
        margin: 0 40px;
    }
    
    .menu-item a:hover{
        color: #a0d2eb;
    }
    
    .search-bar{
        position: absolute; /* Giữ trong header, không bị trôi theo nội dung */
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        width: 660px;
        max-width: 90%;
        background: white;
        border-radius: 20px;
        padding: 0.5rem 1rem;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: center;
        justify-content: space-between;
        z-index: 1000;
    }
    
    .search-input {
        border: none;
        outline: none;
        padding: 0.5rem;
        width: 100%;
        flex-grow: 1;
        font-size: 1rem;
        background: transparent;
    }
    
    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: #FF6B01;
        font-size: 1.2rem;
    }
    
    .login {
        display: flex;
        border: none;
        background: white;
        cursor: pointer;
        border-radius: 25px;
        position: absolute;
        right: 0;
        margin-right:  10px;
        
    }
    .login img {
        display: fixed;
        width: 50px;
        height: 50px;
        
    }
    
    .cart {
        display: flex;
        border: black;
        background: white;
        cursor: pointer;
        border-radius: 25px;
        position: absolute;
        right: 0;
        margin-right: 70px;
        
    }
    
    .cart img {
        display: fixed;
        width: 50px;
        height: 50px;
    }
    
    @media (max-width: 768px) {
        .header {
            padding: 1rem 0;
            flex-direction: column;
        }

        .logo {
            justify-content: center;
            margin-left: 0;
        }

        .logo img {
            max-width: 60px; /* Thu nhỏ logo trên màn hình nhỏ */
        }

        .search-bar {
            position: relative; /* Không cố định khi màn hình nhỏ */
            top: 0;
            width: 100%;
            max-width: 100%;
            margin-top: 10px;
        }

        .menu {
            flex-direction: column; /* Chuyển menu thành dạng dọc */
            align-items: center;
            max-width: 100%;
            padding: 10px;
        }

        .menu-item {
            width: 100%;
            text-align: center;
        }

        .menu-item a {
            display: block;
            padding: 10px;
        }
    }
</style>

<header class="header">
    <%
        int x = 100;
    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">
                <img src="image/z6344218901443_e4fd8ed41ec42487b1140ea5a3e4832d.jpg" alt="The Best Game Online">
                <p class="Banner">The Best Game Online</p>
            </a>

            <button class="login">
                <img src="image/user-interface.png" alt="Login Image"/>
            </button>
            
            <button class="cart">
                <img src="image/Cart_Game.jpeg" alt="Cart Game">
            </button>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang Chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Thể loại</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>

            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
                <button class="search-button">🔍</button>
            </div>

        </nav>
    </div>
</header>
