<%-- 
    Document   : editarAlumnos
    Created on : 14/10/2023, 06:15:30 PM
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
        <div class="card" style="width: 50rem;padding: 30px 0px 0px 30px;">
            <h4 class="display-8"><c:out value='${titulo}'/></h4>
            <form name=mod_opcion method=POST action="/WebSistema/controladorPrincipal">
                <input type=HIDDEN name=accion value="GRABAR_ALUMNO">
                <input type=hidden name=operacion value='<c:out value='${operacion}'/>'>
                <input type=hidden name=xcod value="<c:out value='${alumno.codigo}'/>">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr><th>Codigo: </th>
                            <td><c:out value='${alumno.codigo}'/> </td> </tr>
                        <tr><th>Nombre: </th>
                            <td><input name=xnom value="<c:out value='${alumno.nombre}'/>"
                                       size=60></td></tr>
                        <tr><th>Direccion:</th>
                            <td><input name=xdir value="<c:out value='${alumno.direccion}'/>"
                                       size=60></td></tr>
                        <tr><th>Email:</th>
                            <td><input name=xema value="<c:out value='${alumno.email}'/>"
                                       size=60></td></tr>
                        <tr><th>Telefono:</th>
                            <td><input name=xtel value="<c:out value='${alumno.telefono}'/>"
                                       size=30></td></tr>
                        <tr><th>Celular:</th>
                            <td><input name=xcel value="<c:out value='${alumno.celular}'/>"
                                       size=30></td></tr>
                        <tr><th>Sexo</th>
                            <td><c:choose>
                                    <c:when test="${alumno.sexo=='M'}">
                                        <input type=radio name=xsex value=F>Femenino
                                        <input type=radio name=xsex value=M checked>Masculino
                                    </c:when>
                                    <c:otherwise>
                                        <input type=radio name=xsex value=F checked>Femenino
                                        <input type=radio name=xsex value=M>Masculino
                                    </c:otherwise>
                                </c:choose>
                            </td></tr>
                        <tr><th>Fecha Nacimiento:</th>
                            <td><input type="date" dateformat="y M d" name=xfec value="<c:out value='${alumno.fec_nac}'/>"
                                       size=30></td></tr>
                        <tr><th>Estado</th>
                            <td><c:choose>
                                    <c:when test="${alumno.estado=='X'}">
                                        <input type=radio name=xest value=A>Activo
                                        <input type=radio name=xest value=X checked>Inactivo
                                    </c:when>
                                    <c:otherwise>
                                        <input type=radio name=xest value=A checked>Activo
                                        <input type=radio name=xest value=X>Inactivo
                                    </c:otherwise>
                                </c:choose>
                            </td></tr>
                    </tbody>
                </table>
                <input type=submit name=boton class="btn btn-primary" value="GRABAR">
                <input type=submit name=boton class="btn btn-dark" value="CANCELAR">
            </form>
        </div>
    </body>
</html>