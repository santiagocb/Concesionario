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
        <h1>Cliente</h1>
        <a href="EmpleadoServlet?action=registrocliente">Registrar</a>
        <a href="ClienteServlet?action=buscarcliente">Buscar</a>
    </body>
</html>
    <jsp:include page="footer.jsp"/>