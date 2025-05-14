/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.Conexao;
import DAO.UsuarioDAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Usuario;
import view.HomeFrame;
import view.LoginFrame;


/**
 *
 * @author Junior
 */
public class ControllerLogin {
    private LoginFrame view;
    
    public ControllerLogin(LoginFrame view){
        this.view = view;
    }
    
        public void loginUsuario(){
        Usuario user = new Usuario( 
                view.getTxt_usuario_login().getText(),
                view.getTxt_senha_login().getText());
        Conexao conexao = new Conexao();
        try{
            Connection conn = conexao.getConnection();
            UsuarioDAO  dao = new UsuarioDAO(conn);
            ResultSet res = dao.consultar(user);
            if(res.next()){
                JOptionPane.showMessageDialog(view,
                                                "Login efetuado!",
                                                "Aviso",
                                                JOptionPane.INFORMATION_MESSAGE);
                String usuario = res.getString("usuario");
                String senha = res.getString("senha");
                HomeFrame hf = new HomeFrame();
                hf.setVisible(true);
                view.setVisible(false);
                
//                Colocar a home aqui
//                Usuario user2 = new Usuario(nome, usuario, senha);
//                AltExcFrame aec = new AltExcFrame(aluno2);
//                aec.setVisible(true);
//                view.setVisible(false);
            }else{
                JOptionPane.showMessageDialog(view,
                                                "Login não efetuado!",
                                                "Aviso",
                                                JOptionPane.INFORMATION_MESSAGE);
            }
        } catch(SQLException e){
            JOptionPane.showMessageDialog(view,
                                            "Erro de conexão!",
                                            "Aviso",
                                            JOptionPane.INFORMATION_MESSAGE);
        }
    }
}
