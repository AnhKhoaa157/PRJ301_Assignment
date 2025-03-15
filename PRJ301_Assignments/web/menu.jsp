<%-- 
    Document   : menu
    Created on : Mar 9, 2025, 10:51:08 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file='header.jsp' %>
        <%
            if(!AuthUtils.isLoggedIn(session)){
        %>
            <h1>Welcome Guest!</h1>
        <%}%>
        <%
            if(AuthUtils.isLoggedIn(session)){
        %>
            <%                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>

            <div class="menu-container">
                <div class="menu-section">
                    
                </div>
            </div>    

            <%}%>
        <%}%>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
