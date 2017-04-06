<%-- 
    Document   : cliente
    Created on : 25/02/2017, 05:33:14 PM
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
        <h1>Venta</h1>
        <a href="EmpleadoServlet?action=registroventa">Registrar</a>
        <a href="VentaServlet?action=historial">Historial</a>
    </body>
</html>
<jsp:include page="footer.jsp"/>