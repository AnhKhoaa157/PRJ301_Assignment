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
import java.math.BigDecimal;
import java.sql.Date;
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
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String MENU_PAGE = "menu.jsp";
    private static final String SEARCHGAME_PAGE = "GameController?page=searchGame";
    private static final String EDITGAME_PAGE = "editGame.jsp";
    private GameDAO gameDAO;

    public GameController() {
        try {
            gameDAO = new GameDAO();
        } catch (Exception e) {
            log("Error initializing GameDAO: " + e.toString());
        }
    }
        
    private String processSearchGames(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            url = LOGIN_PAGE;
            request.setAttribute("message", "Vui lòng đăng nhập để tìm kiếm game!");
        } else {
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<GameDTO> games = gameDAO.getGameByName(searchTerm);
            System.out.println("processSearchGames: Found " + (games != null ? games.size() : "null") + " games");
            request.setAttribute("games", games);
            request.setAttribute("searchTerm", searchTerm);
            if (AuthUtils.isAdmin(session)) {
                url = "admin.jsp?page=searchGame";
            } else {
                url = MENU_PAGE;
            }
        }
        return url;
    }

    private String processSearchByGenre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            url = LOGIN_PAGE;
            request.setAttribute("message", "Vui lòng đăng nhập để tìm kiếm game theo thể loại!");
        } else {
            String genre = request.getParameter("genre");
            if (genre == null) {
                genre = "";
            }
            List<GameDTO> games = gameDAO.getGamesByGenre(genre);
            System.out.println("processSearchByGenre: Found " + (games != null ? games.size() : "null") + " games for genre: " + genre);
            request.setAttribute("games", games);
            request.setAttribute("searchTerm", genre);
            if (AuthUtils.isAdmin(session)) {
                url = "admin.jsp?page=searchGame";
            } else {
                url = MENU_PAGE;
            }
        }
        return url;
    }

    private String processGetAllGames(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            url = LOGIN_PAGE;
            request.setAttribute("message", "Vui lòng đăng nhập để xem danh sách game!");
        } else {
            List<GameDTO> games = gameDAO.getAllGames();
            System.out.println("processGetAllGames: Found " + (games != null ? games.size() : "null") + " games");
            request.setAttribute("games", games);
            request.setAttribute("searchTerm", "");
            if (AuthUtils.isAdmin(session)) {
                url = "admin.jsp?page=searchGame";
            } else {
                url = MENU_PAGE;
            }
        }
        return url;
    }

    private String processListGenres(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            url = LOGIN_PAGE;
            request.setAttribute("message", "Vui lòng đăng nhập để xem danh sách thể loại!");
        } else {
            if (gameDAO == null) {
                throw new ServletException("GameDAO is not initialized");
            }
            List<String> genres = gameDAO.getAllGenres();
            System.out.println("processListGenres: Found " + (genres != null ? genres.size() : "null") + " genres");
            request.setAttribute("genres", genres);
            url = "genreList.jsp";
        }
        return url;
    }
    
    private String processEditGame(HttpServletRequest request, HttpServletResponse response) {
        String gameIdStr = request.getParameter("gameId");
        String url = EDITGAME_PAGE;

        try {
            int gameId = Integer.parseInt(gameIdStr);
            if (gameId <= 0) {
                request.setAttribute("error", "Game ID phải là số dương!");
                url = SEARCHGAME_PAGE;
            } else {
                GameDTO game = gameDAO.getGameById(gameId);
                if (game != null) {
                    request.setAttribute("game", game);
                } else {
                    request.setAttribute("error", "Không tìm thấy game!");
                    url = SEARCHGAME_PAGE;
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Game ID không hợp lệ!");
            url = SEARCHGAME_PAGE;
        }
        return url;
    }
    
    private String processUpdateGameForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = SEARCHGAME_PAGE;
        String gameIdStr = request.getParameter("gameId");
        String gameName = request.getParameter("gameName");
        String priceStr = request.getParameter("price");
        String releaseDateStr = request.getParameter("releaseDate");
        String platform = request.getParameter("platform");
        String description = request.getParameter("description");
        String stockStr = request.getParameter("stock");
        String imageUrl = request.getParameter("imageUrl");


        try {
            int gameId = Integer.parseInt(gameIdStr);
            BigDecimal price = new BigDecimal(priceStr);
            int stock = Integer.parseInt(stockStr);
            Date releaseDate = Date.valueOf(releaseDateStr);

            GameDTO game = gameDAO.getGameById(gameId);
            if (game != null) {
                game.setGameName(gameName);
                game.setPrice(price);
                game.setReleaseDate(releaseDate);
                game.setPlatform(platform);
                game.setDescription(description);
                game.setStock(stock);
                game.setImageUrl(imageUrl);

                boolean updated = gameDAO.updateGame(game);
                if (updated) {
                    request.setAttribute("message", "Cập nhật game thành công!");
                } else {
                    request.setAttribute("error", "Cập nhật game thất bại!");
                }
            } else {
                request.setAttribute("error", "Không tìm thấy game!");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Dữ liệu số không hợp lệ!");
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Ngày không hợp lệ!");
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
            String genre = request.getParameter("genre");
            System.out.println("Action: " + action + ", Page: " + page + ", Genre: " + genre);

            if (action == null && page == null) {
                url = processGetAllGames(request, response);
            } else if ("searchGame".equals(action) && genre != null && !genre.isEmpty()) {
                url = processSearchByGenre(request, response);
            } else if ("searchGame".equals(action)) {
                url = processSearchGames(request, response);
            } else if ("searchGame".equals(page)) {
                url = processGetAllGames(request, response);
            } else if ("listGenres".equals(action)) {
                url = processListGenres(request, response);
            } else if ("editGame".equals(action)){
                url = processEditGame(request, response);
            } else if("updateGame".equals(action)){
                url = processUpdateGameForm(request, response);
            } else {
                url = MENU_PAGE;
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
