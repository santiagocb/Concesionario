<%-- 
    Document   : buscarcliente
    Created on : 26/02/2017, 10:15:44 AM
    Author     : santiago
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>        
        <h1>Buscar Vehículo</h1>                        
        <form action="VehiculoServlet?action=buscar" method="post">
            <div class="row">
                <br>
                <div class="input-field col s3">
                    <input ${disabled} id="placa" name="placa" type="text" class="validate" value="${placa}" onkeydown="return validNumber()">
                    <label for="placa">Placa</label>
                </div>  
                <div class="input-field col s3">
                    <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Buscar">BUSCAR
                        <i class="material-icons right">search</i>
                    </button>
                </div>
            </div>
            
            <c:if test="${param.error==1}">
                <font color="red">Este vehiculo no esta en nuestra base de datos</font>
            </c:if>

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
                    <c:forEach items="${vehiculos}" var="c"> <%--allCliente--%>
                        <tr>                                   
                            <td>${c.placa}</td>
                            <td>${c.marca}</td>
                            <td>${c.referencia}</td>
                            <td>${c.modelo}</td>
                            <td>${c.color}</td>
                            <td>${c.precio}</td>                            
                            <td><img src="/Concesionario/PhotoServlet/${c.placa}" height="100" width="100"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>                                 
        </form>
    </body>
</html>
<jsp:include page="footer.jsp"/>