<%-- 
    Document   : matriculaMostrarAlumnos
    Created on : 15/10/2023, 03:24:24 PM
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
            <h4 class="display-8">Seleccionar Alumno</h4>
            <form method=POST action="/WebSistema/controladorPrincipal">
                <input type=HIDDEN name=accion value="matriculaMostrarAlumnos">
                <input type=HIDDEN name=modo value="busqueda">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr><td>
                                Buscar Alumno: <input name="xalu" value="<c:out value='${nombre}'/>"
                                                      size=60>
                            </td></tr>
                        <tr><td>
                                <select name="xcodAlumno" size="10" class="form-control" id="exampleFormControlSelect2">
                                    <c:forEach items="${arrAlumnos}" var="alumno">
                                        <option value=<c:out value='${alumno.codigo}'/> >
                                        <c:out value='${alumno.nombre}'/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </td></tr>
                        <tr><td>
                                <input type=submit name=boton class="btn btn-primary" value="Buscar">
                                <input type=submit name=boton class="btn btn-dark" value="Registrar">
                            </td></tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>