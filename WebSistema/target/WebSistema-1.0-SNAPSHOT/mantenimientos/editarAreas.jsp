<%-- 
    Document   : editarAreas
    Created on : 14/10/2023, 06:17:10 PM
    Author     : rafo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <input type=HIDDEN name=accion value="GRABAR_AREA">
                <input type=hidden name=operacion value='<c:out value='${operacion}'/>'>
                <input type=hidden name=xcod value="<c:out value='${registro[0]}'/>">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr><th>Codigo: </th>
                            <td><c:out value='${registro[0]}'/> </td> </tr>
                        <tr><th>Nombre: </th>
                            <td><input name=xnom value="<c:out value='${registro[1]}'/>"
                                       size=40></td></tr>
                        <tr><th>Abreviatura: </th>
                            <td><input name=xabr value="<c:out value='${registro[2]}'/>" 
                                       size=15></td></tr>
                        <tr><th>Estado:</th>
                            <td><c:choose>
                                    <c:when test="${registro[3]=='X'}">
                                        <input type=radio name=xest value=A>Activo
                                        <input type=radio name=xest value=I checked>Inactivo
                                    </c:when>
                                    <c:otherwise>
                                        <input type=radio name=xest value=A checked>Activo
                                        <input type=radio name=xest value=I>Inactivo
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

