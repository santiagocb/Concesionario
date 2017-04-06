<%-- 
    Document   : registrocliente
    Created on : 25/02/2017, 05:35:03 PM
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
        <c:if test="${param.valido==1}">
            <font color="green">Se registró exitosamente</font>
        </c:if>
        <h1>VENTA</h1>

        <div align="center">
            <form action="VentaServlet?action=formventa" method="post">                               
                <div class="row">                      
                    <div class="input-field col s4">
                        <select id="placa" name="placa" class="validator">
                            <option value="" disabled selected>Placa vehículo*</option>
                            <c:forEach var="a" items="${listaVeh}">
                                <option>${a.placa}</option>                              
                            </c:forEach> 
                        </select>
                    </div>                                  
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <select id="tipo_id_cliente" name="tipo_id_cliente" class="validator">
                            <option value="" disabled selected>Tipo de identificación*</option>
                            <option value="Cédula">Cédula</option>
                            <option value="C. Extranjería">C. Extranjería</option>
                            <option value="NIT">NIT</option>
                            <option value="Pasaporte">Pasaporte</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input id="id_cliente" name="id_cliente" type="text" class="validate validator" onkeydown="return validNumber()">
                        <label for="id_cliente">Número de Identificación*</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="id_empleado" name="id_empleado" class="validate validator" value=" ${emple.id}" disabled="true">
                        <label for="id_empleado">Identificación Empleado*</label>                       
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="fecha" name="fecha" class="validate">
                        <label for="fecha">DD/MM/AAAA</label>
                    </div> 
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <select id="nuevo" name="nuevo" class="validator">
                            <option value="" disabled selected>Nuevo*</option>
                            <option value="true">Si</option>
                            <option value="false">No</option>                            
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="row right-align">
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Registrar" onclick="return theValidator()">REGISTRAR
                            <i class="material-icons right">send</i>
                        </button> 
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
<jsp:include page="footer.jsp"/>