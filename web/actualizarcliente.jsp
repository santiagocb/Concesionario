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
        <h1>Actualizar cliente</h1>
        <div align="center">
            <form action="ClienteServlet?action=formactualizarcliente" method="post">                                    
                <div class="row"> 
                    
                    <div class="input-field col s3">
                        <input  id="tipo_id_cliente" name="tipo_id_cliente" type="text" class="validate" value="${client.clientePK.tipoId}" disabled="true">
                        <label for="tipo_id_cliente">Tipo de Identificación</label>
                    </div>                        
                    <div class="input-field col s3">
                        <input  id="id_cliente" name="id_cliente" type="text" class="validate" value="${client.clientePK.id}" disabled="true">
                        <label for="id_cliente">Número de Identificación</label>
                    </div>                    
                </div> 

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="nombre_cliente" name="nombre_cliente" class="validate validator2" value="${client.nombre}"> <%--apuntan al modelo--%>
                        <label for="nombre_cliente">Nombres y Apellidos*</label>
                    </div>                    
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="direccion_cliente" name="direccion_cliente" class="validate" value="${client.direccion}">
                        <label for="direccion_cliente">Dirección</label>
                    </div>                    
                </div> 

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="telefono_cliente" name="telefono_cliente" class="validate" value="${client.telefono}">
                        <label for="telefono_cliente">Teléfono</label>
                    </div>                  
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="email" id="emailC" name="email_cliente" class="validate" value="${client.email}">
                        <label for="email_cliente">E-Mail</label>
                    </div>
                </div>                                        

                <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Actualizar" onclick="return confirm('¿Esta seguro que desea actualizar?')">ACTUALIZAR
                    <i class="material-icons right">done</i>
                </button>                       
            </form> 
        </div>    
    </body>
</html>
<jsp:include page="footer.jsp"/>