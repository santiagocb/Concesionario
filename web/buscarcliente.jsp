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
        <h1>Buscar cliente</h1>
        <form action="ClienteServlet?action=buscar" method="post">
            <div class="row">
                <br>                
                <div class="input-field col s4">
                    <select id="tipo_id_cliente" name="tipo_id_cliente" class="validator">
                        <option value="" disabled selected>Tipo de identificación*</option>
                        <option value="Cédula">Cédula</option>
                            <option value="C. Extranjería">C. Extranjería</option>
                            <option value="NIT">NIT</option>
                            <option value="Pasaporte">Pasaporte</option>
                    </select>
                </div>
                
                <div class="input-field col s3">
                    <input ${disabled} id="id_cliente" name="id_cliente" type="text" class="validate" value="${id_cliente}" onkeydown="return validNumber()">
                    <label for="id_cliente">Número de Identificación</label>
                </div>
                <br>
                <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Buscar">BUSCAR
                    <i class="material-icons right">search</i>
                </button>

                <c:if test="${param.error==1}">
                    <font color="red">Este cliente no existe</font>
                </c:if>                
            </div> 
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
                    <c:forEach items="${clientes}" var="c"> <%--allCliente--%>
                        <tr>                                                        
                            <td>${c.clientePK.tipoId}</td>
                            <td>${c.clientePK.id}</td>                            
                            <td>${c.nombre}</td>
                            <td>${c.direccion}</td>
                            <td>${c.telefono}</td>
                            <td>${c.email}</td>
                            <td><a href="ClienteServlet?action=actualizarcliente&id=${c.clientePK.id}&tipoid=${c.clientePK.tipoId}">Actualizar</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>                                
        </form>
    </body>
</html>
<jsp:include page="footer.jsp"/>