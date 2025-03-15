/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class AuthUtils {

    private static final String ADMIN_ROLE = "Admin";
    private static final String USER_ROLE = "Customer";

    public static UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByID(strUserID);
        return user;
    }

    public static boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        System.out.println(user);
        return user != null && user.getPassword().equals(strPassword);
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static UserDTO getUser(HttpSession session) {
        if (!isLoggedIn(session)) {
            return null;
        }
        return (UserDTO) session.getAttribute("user");
    }

    public static boolean isAdmin(HttpSession session) {
        if (!isLoggedIn(session)) {
            return false;
        }
        UserDTO user = getUser(session);
        return user.getRoleID().equals(ADMIN_ROLE);
    }
    
    public static boolean isUser(HttpSession session){
        if(!isLoggedIn(session)){
            return false;
        }
        UserDTO user = getUser(session);
        return user.getRoleID().equals(USER_ROLE);
    }
    
    public static boolean isSessionExpired(HttpSession session){
        Long loginTime = (Long)session.getAttribute("loginTime");
        if(loginTime == null) return true;
        Long currentTime = System.currentTimeMillis();
        long elapsedTime = currentTime - loginTime;
        long oneHourInMillis = 60 * 60 * 1000; // 1 giờ (milliseconds)
        
        return elapsedTime > oneHourInMillis;
    }
}