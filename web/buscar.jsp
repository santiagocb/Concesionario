<%-- 
    Document   : buscar
    Created on : 26/02/2017, 10:51:32 AM
    Author     : santiago
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <h1>Buscar</h1>
        <table class="centered responsive-table highlight bordered">
                <thead>
                <th>Tipo de documento</th>
                <th>Número de documento</th>
                <th>Nombres y Apellidos</th>
                <th>Dirección</th>                
                <th>Teléfono</th>
                <th>Email</th>
                </thead>
                <tbody>
                    <%--allCliente--%>
                        <tr>                                                        
                            <td>${clien.clientePK.tipoId}</td>
                            <td>${clien.clientePK.id}</td>                            
                            <td>${clien.nombre}</td>
                            <td>${clien.direccion}</td>
                            <td>${clien.telefono}</td>
                            <td>${clien.email}</td>
                            <td><a href="ClienteServlet?action=actualizarcliente&id=${clien.clientePK.id}&tipoid=${clien.clientePK.tipoId}">Actualizar</a></td>
                    </tr>                
                </tbody>
            </table>                   
    </body>
</html>
<jsp:include page="footer.jsp"/>
