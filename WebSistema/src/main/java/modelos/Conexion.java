/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.sql.*;


public class Conexion {

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String clave = "123456";

    public Connection Conectar() {
        try {
            Class.forName(driver);
            Connection xcon = DriverManager.getConnection(url, usuario, clave);
            return xcon;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    public String generarCodigo(String tabla, String campo) {
        String rpta = "";
        String sql = "select count(*) from " + tabla;
        Connection xcon = this.Conectar();
        try {
            Statement st;
            st = xcon.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            int cant = Integer.parseInt(rs.getString(1).toString());
            if (cant <= 0) {
                rpta = "1";
            } else {
                sql = "select max(" + campo + ") from " + tabla;
                rs = st.executeQuery(sql);
                rs.next();
                cant = Integer.parseInt(rs.getString(1).toString()) + 1;
                rpta = "" + cant;
            }
            xcon.close();
            return rpta;
        } catch (SQLException ex) {
            System.out.println("Error al generar codigo");
            ex.printStackTrace();
        }
        return rpta;
    }

}