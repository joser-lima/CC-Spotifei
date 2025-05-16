/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.MusicaDAO;
import model.Musica;
import DAO.Conexao;

import java.sql.*;
import java.util.List;
import javax.swing.JOptionPane;
import view.HomeFrame;


/**
 *
 * @author Junior
 */
public class ControllerMusica {
    private HomeFrame view;

    public ControllerMusica(HomeFrame view) {
        this.view = view;
    }
    
    
    public List<Musica> buscarMusica(String nome){
        List<Musica> lista = null;
        
        try{
            Connection conn = new Conexao().getConnection();
            MusicaDAO dao = new MusicaDAO(conn);
            lista = dao.buscarMusica(nome);                    
        } catch(SQLException e){
            JOptionPane.showMessageDialog(view,
                                                "Musica não encontrada!",
                                                "Aviso",
                                                JOptionPane.INFORMATION_MESSAGE);
        }
        return lista;
    }
}

