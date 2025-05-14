/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import model.Usuario;

/**
 *
 * @author Junior
 */
public class UsuarioDAO {
    private Connection conn;
    
    public UsuarioDAO(Connection conn) {
        this.conn = conn;
    }    
    
    public ResultSet consultar(Usuario user) throws SQLException{
        //String sql = "select * from aluno where usuario = '"
                //+ aluno.getUsuario() + "' AND senha = '" 
                //+ aluno.getSenha() + "'";
        String sql = "select * from usuarios where usuario = ? and senha = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, user.getUsuario());
        statement.setString(2, user.getSenha());
        statement.execute();
        ResultSet resultado = statement.getResultSet();
        return resultado;
    }
    
    public void inserir(Usuario user) throws SQLException{
        String sql = "insert into usuarios (usuario, senha) values (?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, user.getUsuario());
        statement.setString(2, user.getSenha());
        statement.execute();
//        conn.close();
    }
        
    
    public void atualizar(Usuario user) throws SQLException{
        String sql = "update usuarios set senha = ? where usuario = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, user.getSenha());
        statement.setString(2, user.getUsuario());
        statement.execute();
        conn.close();
    }
    
    public void remover(Usuario user) throws SQLException{
        String sql = "delete from usuarios where usuario = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, user.getUsuario());
        statement.execute();
        conn.close();
        
    }
        

}
