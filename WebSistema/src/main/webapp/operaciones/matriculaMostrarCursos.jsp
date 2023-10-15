<%-- 
    Document   : matriculaMostrarCursos
    Created on : 15/10/2023, 03:53:12 PM
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
        <h4 class="display-8">Datos de Matricula</h4>
        <form method=POST action="/WebSistema/controladorPrincipal">
            <input type=HIDDEN name=accion value="matriculaMostrarSubtotal">
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
            </table>
            <h4 class="display-8">Seleccione los cursos</h4>
            <table class="table table-striped table-hover">
                <tr><td>
                Cursos disponibles:
                </td></tr>
                <tr><td>
                <select name="xcodCurso" size="10" class="form-control" id="exampleFormControlSelect2" multiple>
                    <c:forEach items="${arrCursos}" var="curso">
                    <option value=<c:out value='${curso.codigo}'/> >
                        <c:out value='${curso.nombre}'/>
                    </option>
                    </c:forEach>
                </select>
                </td></tr>
            <tr><td>
                <input type=submit name=boton class="btn btn-primary" value="Aceptar">
            </td></tr>
        </form>

    </div>
    </body>
</html>