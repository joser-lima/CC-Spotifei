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
        String sql = "SELECT m.id, m.nome AS musica_nome, m.genero, a.id AS artista_id, a.nome AS artista_nome " +
                     "FROM musicas m " +
                     "JOIN artistas a ON m.artista_id = a.id " +
                     "WHERE m.nome ILIKE ?";

        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + nome + "%");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Musica m = new Musica();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("musica_nome"));
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

