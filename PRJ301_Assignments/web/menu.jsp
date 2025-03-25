<%-- 
    Document   : menu.jsp
    Created on : Mar 9, 2025, 10:51:08 PM
    Author     : LENOVO
--%>

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
            UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;
            if (user != null) {
        %>
        
        <%}%>
        <jsp:include page="partials/footer.jsp"/>
    </body>
</html>
