<%-- 
    Document   : header
    Created on : 26/02/2017, 01:40:30 PM
    Author     : juanfer
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>   
        <title>JaidiberS.A</title>
    </head>
    
    <body>        
        <div class="navbar-fixed  cyan lighten-1">
            <nav>
                <div class="nav-wrapper cyan lighten-1">                    
                    <a href="index.jsp" class="brand-logo">Concesionaria Jaidiber S.A</a>                    
                    <ul class="right hide-on-med-and-down">                        
                        <li class="${tabActive1}"><a class= "dropdown-button" data-activates='dropdown1'>Clientes</a></li>
                        <li class="${tabActive2}"><a class= "dropdown-button" data-activates='dropdown2'>Vehículos</a></li>
                        <li class="${tabActive3}"><a class= "dropdown-button" data-activates='dropdown3'>Venta</a></li>                        
                        <li class="${tabActive4}"><a class= "dropdown-button" href="./EmpleadoServlet?action=cerrarsesion" data-activates='dropdown4'>Cerrar sesión</a></li>                        
                        
                        <ul id='dropdown1' class='dropdown-content'>
                            <li><a href="EmpleadoServlet?action=registrocliente">Registrar</a></li>
                            <li><a href="ClienteServlet?action=buscarcliente">Buscar</a></li>                                                       
                        </ul>
                        
                        <ul id='dropdown2' class='dropdown-content'>
                            <li><a href="EmpleadoServlet?action=registrovehiculo">Registrar</a></li>
                            <li><a href="VehiculoServlet?action=buscarvehiculo">Buscar</a></li>                                                       
                        </ul>
                        
                        <ul id='dropdown3' class='dropdown-content'>
                            <li><a href="VentaServlet?action=registroventa">Registrar</a></li>
                            <li><a href="VentaServlet?action=historial">Historial</a></li>                                                       
                        </ul>                                                
                        
                    </ul>                 
                </div>               
            </nav>
        </div>
            <div class="container">
               
