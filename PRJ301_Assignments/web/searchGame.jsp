<%-- 
    Document   : searchGame
    Created on : Mar 24, 2025, 10:24:49 PM
    Author     : LENOVO
--%>

<%@page import="dto.GameDTO"%>
<%@page import="java.util.List"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style> 
            html, body {
                margin: 0;
                padding: 0;
                height: 100%;
                width: 100%;
                font-family: 'Arial', sans-serif;
            }
            
            body {
                background-image: url('<%= request.getContextPath() %>/assets/image/1551360_2.jpg');
                background-size: 100% auto;
                background-position: center top;
                background-repeat: repeat-y;
                min-height: 100vh;
            }

            .main-content {
                margin-left: 220px; /* Đẩy nội dung sang phải, lớn hơn chiều rộng slide bar */
                padding: 20px; /* Thêm padding cho đẹp */
            }

            .search-container {
                top: 0;
                left: 290px; /* Đẩy sang phải để tránh slide bar */
                width: calc(100% - 220px); /* Chiếm toàn bộ chiều rộng còn lại */
                background: #222; /* Nền để dễ nhìn */
                padding: 10px;
                z-index: 1000; /* Đảm bảo nằm trên các phần tử khác */
                display: flex;
                margin-left: 10px;
                align-items: center;
                gap: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            }

            .search-container label {
                font-size: 16px;
                color: #00ccff;
                font-weight: bold;
                text-transform: uppercase;
            }

            .search-container input[type="text"] {
                padding: 10px;
                width: 350px;
                border: 2px solid #00ccff;
                border-radius: 5px;
                background-color: #333;
                color: #fff;
                font-size: 14px;
            }

            .search-btn {
                padding: 10px 20px;
                background: linear-gradient(90deg, #00ccff, #ff00ff);
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            
            h3 {
                font-size: 24px;
                margin-bottom: 20px;
                color:#ff00ff;
                padding: 5px 0;
            }
            
            h3 span{
                background: linear-gradient(90deg, #00ccff, #ff00ff);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                font-size: 24px;
                margin-bottom: 20px;
                padding: 5px 0;
            }
            
            .table-wrapper {
                overflow-x: auto;
                max-width: 100%;
                border-radius: 10px;
                margin-left: 10px;
                box-shadow: 0 0 20px rgba(0, 204, 255, 0.3);
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background-color: #222;
                min-width: 800px;
                color: #fff;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #444;
            }

            th {
                background: linear-gradient(90deg, #00ccff, #007bff);
                color: #fff;
                font-size: 16px;
                font-weight: bold;
                text-transform: uppercase;
            }

            td {
                font-size: 14px;
                color: #ddd;
            }

            tr:nth-child(even) {
                background-color: #2a2a2a;
            }

            tr:hover {
                background-color: #333;
                box-shadow: 0 0 10px rgba(0, 204, 255, 0.5);
            }

            td:last-child a {
                color: #00ccff;
                text-decoration: none;
                margin-right: 10px;
                font-weight: bold;
            }

            .no-results {
                color: red;
                font-style: italic;
                font-size: 16px;
                text-align: center;
                padding: 20px;
            }

            .game-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
                border-radius: 5px;
            }

        </style>
    </head>
    <body>
        <div class="search-game-content">
            <div class="container">
                <%@ include file="/slidebar.jsp" %>
                <!-- Main Content -->
                <div class="main-content">
                    <% if (session.getAttribute("user") != null && AuthUtils.isAdmin(session)) { %>
                    <% String searchTerm = (request.getAttribute("searchTerm") != null) ? (String) request.getAttribute("searchTerm") : ""; %>

                    <!-- Search Form -->
                    <div class="search-container">
                        <form action="GameController" method="GET">
                            <input type="hidden" name="action" value="searchGame"/>
                            <input type="hidden" name="page" value="searchGame"/> <!-- Giữ pageParam -->
                            <label for="tableSearch">Search Games: </label>
                            <input type="text" id="tableSearch" name="searchTerm" value="<%= searchTerm %>" placeholder="Nhập gameid, gameName, hoặc genre ...">
                            <input type="submit" value="Search" class="search-btn"/>
                        </form>
                            <h3>Kết quả tìm kiếm cho <span style="color: red"><%=searchTerm%></span></h3>
                    </div>

                    <!-- Games Table -->
                    <% if (request.getAttribute("games") != null) {
                        List<GameDTO> games = (List<GameDTO>) request.getAttribute("games");
                        System.out.println("searchGame.jsp: games = " + games);
                        System.out.println("searchGame.jsp: games size = " + (games != null ? games.size() : "null"));
                        if (!games.isEmpty()) { %>
                        <div class="table-wrapper">
                            <table border="1" cellspacing="0" cellpadding="5" id="gameTable">
                                <thead>
                                    <tr>
                                        <th>Game ID</th>
                                        <th>Game Name</th>
                                        <th>Price</th>
                                        <th>Release Date</th>
                                        <th>Genre</th>
                                        <th>Platform</th>
                                        <th>Description</th>
                                        <th>Stock</th>
                                        <th>Image</th>
                                        <th>Created At</th>
                                        <th>Updated At</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (GameDTO g : games) { %>
                                    <tr>
                                        <td><%= g.getGameId() %></td>
                                        <td><%= g.getGameName() %></td>
                                        <td><%= g.getPrice() %></td>
                                        <td><%= g.getReleaseDate() %></td>
                                        <td><%= g.getGenre() %></td>
                                        <td><%= g.getPlatform() %></td>
                                        <td><%= g.getDescription() %></td>
                                        <td><%= g.getStock() %></td>
                                        <td><img src="<%= g.getImageUrl() %>" alt="<%= g.getGameName() %>" class="game-image"></td>
                                        <td><%= g.getCreatedAt() %></td>
                                        <td><%= g.getUpdatedAt() %></td>
                                        <td>
                                            <a href="<%= request.getContextPath() %>/GameController?action=deleteGame&gameId=<%= g.getGameName()%>" 
                                               onclick="return confirm('Bạn có chắc muốn xóa game này?')">Delete</a> |
                                            <a href="<%= request.getContextPath() %>/GameController?action=updateGameForm&gameId=<%= g.getGameName()%>">Edit</a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <% } else { %>
                            <p class="no-results">No games found.</p>
                        <% } %>
                    <% } %>

                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>
