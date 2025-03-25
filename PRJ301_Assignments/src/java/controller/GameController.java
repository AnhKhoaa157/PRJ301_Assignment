/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.GameDAO;
import dto.GameDTO;
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
@WebServlet(name = "GameController", urlPatterns = {"/GameController"})
public class GameController extends HttpServlet {
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String MENU_PAGE = "menu.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    GameDAO gameDAO = new GameDAO();
    
    private String processSearchGames(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            url = "admin.jsp?page=searchGame";

            List<GameDTO> games = gameDAO.getGameByName(searchTerm);
            System.out.println("processSearchGames: Found " + (games != null ? games.size() : "null") + " games ");
            request.setAttribute("games", games);
            request.setAttribute("searchTerm", searchTerm);
        } else {
            response.sendRedirect(LOGIN_PAGE);
            return null;
        }
        return url;
    }
    
    private String processGetAllGames(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            url = "admin.jsp?page=searchGame";
            List<GameDTO> games = gameDAO.getAllGames();
            System.out.println("processGetAllGames: Found " + (games != null ? games.size() : "null") + " games");
            request.setAttribute("games", games);
            request.setAttribute("searchTerm", ""); // Giữ searchTerm rỗng
        } else {
            response.sendRedirect(LOGIN_PAGE);
            return null;
        }
        return url;
    }
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            String action = request.getParameter("action");
            String page = request.getParameter("page");
            System.out.println("Action: " + action + ", Page: " + page);
            if (action == null && page == null) {
                url = LOGIN_PAGE;
            } else {
                if ("searchGame".equals(action)) {
                    url = processSearchGames(request, response);
                } else if ("searchGame".equals(page)) {
                    url = processGetAllGames(request, response);
                } else {
                    url = ADMIN_PAGE; // Mặc định về admin.jsp nếu không khớp
                }
            }

        } catch (Exception e) {
            log("Error at GameController: " + e.toString());
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
