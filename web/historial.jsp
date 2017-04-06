<%-- 
    Document   : buscarcliente
    Created on : 26/02/2017, 10:15:44 AM
    Author     : santiago
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>              
        <h1>Historial</h1>                 
        <form action="VentaServlet?action=formventa" method="post">
            <table class="centered responsive-table highlight bordered" >
                <thead>
                <th>Código de la factura</th>
                <th>Placa del vehículo</th>
                <th>ID Vendedor</th>
                <th>ID Cliente</th>
                <th>Tipo de ID</th>
                <th>Fecha de la venta</th>
                <th>Nuevo</th>
                </thead>
                <tbody>
                    <c:forEach items="${ventas}" var="v">
                        <tr>    
                            <td>${v.codigo}</td>                            
                            <td>${v.idVehiculo.placa}</td>
                            <td>${v.idEmpleado.id}</td>
                            <td>${v.cliente.clientePK.id}</td>
                            <td>${v.cliente.clientePK.tipoId}</td>
                            <td>${v.fecha}</td>
                            <td>${v.nuevo}</td>
                            
                            <td><a onclick="return confirm('¿Está seguro?')" href="VentaServlet?action=eliminarventa&codigo=${v.codigo}">Eliminar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>                                     
        </form>
    </body>
</html>
<jsp:include page="footer.jsp"/>