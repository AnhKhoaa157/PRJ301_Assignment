<%-- 
    Document   : editGame
    Created on : Mar 27, 2025, 7:34:35 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.GameDTO, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('assets/image/1551360_383.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .form-container {
            width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        h2 {
            text-align: center;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(0, 204, 255, 0.8);
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            border: 2px solid #00ccff;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input:focus, textarea:focus {
            border-color: #ff00ff;
            box-shadow: 0 0 10px rgba(255, 0, 255, 0.5);
            outline: none;
        }

        input[readonly] {
            background: rgba(255, 255, 255, 0.1);
            border-color: #007bff;
            color: #ccc;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .button-group {
            display: flex;
            text-align: center;
            gap: 20px;
        }

        .button-group input, .button-group a {
            padding: 12px 25px;
            margin: 0 15px;
            text-decoration: none;
            color: white;
            background: linear-gradient(90deg, #00ccff, #ff00ff);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .button-group a {
            background: linear-gradient(90deg, #ff4444, #ff7777);
        }

        .button-group input:hover, .button-group a:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 0, 255, 0.8);
        }

        .error {
            color: #ff4444;
            margin-bottom: 15px;
            text-align: center;
            font-style: italic;
            text-shadow: 0 0 5px rgba(255, 68, 68, 0.5);
        }

        .message {
            color: #00ccff;
            margin-bottom: 15px;
            text-align: center;
            font-style: italic;
            text-shadow: 0 0 5px rgba(0, 204, 255, 0.5);
        }

        .image-preview {
            margin-top: 10px;
            text-align: center;
        }

        .image-preview img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            border: 2px solid #00ccff;
            box-shadow: 0 0 10px rgba(0, 204, 255, 0.5);
        }

        .genres-list {
            color: wheat;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Chỉnh sửa Game</h2>
        
        <%
            String error = (String) request.getAttribute("error");
            String message = (String) request.getAttribute("message");
            GameDTO game = (GameDTO) request.getAttribute("game");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <%
            }
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }
            if (game != null) {
        %>
        
        <form action="GameController" method="post">
            <input type="hidden" name="action" value="updateGame">
            <input type="hidden" name="gameId" value="<%= game.getGameId() %>">
            
            <div class="form-group">
                <label for="gameName">Tên Game:</label>
                <input type="text" id="gameName" name="gameName" value="<%= game.getGameName() != null ? game.getGameName() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="price">Giá:</label>
                <input type="number" id="price" name="price" step="0.01" value="<%= game.getPrice() != null ? game.getPrice() : 0 %>" required>
            </div>
            
            <div class="form-group">
                <label for="releaseDate">Ngày phát hành:</label>
                <input type="date" id="releaseDate" name="releaseDate" 
                       value="<%= game.getReleaseDate() != null ? dateFormat.format(game.getReleaseDate()) : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="platform">Nền tảng:</label>
                <input type="text" id="platform" name="platform" value="<%= game.getPlatform() != null ? game.getPlatform() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4"><%= game.getDescription() != null ? game.getDescription() : "" %></textarea>
            </div>
            
            <div class="form-group">
                <label for="stock">Số lượng tồn kho:</label>
                <input type="number" id="stock" name="stock" value="<%= game.getStock() %>" required>
            </div>
            
            <div class="form-group">
                <label for="imageFile">Chọn ảnh mới:</label>
                <input type="file" id="imageFile" name="imageFile" accept="assets/image/*" onchange="previewImage(event)">
                <div class="image-preview">
                    <img id="imagePreview" src="<%= game.getImageUrl() != null ? game.getImageUrl() : "" %>" 
                         alt="Xem trước" style="<%= game.getImageUrl() != null ? "display:block" : "display:none" %>">
                </div>

                <input type="hidden" name="currentImageUrl" value="<%= game.getImageUrl() != null ? game.getImageUrl() : "" %>">
            </div>
            
            <div class="form-group">
                <label>Thể loại:</label>
                <%
                    List<String> genres = game.getGenres();
                    if (genres != null && !genres.isEmpty()) {
                        for (String genre : genres) {
                %>
                    <span><%= genre %></span><br>
                <%
                        }
                    } else {
                %>
                    <span>Không có thể loại</span>
                <%
                    }
                %>
            </div>
            
            <div class="form-group">
                <label for="createdAt">Ngày tạo:</label>
                <input type="text" id="createdAt" name="createdAt" 
                       value="<%= game.getCreatedAt() != null ? dateTimeFormat.format(game.getCreatedAt()) : "" %>" readonly>
            </div>
            
            <div class="form-group">
                <label for="updatedAt">Ngày cập nhật:</label>
                <input type="text" id="updatedAt" name="updatedAt" 
                       value="<%= game.getUpdatedAt() != null ? dateTimeFormat.format(game.getUpdatedAt()) : "" %>" readonly>
            </div>
            
            <div class="button-group">
                <input type="submit" value="Cập nhật">
                <a href="GameController?page=searchGame">Quay lại</a>
            </div>
        </form>
        <%
            } else {
        %>
            <div class="error">Không có dữ liệu game để hiển thị!</div>
        <%
            }
        %>
    </div>
    <script>
        function previewImage() {
            var url = document.getElementById("imageUrl").value;
            var preview = document.getElementById("imagePreview");
            if (url) {
                preview.src = url;
                preview.style.display = "block";
            } else {
                preview.style.display = "none";
            }
        }
    </script>
</body>
</html>
