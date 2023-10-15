/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.sql.*;
import java.util.*;

public class cBaseDatos {

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String clave = "123456";

    private Connection Conectar() {
        try {
            Class.forName(driver);
            Connection xcon = DriverManager.getConnection(url, usuario, clave);
            return xcon;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    public boolean validarUsuario(String xnom, String xcla) {
        try {
            Connection xcon = this.Conectar();
            String sql = "SELECT COUNT(*) FROM usuarios_s WHERE nombre=? AND contrasena=?";
            PreparedStatement ps = xcon.prepareStatement(sql);
            ps.setString(1, xnom);
            ps.setString(2, xcla);
            ResultSet rs = ps.executeQuery();

            rs.next();
            int cantidad = rs.getInt(1);

            xcon.close();

            return cantidad > 0;
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

        return false;
    }

    private Vector ResultSetToVector(ResultSet rs) throws SQLException {
        Vector vRows = new Vector();
        while (rs.next()) {
            Vector vCol = new Vector();
            int nroFields = rs.getMetaData().getColumnCount();
            for (int i = 1; i <= nroFields; i++) {
                String strTmp = rs.getString(i);
                vCol.add(strTmp);
            }
            vRows.add(vCol);
        }
        return vRows;
    }

    public Vector getAreas() {
        Vector vRet = null;
        try {
            String sql = "select codigo,nombre,abreviatura,estado from areas2 order by codigo";
            Connection xcon = this.Conectar();
            Statement stm = xcon.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            vRet = ResultSetToVector(rs);
            rs.close();
            stm.close();
            xcon.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vRet;
    }

    protected String generarCodigo(String tabla, String campo) throws SQLException {
        String rpta = "";
        String sql = "select count(*) from " + tabla;
        Connection xcon = this.Conectar();
        Statement st = xcon.createStatement();
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
    }

    public void grabarNuevaArea(String[] datos) throws SQLException {
        String xcod = this.generarCodigo("areas2", "codigo");
        String xnom = datos[0];
        String xabr = datos[1];
        String xest = datos[2];
        String sql = "insert into areas2 (codigo,nombre,abreviatura,estado) values (?,?,?,?) ";
        Connection xcon = this.Conectar();
        PreparedStatement ps = xcon.prepareStatement(sql);
        ps.setString(1, xcod);
        ps.setString(2, xnom);
        ps.setString(3, xabr);
        ps.setString(4, xest);
        ps.executeUpdate();
        xcon.close();
    }

    public Vector buscarArea(String pCodigo) throws SQLException {
        String sql = "select codigo, nombre, abreviatura, estado "
                + "from areas2 where codigo=?";
        Connection xcon = this.Conectar();
        PreparedStatement ps = xcon.prepareStatement(sql);
        ps.setString(1, pCodigo);
        ResultSet rs = ps.executeQuery();
        Vector vRet = ResultSetToVector(rs);
        rs.close();
        ps.close();
        xcon.close();
        Vector fila = (Vector) vRet.get(0);
        return fila;
    }

    public void modificarArea(String[] datos) throws SQLException {
        String xcod = datos[0];
        String xnom = datos[1];
        String xabr = datos[2];
        String xest = datos[3];
        String sql = "update areas2 set nombre=?, abreviatura=?, estado=? where codigo=? ";
        Connection xcon = this.Conectar();
        PreparedStatement ps = xcon.prepareStatement(sql);
        ps.setString(1, xnom);
        ps.setString(2, xabr);
        ps.setString(3, xest);
        ps.setString(4, xcod);
        ps.executeUpdate();
        xcon.close();
    }

    public void eliminarAreas(String[] datos) throws SQLException {
        boolean inicio;
        if (datos.length <= 0) {
            return;
        }
        String sql = "DELETE FROM areas2 WHERE codigo in ( ";
        inicio = true;
        for (int xc = 0; xc < datos.length; xc++) {
            if (inicio) {
                sql += "?";
            } else {
                sql += ",?";
            }
            inicio = false;
        }
        sql += ")";
        Connection xcon = this.Conectar();
        PreparedStatement ps = xcon.prepareStatement(sql);
        for (int xc = 0; xc < datos.length; xc++) {
            ps.setString(xc + 1, datos[xc]);
        }
        ps.executeUpdate();
        xcon.close();
    }

}
