/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.PlaylistDAO;
import DAO.Conexao;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import model.Playlist;
import model.Usuario;

/**
 *
 * @author Junior
 */
public class ControllerPlaylist {
    private Usuario usuarioLogado;

    public ControllerPlaylist(Usuario usuarioLogado) {
        this.usuarioLogado = usuarioLogado;
    }
    
    public void criarPlaylist(String nome){
        try{
            Connection conn = new Conexao().getConnection();
            PlaylistDAO dao = new PlaylistDAO(conn);
            
            Playlist p = new Playlist();
            p.setNome(nome);
            p.setUsuario(usuarioLogado);
            dao.inserir(p);
            
            conn.close();
        } catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Erro ao criar playlist");
        }
    }
    
    public List<Playlist> listarPlaylists(){
        try{
            Connection conn = new Conexao().getConnection();
            PlaylistDAO dao = new PlaylistDAO(conn);
            List<Playlist> listas = dao.listarPorUsuario(usuarioLogado.getId());
            conn.close();
            return listas;
        } catch(SQLException e){
            e.printStackTrace();
            return null;
        }
       
    }
    
    public void editarPlaylist(int id, String novoNome){
        try{
            Connection conn = new Conexao().getConnection();
            PlaylistDAO dao = new PlaylistDAO(conn);
            
            Playlist p = new Playlist();
            p.setId(id);
            p.setNome(novoNome);
            dao.atualizar(p);
            
            conn.close();
        } catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Erro ao editar playlist");
        }
    }
    
    public void excluirPlaylist(int id){
        try{
            Connection conn = new Conexao().getConnection();
            PlaylistDAO dao = new PlaylistDAO(conn);
            dao.excluir(id);
            conn.close();
        } catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Erro ao excluir playlist");
        }
    }
    
}
