/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.Conexao;
import DAO.CurtidaDAO;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Junior
 */
public class ControllerCurtida {
    
    public static void curtir(int usuarioId, int musicaId){
        try{
            Connection conn = new Conexao().getConnection();
            CurtidaDAO dao = new CurtidaDAO(conn);
            dao.curtir(usuarioId, musicaId);
            conn.close();
        } catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Erro ao curtir: "
                    + e.getMessage());
        }
    }
    
    
    public static void descurtir(int usuarioId, int musicaId){
        try{
        Connection conn = new Conexao().getConnection();
        CurtidaDAO dao = new CurtidaDAO(conn);
        dao.descurtir(usuarioId, musicaId);
        conn.close();
        } catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Erro ao decurtir: " 
                    + e.getMessage());
        }
    }
    
    public static boolean usuarioCurtiu(int usuarioId, int musicaId) {
        try {
            Connection conn = new Conexao().getConnection();
            CurtidaDAO dao = new CurtidaDAO(conn);
            boolean curtiu = dao.usuarioCurtiu(usuarioId, musicaId);
            conn.close();
            return curtiu;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
}        

}
