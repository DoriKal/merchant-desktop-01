package views;

import classes.ProgressBar;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;

public class frmPresentation extends javax.swing.JFrame {

    ProgressBar hilo;

    public frmPresentation() {
        initComponents();
        iniciarSplash();
        //Creamos un objeto ProgressBar al cual se le pasa por parámetro la barra de progreso
        hilo = new ProgressBar(progreso);
        //Iniciamos el Hilo
        hilo.start();
        Dimension pantalla = Toolkit.getDefaultToolkit().getScreenSize();
        //obtenemos el tamaño de la ventana  
        Dimension ventana = this.getSize();
        //para centrar la ventana lo hacemos con el siguiente calculo  
        this.setLocation((pantalla.width - ventana.width) / 2, (pantalla.height - ventana.height) / 2);
        //Le damos tamaño y posición a nuestro Frame
        this.setSize(580, 350);
        //Liberamos recursos
        hilo = null;
    }

    private void iniciarSplash() {
        this.getjProgressBar1().setBorderPainted(true);
        this.getjProgressBar1().setForeground(new Color(50, 50, 150, 100));
        this.getjProgressBar1().setStringPainted(true);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        progreso = new javax.swing.JProgressBar();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);

        jPanel1.setLayout(new java.awt.BorderLayout());
        getContentPane().add(jPanel1, java.awt.BorderLayout.PAGE_END);

        jPanel2.setLayout(new java.awt.BorderLayout());

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/PresentationMerchant.png"))); // NOI18N
        jLabel1.setMaximumSize(new java.awt.Dimension(860, 480));
        jLabel1.setMinimumSize(new java.awt.Dimension(860, 480));
        jLabel1.setPreferredSize(new java.awt.Dimension(860, 480));
        jPanel2.add(jLabel1, java.awt.BorderLayout.CENTER);

        progreso.setForeground(new java.awt.Color(255, 204, 204));
        progreso.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                progresoStateChanged(evt);
            }
        });
        jPanel2.add(progreso, java.awt.BorderLayout.PAGE_END);

        getContentPane().add(jPanel2, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

private void progresoStateChanged(javax.swing.event.ChangeEvent evt) {//GEN-FIRST:event_progresoStateChanged
    if (progreso.getValue() == 100) {
        this.dispose();
        //Aqui llamamos al JFrame que queremos que aparezca despues
        frmLogin ini = new frmLogin();
        Dimension pantall = Toolkit.getDefaultToolkit().getScreenSize();
        //obtenemos el tamaño de la ventana  
        Dimension ventan = ini.getSize();
        //para centrar la ventana lo hacemos con el siguiente calculo  
        ini.setLocation((pantall.width - ventan.width) / 2, (pantall.height - ventan.height) / 2);
        ini.setVisible(true);
    }
}//GEN-LAST:event_progresoStateChanged

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JProgressBar progreso;
    // End of variables declaration//GEN-END:variables

    private javax.swing.JProgressBar getjProgressBar1() {
        return progreso;
    }
}
