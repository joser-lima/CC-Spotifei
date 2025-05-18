/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import model.Musica;
import model.Artista;

/**
 *
 * @author Junior
 */
public class HistoricoDAO {
    private Connection conn;

    public HistoricoDAO(Connection conn) {
        this.conn = conn;
    }

    public void inserir(int usuarioId, int musicaId) throws SQLException {
        String sql = "INSERT INTO historico_buscas (usuario_id, musica_id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
        stmt.setInt(2, musicaId);
        stmt.executeUpdate();
    }

    public List<Musica> listarHistorico(int usuarioId) throws SQLException {
        List<Musica> lista = new ArrayList<>();

        String sql = "SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome " +
                        "FROM historico_buscas h " +
                        "JOIN musicas m ON h.musica_id = m.id " +
                        "JOIN artistas a ON m.artista_id = a.id " +
                        "WHERE h.usuario_id = ? " +
                        "GROUP BY m.id, m.nome, m.genero, a.id, a.nome, h.data_hora " +
                        "ORDER BY MAX(h.data_hora) DESC " +
                        "LIMIT 10";

        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, usuarioId);
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
}
