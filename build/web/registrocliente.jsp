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
        <title>JSP Page</title>
    </head>
    <body>             
        <c:if test="${param.error==1}">
            <font color="red">Este cliente ya hace parte de nuestra base de datos</font>
        </c:if>
        <c:if test="${param.valido==1}">
            <font color="green">Se registró exitosamente</font>
        </c:if>
            <c:if test="${param.valido==2}">
            <font color="orange">Debe registrar el cliente primero</font>
        </c:if>
        <h1>Registrar cliente</h1>
        <div align="center">
            <form action="ClienteServlet?action=formcliente" method="post">

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

                    <div class="input-field col s4">
                        <input id="id_cliente" name="id_cliente" type="text" class="validate validator" onkeydown="return validNumber()">
                        <label for="id_cliente">Número de Identificación*</label>
                    </div>
                    <div class="input-field col s4">
                        <input type="text" id="nombre_cliente" name="nombre_cliente" class="validate validator">
                        <label for="nombre_cliente">Nombres y Apellidos*</label>
                    </div>                
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="direccion_cliente" name="direccion_cliente" class="validate">
                        <label for="direccion_cliente">Dirección</label>
                    </div>
                    <div class="input-field col s4">
                        <input type="text" id="telefono_cliente" name="telefono_cliente" class="validate">
                        <label for="telefono_cliente">Teléfono</label>
                    </div>
                    <div class="input-field col s4">
                        <input type="email" id="email_cliente" name="email_cliente" class="validate">
                        <label for="email_cliente">E-Mail</label>
                    </div>                
                </div>

                <div class="row right-align">
                    <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Registrar" onclick="return theValidator()">REGISTRAR
                        <i class="material-icons right">send</i>
                    </button> 
                </div> 
            </form>
        </div>            
    </body>
</html>
<jsp:include page="footer.jsp"/>