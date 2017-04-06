<%-- 
    Document   : index
    Created on : 25/02/2017, 01:14:05 PM
    Author     : santiago
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="headerI.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>     
    <body>        
        <c:if test="${param.error==1}">
            <font color="red">Usuario Invalido. Intentelo de nuevo</font>
        </c:if>         
        <div class="container well">

            <div align="center">
                <h1> Ingresar</h1>                
                <form action="EmpleadoServlet?action=empleado" method="post">
                    <div class ="row">                        
                        <div class ="col s3 offset-s1"><span class ="flow text">
                                <label><h5>Username:</h5></label></span>                                                            
                        </div> 
                        <div class ="col s4">                                                                                      
                            <input type="text" placeholder="Nombre de usuario" name="username" required=""/>                                                             
                        </div>
                    </div>
                    <div class="row">
                        <div class ="col s3 offset-s1"><span class ="flow text">                            
                                <label><h5>Password:</h5></label></span>
                        </div>
                        <div class ="col s4">
                            <input type="password" placeholder="Contraseña" name="password" required=""/> 
                        </div>
                    </div>                                                                                              
                    <div class="break"></div>
                    <div class="row"></div>
                    <div class="row">
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="action" value="Ingresar" onclick="return theValidator()">INGRESAR
                            <i class="material-icons right">send</i>
                        </button>                                                        
                    </div>
                </form>
            </div>
        </div>
        <div class="container well"></div>            
    </body>
</html>
<jsp:include page="footer.jsp"/>
