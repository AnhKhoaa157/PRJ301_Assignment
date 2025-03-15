<%-- 
    Document   : admin
    Created on : Mar 9, 2025, 10:51:28 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admintrators</title>
        
        <style>
            /* Search section styles */
        .search-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: none; /* Mặc định ẩn */
            align-items: center;
        }

        .search-container.active {
            display: flex; /* Hiện khi có class active */
        }

        .search-container form {
            display: flex;
            align-items: center;
            flex-grow: 1;
        }

        .search-input {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 10px;
            transition: border-color 0.3s;
        }

        .search-input:focus {
            border-color: #009879;
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 152, 121, 0.2);
        }

        .search-btn, .toggle-search-btn {
            background-color: #009879;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .search-btn:hover, .toggle-search-btn:hover {
            background-color: #00806a;
        }
        </style> 
    </head>
        <body> 
            <%@include file="header.jsp" %>
            <div style="min-height: 500px; padding: 10px">


                <%                if (session.getAttribute("user") != null) {
                        UserDTO user = (UserDTO) session.getAttribute("user");
                %>
                <% 
                String searchTerm = request.getAttribute("searchTerm")+"";
                if (searchTerm == null) searchTerm = "";
                 %>
                 <%if(AuthUtils.isAdmin(session)) {%>
                <!--Search User-->
                  <!-- Nút mở thanh tìm kiếm -->
                <button onclick="toggleSearch()" class="toggle-search-btn">Search User</button>
                
                <div id="searchContainer" class="search-container">
                    <form action="MainController">
                        <input type="hidden" name="action" value="search"/>
                        <label for="searchInput">Search Users:</label>
                        <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter UserID , UserName or RoleID..."/>
                        <input type="submit" value="Search" class="search-btn"/>
                    </form>
                </div>
                <%
                    if (request.getAttribute("users") != null) {
                    List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                %>                
                <table class="user-table">
                <thead>
                    <tr>
                        <th>UserNumber</th>
                        <th>UserID</th>
                        <th>UserName</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>RoleID</th>
                        <th>CreatedAt</th>
                        <% if (AuthUtils.isAdmin(session)) {
                            %>
                        <th>Action</th>
                        <%}%>
                    </tr>
                    
                    <tbody>
                    <% int count = 1; 
                       for (UserDTO u : users) { %>
                        <tr>
                            <td><%= count++ %></td>
                            <td><%= u.getUserID() %></td>
                            <td><%= u.getUserName() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getPhone() %></td>
                            <td><%= u.getAddress() %></td>
                            <td><%= u.getRoleID() %></td>
                            <td><%= u.getCreatedAt() %></td>
                            <td>
                                <a href="MainController?action=deleteUser&userID=<%=u.getUserID()%>">Delete</a> | 
                                <a href="MainController?action=updateUserForm&userID=<%=u.getUserID()%>">Edit</a>
                            </td>
                        </tr>
                    <% } %>
            </tbody>
                </table>
                <%}%>
                <div class="searchGame-table">

                </div>
                <!--Search Game-->
                <button onclick="toggleSearchGame()" class="toggle-search-btn">Search Games</button>
                <div id="searchGameContainer" class="search-container">
                    <form action="MainController">
                        <input type="hidden" name="action" value="searchGame"/>
                        <label for="searchInputGame">Search Games:</label>
                        <input type="text" id="searchInputGame" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter GameID, GameName..."/>
                        <input type="submit" value="Search" class="search-btn"/>
                    </form>
                </div>
                <% } else { %>
                    <p>You do not have permission to access this content.</p>
                <% } %>

                <% } else { %>
                    <p>You do not have permission to access this content.</p>
                <% } %>
        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            function toggleSearch() {
                var searchContainer = document.getElementById("searchContainer");
                searchContainer.classList.toggle("active");
            }
            
            function toggleSearchGame() {
                var searchGameContainer = document.getElementById("searchGameContainer");
                searchGameContainer.classList.toggle("active");
            }

        </script>
    </body>
</html>

