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
        <h1>Buscar Vehículo</h1>
        <table class="centered responsive-table highlight bordered">
                <thead>                
                <th>Placa</th>
                <th>Marca</th>
                <th>Referencia</th>
                <th>Modelo</th>
                <th>Color</th>
                <th>Precio</th>
                <th>Imagen</th> 
                </thead>
                <tbody>                   
                    <tr>                                   
                        <td>${veh.placa}</td>
                        <td>${veh.marca}</td>
                        <td>${veh.referencia}</td>
                        <td>${veh.modelo}</td>
                        <td>${veh.color}</td>
                        <td>${veh.precio}</td>                            
                        <td><img src="/Concesionario/PhotoServlet/${veh.placa}" height="100" width="100"/></td>
                    </tr>                    
                </tbody>
            </table>                        
    </body>
</html>
<jsp:include page="footer.jsp"/>