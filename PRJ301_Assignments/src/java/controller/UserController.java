/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author LENOVO
 */

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String MENU_PAGE = "menu.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String SEARCHUSER_PAGE = "searchUser.jsp"; // Sử dụng trực tiếp searchUser.jsp
    private static final String UPDATE_PAGE = "updateUser.jsp";
    private UserDAO userDAO = new UserDAO();

    // Xử lý tìm kiếm user
    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            } else {
                searchTerm = searchTerm.trim();
            }
            url = SEARCHUSER_PAGE;
            List<UserDTO> users = userDAO.getUserByName(searchTerm);
            System.out.println("Search term: " + searchTerm + ", Found: " + (users != null ? users.size() : "null") + " users"); // Debug
            request.setAttribute("users", users);
            request.setAttribute("searchTerm", searchTerm);
        } else {
            response.sendRedirect(request.getContextPath() + "/" + LOGIN_PAGE);
            return null;
        }
        return url;
    }

//    // Xử lý xóa user
//    private String processDelete(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String url = LOGIN_PAGE;
//        HttpSession session = request.getSession();
//        if (AuthUtils.isAdmin(session)) {
//            String userId = request.getParameter("userID");
//            if (userId != null && !userId.isEmpty()) {
//                userDAO.deleteUser(userId);
//            }
//            url = processSearch(request, response); // Sau khi xóa, quay lại trang tìm kiếm
//        } else {
//            response.sendRedirect(request.getContextPath() + "/" + LOGIN_PAGE);
//            return null;
//        }
//        return url;
//    }

//    // Xử lý hiển thị form cập nhật
//    private String processUpdateForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String url = LOGIN_PAGE;
//        HttpSession session = request.getSession();
//        if (AuthUtils.isAdmin(session)) {
//            String userId = request.getParameter("userID");
//            if (userId != null && !userId.isEmpty()) {
//                UserDTO user = userDAO.getUserById(userId);
//                if (user != null) {
//                    request.setAttribute("user", user);
//                    url = UPDATE_PAGE;
//                }
//            }
//        } else {
//            response.sendRedirect(request.getContextPath() + "/" + LOGIN_PAGE);
//            return null;
//        }
//        return url;
//    }

//    // Xử lý cập nhật user
//    private String processUpdate(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String url = LOGIN_PAGE;
//        HttpSession session = request.getSession();
//        if (AuthUtils.isAdmin(session)) {
//            String userId = request.getParameter("userID");
//            String username = request.getParameter("username");
//            String fullname = request.getParameter("fullname");
//            String email = request.getParameter("email");
//            String phone = request.getParameter("phone");
//            String address = request.getParameter("address");
//            String role = request.getParameter("role");
//
//            if (userId != null && !userId.isEmpty()) {
//                UserDTO user = new UserDTO(userId, username, fullname, email, phone, address, role, null);
//                userDAO.updateUser(user);
//                url = processSearch(request, response); // Sau khi cập nhật, quay lại trang tìm kiếm
//            }
//        } else {
//            response.sendRedirect(request.getContextPath() + "/" + LOGIN_PAGE);
//            return null;
//        }
//        return url;
//    }

    // Phương thức chính xử lý mọi request
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action" + action);
            if (action == null || action.isEmpty()) {
                url = ADMIN_PAGE;
            } else if(action.equals("searchUser")){
                url = processSearch(request, response);
            }

        } catch (Exception e) {
            log("Error at UserController: " + e.toString());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong!");
        }  finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
