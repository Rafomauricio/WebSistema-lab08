<%-- 
    Document   : listadoAlumnos
    Created on : 14/10/2023, 06:18:31 PM
    Author     : rafo
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
        <div class="card" style="padding: 30px 0px 0px 30px;">
            <h4 class="display-8">Listado de Alumnos</h4>
            <form method=POST action="/WebSistema/controladorPrincipal">
                <input type=HIDDEN name=accion value="NuevoEliminarAlumno">
                <input type=submit name=boton class="btn btn-primary" value="Nuevo Registro">
                <input type=submit name=boton class="btn btn-dark" value="Eliminar Registros">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Email</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Sexo</th>
                            <th scope="col">Fec-Nac</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${arrAlumnos}" var="alumno">
                        <tr>
                            <td><input type=checkbox name='xcod'
                                       value=<c:out value='${alumno.codigo}'/> </td>
                            <td><c:out value='${alumno.codigo}'/></td>
                        <td><a href="/WebSistema/controladorPrincipal?accion=modificarAlumno&xcod=
                               <c:out value='${alumno.codigo}'/>">
                                <c:out value='${alumno.nombre}' /></a></td>
                        <td><c:out value='${alumno.direccion}'/></td>
                        <td><c:out value='${alumno.email}'/></td>
                        <td><c:out value='${alumno.telefono}'/></td>
                        <td><c:out value='${alumno.celular}'/></td>
                        <td><c:out value='${alumno.sexo}'/></td>
                        <td><c:out value='${alumno.fec_nac}'/></td>
                        <td><c:out value='${alumno.estado}'/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>