package controladores;

import modelos.cBaseDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "controladorB", urlPatterns = {"/controladorB"})
public class controladorB extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");

            cBaseDatos objDatos = new cBaseDatos();

            
            if (objDatos.validarUsuario(usuario, contrasena)) {
                
                response.sendRedirect("entorno.html");
            } else {
                
                out.println("<script>alert('Usuario o contraseña incorrectos');</script>");
                request.getRequestDispatcher("/index.html").include(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
