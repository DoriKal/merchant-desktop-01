/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import encapsulation.Usuario;
import com.mysql.jdbc.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;

/**
 *
 * @author Eleazar Fernandez
 */
public class ModelUsuario {

    public static Usuario GetByUsuarioContrasenia(Connection conexion,
            String userName, String userPassword) throws Exception {
        Usuario dataUser = null;
        try {
            CallableStatement statement = (CallableStatement) conexion.prepareCall("{Call sprGetUserPassword(?,?)}");
            statement.setString("userName", userName);
            statement.setString("userPassword", userPassword);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                dataUser = new Usuario(
                        resultSet.getString("usuario"),
                        resultSet.getString("contrasenia"),
                        resultSet.getString("tipo"),
                        resultSet.getString("email"),
                        resultSet.getString("sucursal")
                );
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return dataUser;
    }
}
