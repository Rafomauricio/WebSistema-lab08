<%-- 
    Document   : matriculaMostrarSubtotal
    Created on : 15/10/2023, 04:00:20 PM
    Author     : rafo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" 
              href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
    <div class="card" style="width: 50rem; padding: 30px 0px 0px 30px;">
        <form method=POST action="/WebSistema/controladorPrincipal">
            <input type=HIDDEN name=accion value="matriculaGrabar">
            <h4 class="display-8">Datos de Alumno</h4>
            <table class="table table-striped table-hover">
                <tr>
                    <th>Codigo</th>
                    <td><input name="xcodAlumno" size="10" 
                          value="<c:out value='${alumno.codigo}'/>" readonly></td>
                    <th>Nombre</th>
                    <td><input name="xnomAlumno" size="50" 
                          value="<c:out value='${alumno.nombre}'/>" readonly></td>
                </tr>
                <tr>
                    <th>Nro Doc</th>
                    <td><input name="xndoc" size="15" 
                               value="<c:out value='${xmatri}'/>" readonly></td>
                </tr>

            </table>
            <h4 class="display-8">Cursos seleccionados</h4>
            <table class="table table-striped table-hover">
                <tr><th>Codigo</th><th>Curso</th><th>Monto</th></tr>
                <c:forEach items="${arrCursos}" var="curso">
                    <tr>
                        <td><input name="xcodCurso" size="5" 
                             value="<c:out value='${curso.codigo}'/>" readonly></td>
                        <td><input name="xnomCurso" size="40" 
                             value="<c:out value='${curso.nombre}'/>" readonly></td>
                        <td><input name="xmonto" size="9" 
                             value="<c:out value='${curso.costo}'/>" ></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="2" align="right"><b>Total:</b></td>
                    <td><input name="xtotal" size="9" 
                         value="<c:out value='${total}'/>" readonly></td>
                </tr>
                <tr><td>
                    <input type=submit name=boton class="btn btn-primary" value="GRABAR">
                </td></tr>
            </table>
        </form>
    </div>
    </body>
</html>