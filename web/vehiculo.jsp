<%-- 
    Document   : vehiculo
    Created on : 26/02/2017, 11:00:05 AM
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
        <h1>Vehiculo</h1>
        <a href="EmpleadoServlet?action=registrovehiculo">Registrar</a>
        <a href="VehiculoServlet?action=buscarvehiculo">Buscar</a>
    </body>
</html>
<jsp:include page="footer.jsp"/>