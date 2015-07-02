/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import connection.Connect;
import models.ModelUsuario;
import encapsulation.Usuario;
import com.mysql.jdbc.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Eleazar Fernandez
 */
public class ControllerLogin {

    public static boolean Login(String usuario, String contrasenia) throws SQLException {
        boolean existeUsuario = false;
        Connection conexion = Connect.Conexion();
        try {
            conexion.setAutoCommit(false);
            Usuario user = ModelUsuario.GetByUsuarioContrasenia(conexion, usuario, contrasenia);
            if (user != null) {
                existeUsuario = true;
            }
            conexion.commit();
        } catch (Exception ex) {
            conexion.rollback();
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return existeUsuario;
    }
}
