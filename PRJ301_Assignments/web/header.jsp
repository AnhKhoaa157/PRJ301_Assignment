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
    
    .header {
        background-image: url('image/minimal-geometric-background-orange-elements-with-fluid-gradient-for-posters-banners-and-website-landing-pages-free-vector.jpg');
        background-size: cover;
        background-position: center;
        padding: 2rem 0;
        width: 100%;
        position: relative;
    }
    
    .container {
        max-width: 1700px;
        margin-left: auto;
        margin-right: auto;
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
/*        display: flex;
        list-style: none;
        gap: 2rem;
        padding: 10px;
        border-radius: 10px;
        background-color: #495D5F;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);*/
        display: flex;
        list-style: none;
        padding: 10px 0;
        justify-content: center; /* Căn giữa menu theo chiều ngang */
        align-items: center; /* Căn giữa theo chiều dọc */
        width: fit-content; /* Chỉ chiếm đúng kích thước nội dung */
        max-width: 800px;
        margin: 0 auto; /* Căn giữa theo chiều ngang */
        margin-top: 100px;
        margin-left: 225px;
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
/*        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0 1rem;
        margin-right: 100px;*/
        display: flex;
        align-items: center;
        background: white;
        border-radius: 20px;
        padding: 0.5rem 1.8rem;
        margin: auto;
        margin-top: 40px;
        margin-bottom: 0;
        margin-left: 15px;
        position: fixed; /* Fix the search bar at the top */
        top: 10px; /* Adjust top position as needed */
        left: 50%;
        transform: translateX(-50%); /* Centers the search bar horizontally */
        z-index: 1; /* Ensures search bar stays on top of the header */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Adds a shadow effect to separate from the header */
        justify-content: space-between; /* Aligns input on the left and button on the right */
        width: 660px; /* Adjust width as needed */
    }
    
    .search-input {
        border: none;
        outline: none;
        padding: 0.5rem;
        flex-grow: 1;
        font-size: 1rem;
        color: #333;
        background: transparent;
    }
    
    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: yellow;
        padding: 0;
        margin-left: 20px;
    }
    
    .login {
        display: flex;
        border: none;
        background: white;
        cursor: pointer;
        border-radius: 25px;
        position: absolute;
        right: 0;
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
