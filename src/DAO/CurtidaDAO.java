/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Junior
 */
public class CurtidaDAO {
    private Connection conn;

    public CurtidaDAO(Connection conn) {
        this.conn = conn;
    }
    
    public void curtir(int usuarioId, int musicaId) throws SQLException{
        String sql = "INSERT INTO curtidas (usuario_Id, musica_Id, status) " + 
                "VALUES (?, ?, true)" + 
                "ON CONFLICT (usuario_Id, musica_Id)" + 
                "DO UPDATE SET status = true";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
        stmt.setInt(2, musicaId);
        stmt.executeUpdate();
    }
    
    public void descurtir(int usuarioId, int musicaId) throws SQLException{
        String sql = "INSERT INTO curtidas (usuario_Id, musica_Id, status)" +
                "VALUES (?, ?, false)" + 
                "ON CONFLICT (usuario_Id, musica_Id)" + 
                "DO UPDATE SET status = false";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
        stmt.setInt(2, musicaId);
        stmt.executeUpdate();
    }
    
    public boolean usuarioCurtiu(int usuarioId, int musicaId) throws SQLException {
        String sql = "SELECT status FROM curtidas WHERE usuario_id = ? AND musica_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
        stmt.setInt(2, musicaId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return rs.getBoolean("status");
        }
        return false;
        }       
}
