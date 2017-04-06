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
            <font color="red">Este vehiculo ya hace parte de nuestra base de datos</font>
        </c:if>            
        <c:if test="${param.valido==1}">
            <font color="green">Se registró exitosamente</font>
        </c:if>
        <h1>Registrar vehiculo</h1>
        <div align="center">
            <form action="VehiculoServlet?action=formvehiculo" method="post" enctype="multipart/form-data">

                <div class="row">
                    <div class="input-field col s4">
                        <input id="placa" name="placa" type="text" class="validate validator">
                        <label for="placa">Placa*</label>
                    </div>
                </div>
                <div class="row">

                    <div class="input-field col s4">
                        <input type="text" id="marca" name="marca" class="validate validator">
                        <label for="nombre_cliente">Marca*</label>
                    </div>                
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="referencia" name="referencia" class="validate">
                        <label for="referencia">Referencia</label>                       
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="modelo" name="modelo" class="validate">
                        <label for="modelo">Modelo</label>
                    </div> 
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="text" id="color" name="color" class="validate">
                        <label for="color">Color</label>
                    </div> 
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <input type="number" id="precio" name="precio" class="validate">
                        <label for="precio">Precio</label>
                    </div> 
                </div>                

                 <div class="file-field input-field ">
                <div class="btn indigo accent-2">
                    <span>File</span>
                    <input type="file" multiple name="files">
                </div>
                <div class="file-path-wrapper ">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" name="uploadFile">
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