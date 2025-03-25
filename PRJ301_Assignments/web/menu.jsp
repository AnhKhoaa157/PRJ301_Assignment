<%-- 
    Document   : menu.jsp
    Created on : Mar 9, 2025, 10:51:08 PM
    Author     : LENOVO
--%>

<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Catalog - Menu</title>
        <link rel="stylesheet" href="assets/css/index.css">
    </head>
    <body>
        <%@include file='partials/header.jsp' %>

        <%
            if (!AuthUtils.isLoggedIn(session)) {
        %>
            <h1>Welcome Guest!</h1>
        <%
            } else {
                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
        %>

        <div class="page-content">
            <h1>Welcome, <%= user.getUserName()%>!</h1>
            <h2>Book Catalog</h2>

            <div class="search-container">
                <form action="MainController" method="GET">
                    <input type="hidden" name="action" value="listBooks">
                    <input type="text" name="searchTerm" placeholder="Search by title, author..." value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>">
                    <button type="submit" class="search-button">Search</button>
                </form>
            </div>

            <%
                List<BookDTO> bookList = (List<BookDTO>) request.getAttribute("bookList");
                if (bookList != null && !bookList.isEmpty()) {
            %>
            <div class="book-grid">
                <% for (BookDTO book : bookList) { %>
                    <div class="book-card">
                        <div class="book-cover">
                            <% if (book.getImage() != null && !book.getImage().isEmpty()) { %>
                                <img src="<%= book.getImage() %>" alt="<%= book.getTitle() %>" onerror="this.onerror=null; this.src='assets/images/no-cover.png';">
                            <% } else { %>
                                <div class="no-image">
                                    <span>No Cover</span>
                                </div>
                            <% } %>
                        </div>
                        <div class="book-info">
                            <h3 class="book-title"><%= book.getTitle() %></h3>
                            <p class="book-author">by <%= book.getAuthor() %></p>
                            <p class="book-year">Published: <%= book.getPublishYear() %></p>
                            <div class="book-price-container">
                                <span class="book-price">$<%= book.getPrice() %></span>
                                <% if (book.getQuantity() > 0) { %>
                                    <span class="stock in-stock"><%= book.getQuantity() %> in stock</span>
                                <% } else { %>
                                    <span class="stock out-of-stock">Out of stock</span>
                                <% } %>
                            </div>
                            <a href="MainController?action=viewDetail&id=<%= book.getBookID() %>" class="view-details-btn">View Details</a>
                        </div>
                    </div>
                <% } %>
            </div>

            <!-- Pagination -->
            <%
                int currentPage = request.getAttribute("currentPage") != null ? (Integer) request.getAttribute("currentPage") : 1;
                int totalPages = request.getAttribute("totalPages") != null ? (Integer) request.getAttribute("totalPages") : 1;
                String searchTerm = request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "";
            %>

            <div class="pagination">
                <% if (currentPage > 1) { %>
                    <a href="MainController?action=listBooks&page=<%= currentPage - 1 %>&searchTerm=<%= searchTerm %>" class="pagination-btn">&laquo; Previous</a>
                <% } %>

                <div class="pagination-info">
                    Page <%= currentPage %> of <%= totalPages %>
                </div>

                <% if (currentPage < totalPages) { %>
                    <a href="MainController?action=listBooks&page=<%= currentPage + 1 %>&searchTerm=<%= searchTerm %>" class="pagination-btn">Next &raquo;</a>
                <% } %>
            </div>

            <%
                } else {
            %>
                <div class="no-results">
                    <p>No books found. Please try a different search or check back later.</p>
                </div>
            <%
                }
            %>

        </div>

        <%
                } // end if user != null
            } // end if isLoggedIn
        %>

        <jsp:include page="partials/footer.jsp"/>
    </body>
</html>
