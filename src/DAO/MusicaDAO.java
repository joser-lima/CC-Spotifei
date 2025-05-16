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


/**
 *
 * @author Junior
 */
public class MusicaDAO {
    private Connection conn;
    
    public MusicaDAO(Connection conn){
        this.conn = conn;
    }
    
    public List<Musica> buscarMusica(String nome) throws SQLException{
        List<Musica> lista = new ArrayList<>();
        String sql = "SELECT * FROM musicas WHERE nome ILIKE ?";;
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + nome + "%");
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Musica m = new Musica();
            m.setId(rs.getInt("Id"));
            m.setNome(rs.getString("nome"));
            m.setGenero(rs.getString("genero"));
            lista.add(m);
            }
            
        return lista;
    }
} 

