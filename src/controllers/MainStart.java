/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import views.frmPresentation;
import java.awt.Dimension;
import java.awt.Toolkit;

/**
 *
 * @author Eleazar Fernandez
 */
public class MainStart {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                frmPresentation prin = new frmPresentation();
                Dimension pantalla = Toolkit.getDefaultToolkit().getScreenSize();
                //obtenemos el tamaño de la ventana  
                Dimension ventana = prin.getSize();
                //para centrar la ventana lo hacemos con el siguiente calculo  
                prin.setLocation((pantalla.width - ventana.width) / 2, (pantalla.height - ventana.height) / 2);
                prin.setVisible(true);

            }
        });
    }

}
