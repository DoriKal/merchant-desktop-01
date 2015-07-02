package classes;

import javax.swing.JProgressBar;

public class ProgressBar extends Thread {

    JProgressBar progreso;

    public ProgressBar(JProgressBar progreso1) {
        super();
        this.progreso = progreso1;
    }

    @Override
    public void run() {
        int l = 0;
        for (l = 1; l <= 100; l++) {
            progreso.setValue(l);
            pausa(20);
        }

    }

    public void pausa(int mlSeg) {
        try {
            // pausa para el splash
            Thread.sleep(mlSeg);
        } catch (Exception e) { }
    }
}
