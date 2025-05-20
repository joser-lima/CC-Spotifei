/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Artista;
import model.Musica;

/**
 *
 * @author Junior
 */
public class PlaylistMusicaDAO {
    private Connection conn;

    public PlaylistMusicaDAO(Connection conn) {
        this.conn = conn;
    }
    
    
    public List<Musica> listarPorPlaylist(int playlistId) throws SQLException {
        List<Musica> lista = new ArrayList<>();

        String sql = "SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome " +
                     "FROM playlist_musica pm " +
                     "JOIN musicas m ON pm.musica_id = m.id " +
                     "JOIN artistas a ON m.artista_id = a.id " +
                     "WHERE pm.playlist_id = ?";

        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, playlistId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Musica m = new Musica();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setGenero(rs.getString("genero"));

            Artista a = new Artista();
            a.setId(rs.getInt("artista_id"));
            a.setNome(rs.getString("artista_nome"));
            m.setArtista(a);

            lista.add(m);
        }

        return lista;
    }

    public void adicionarMusica(int playlistId, int musicaId) throws SQLException {
        String sql = "INSERT INTO playlist_musica (playlist_id, musica_id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, playlistId);
        stmt.setInt(2, musicaId);
        stmt.executeUpdate();
    }

    public void removerMusica(int playlistId, int musicaId) throws SQLException {
        String sql = "DELETE FROM playlist_musica WHERE playlist_id = ? AND musica_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, playlistId);
        stmt.setInt(2, musicaId);
        stmt.executeUpdate();
    }    
}
