/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package encapsulation;

/**
 *
 * @author Eleazar Fernandez
 */
public class Usuario {
    private String usuario;
    private String contrasenia;
    private String tipo;
    private String email;
    private String sucursal;
    
    public Usuario(){}
    
    public Usuario(String usuario, String contrasenia, String tipo,String email, String sucursal)
    {
        this.usuario=usuario;
        this.contrasenia=contrasenia;
        this.tipo=tipo;
        this.email=email;
        this.sucursal=sucursal;
    }
    
    public void setUsuario(String usuario)
    {
        this.usuario=usuario;
    }
    
    public String getUsuario()
    {
        return this.usuario;
    }

    public void setTipo(String tipo) 
    {
        this.tipo = tipo;
    }

    public String getTipo()
    {
        return tipo;
    }

    public void setContrasenia(String contrasenia)
    {
        this.contrasenia = contrasenia;
    }
   
    public String getContrasenia()
    {
        return this.contrasenia;
    }
    
    public void setEmail(String email)
    {
        this.email=email;
    }
    
    public String getEmail()
    {
        return this.email;
    }
    
    public void setSucursal(String sucursal)
    {
        this.sucursal=sucursal;
    }
    
    public String getSucursal()
    {
        return this.sucursal;
    }
    
}
