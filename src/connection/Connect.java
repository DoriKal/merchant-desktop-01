/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.exceptions.MySQLDataException;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
/**
 *
 * @author Eleazar Fernandez
 */
public class Connect {

    public static Connection Conexion() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String server = "jdbc:mysql://localhost:3306/merchant";
            String user = "root";
            String pass = "1993";
            conn = (Connection) DriverManager.getConnection(server, user, pass);

        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        } catch (MySQLDataException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return conn;
    }

}
