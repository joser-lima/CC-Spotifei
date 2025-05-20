/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.*;
import model.Playlist;
import model.Usuario;


/**
 *
 * @author Junior
 */
public class PlaylistDAO {
    private Connection conn;

    public PlaylistDAO(Connection conn) {
        this.conn = conn;
    }
    
    public void inserir(Playlist playlist) throws SQLException{
        String sql = "INSERT INTO playlists(nome, usuario_id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, playlist.getNome());
        stmt.setInt(2, playlist.getUsuario().getId());
        stmt.executeUpdate();
    }
    
    public List<Playlist> listarPorUsuario(int usuarioId) throws SQLException{
        List<Playlist> lista = new ArrayList<>();
        String sql = "SELECT * FROM playlists WHERE usuario_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Playlist p = new Playlist();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            Usuario u = new Usuario();
            u.setId(rs.getInt("usuario_id"));
            p.setUsuario(u);
            lista.add(p);
        }
        
        return lista;
    }
    
    public void atualizar(Playlist playlist) throws SQLException{
        String sql = "UPDATE playlists SET nome = ? WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, playlist.getNome());
        stmt.setInt(2, playlist.getId());
        stmt.executeUpdate();
    }
    
    public void excluir(int id) throws SQLException{
        String sql = "DELETE FROM playlists WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
    }
}
