/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.GameDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class GameDAO implements IDAO<GameDTO, String>{

    @Override
    public boolean create(GameDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<GameDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public GameDTO readByID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(GameDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<GameDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<GameDTO> getGameByName(String searchTerm) {
        String sql = " SELECT * FROM tblGames WHERE game_name LIKE ?";
        List<GameDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                GameDTO game = new GameDTO(
                        rs.getInt("game_id"),
                        rs.getString("game_name"),
                        rs.getBigDecimal("price"),
                        rs.getDate("release_date"),
                        rs.getString("genre"),
                        rs.getString("platform"),
                        rs.getString("description"),
                        rs.getInt("stock"),
                        rs.getString("image_url"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
                list.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi SQL đầy đủ ra console
        }
        return list;
    }
    
    public List<GameDTO> getAllGames() {
        String sql = "SELECT game_id, game_name, price, release_date, genre, platform, description, stock, image_url, created_at, updated_at FROM tblGames";
        List<GameDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new GameDTO(
                    rs.getInt("game_id"),
                    rs.getString("game_name"),
                    rs.getBigDecimal("price"),
                    rs.getDate("release_date"),
                    rs.getString("genre"),
                    rs.getString("platform"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("image_url"),
                    rs.getTimestamp("created_at"),
                    rs.getTimestamp("updated_at")
                ));
            }
        } catch (SQLException e) {
            System.err.println("SQL Error in getAllGames: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GameDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
