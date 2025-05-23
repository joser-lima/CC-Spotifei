/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Musica;
import DAO.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Artista;


/**
 *
 * @author Junior
 */
public class MusicaDAO {
    private Connection conn;
    
    public MusicaDAO(Connection conn){
        this.conn = conn;
    }
    
    public List<Musica> buscarMusica(String nome) throws SQLException {
        List<Musica> lista = new ArrayList<>();
        String sql = "SELECT m.id, m.nome AS musica_nome, m.genero, " +
                     "a.id AS artista_id, a.nome AS artista_nome, " +
                     "COUNT(CASE WHEN c.status = true THEN 1 END) AS curtidas, " +
                     "COUNT(CASE WHEN c.status = false THEN 1 END) AS descurtidas " +
                     "FROM musicas m " +
                     "JOIN artistas a ON m.artista_id = a.id " +
                     "LEFT JOIN curtidas c ON m.id = c.musica_id " +
                     "WHERE m.nome ILIKE ? " +
                     "GROUP BY m.id, m.nome, m.genero, a.id, a.nome";

        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + nome + "%");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Musica m = new Musica();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("musica_nome"));
            m.setGenero(rs.getString("genero"));
            m.setCurtidas(rs.getInt("curtidas"));
            m.setDescurtidas(rs.getInt("descurtidas"));

            Artista a = new Artista();
            a.setId(rs.getInt("artista_id"));
            a.setNome(rs.getString("artista_nome"));
            
            

            m.setArtista(a);
            lista.add(m);
        }

        return lista;
    }
    
    
    public List<Musica> musicasCurtidas(int usuarioId) throws SQLException {
        List<Musica> lista = new ArrayList<>();

        String sql = "SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome " +
                     "FROM musicas m " +
                     "JOIN artistas a ON m.artista_id = a.id " +
                     "JOIN curtidas c ON m.id = c.musica_id " +
                     "WHERE c.usuario_id = ? AND c.status = true";

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
    
    public List<Musica> musicasDescurtidas(int usuarioId) throws SQLException {
        List<Musica> lista = new ArrayList<>();

        String sql = "SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome " +
                     "FROM musicas m " +
                     "JOIN artistas a ON m.artista_id = a.id " +
                     "JOIN curtidas c ON m.id = c.musica_id " +
                     "WHERE c.usuario_id = ? AND c.status = false";

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

