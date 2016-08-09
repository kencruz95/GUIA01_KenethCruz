<%-- 
    Document   : Reporte2
    Created on : 08-ago-2016, 22:18:04
    Author     : Orlando Vasquez
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <script type="text/javascript">
           $(document).ready(function () {
               $("#frmPiezas").validate();
           });
    </script>
    
    <script type="text/javascript">
            $(document).ready(function () {   // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
                $("#boton").click(function () {     // Con esto establecemos la acción por defecto de nuestro botón de enviar.
                    if (validaForm()) {                               // Primero validará el formulario.
                        var cursBton = $(this).val();
                        var form = $(this).closest("form");
                        $.ajax({
                            type: "POST",
                            url: form.attr('action'),
                            data: form.serialize() + "&cursBton=" + cursBton,
                            success: function (response) {
                                alert('OK');
                                location.reload();
                            }
                        });
                        event.preventDefault();
                    }
                    else {
                        $("#frmPiezas").submit(function () {
                            return false;
                        });
                    }
                });
            });</script>
    
    <title>MANTENIMIENTO PIEZAS</title>
    
     <!-- Normalize CSS -->
    <link rel="stylesheet" href="css/normalize.css">
    
     <!-- Materialize CSS -->
    <link rel="stylesheet" href="css/materialize.min.css">
    
     <!-- Material Design Iconic Font CSS -->
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    
    <!-- Malihu jQuery custom content scroller CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    
    <!-- Sweet Alert CSS -->
    <link rel="stylesheet" href="css/sweetalert.css">
    
    <!-- MaterialDark CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.validate.js" type="text/javascript"></script>
</head>
<body>
    <!-- Nav Lateral -->
    <section class="NavLateral full-width">
        <div class="NavLateral-FontMenu full-width ShowHideMenu"></div>
        <div class="NavLateral-content full-width">
            <header class="NavLateral-title full-width center-align">
                JAVA WEB <i class="zmdi zmdi-close NavLateral-title-btn ShowHideMenu"></i>
            </header>
            <figure class="full-width NavLateral-logo">
                <img src="assets/img/logo.png" alt="material-logo" class="responsive-img center-box">
                <figcaption class="center-align">Guia de estudio</figcaption>
            </figure> 
            <div class="NavLateral-Nav">
                <ul class="full-width">
                    <li>
                        <a href="index.html" class="waves-effect waves-light"><i class="zmdi zmdi-view-web zmdi-hc-fw"></i> INICIO</a>
                    </li>
                    <li>
                        <a href="Reporte1.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Reporte 1- Visitas</a>
                    </li>
                    <li>
                        <a href="Reporte2.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Reporte 2- Historial</a>
                    </li>
                    <li>
                        <a href="Reporte3.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Reporte 3- Visitas por fecha</a>
                    </li>
                </ul>
            </div>  
        </div>  
    </section>

    <!-- Page content -->
    <section class="ContentPage full-width">
        <!-- Nav Info -->
        <div class="ContentPage-Nav full-width">
            <ul class="full-width">
                <li class="btn-MobileMenu ShowHideMenu"><a href="#" class="tooltipped waves-effect waves-light" data-position="bottom" data-delay="50" data-tooltip="Menu"><i class="zmdi zmdi-more-vert"></i></a></li>
                <li><figure><img src="assets/img/user.png" alt="UserImage"></figure></li>
                <li style="padding:0 5px;">Keneth Cruz</li>
                <li><a href="#" class="tooltipped waves-effect waves-light btn-ExitSystem" data-position="bottom" data-delay="50" data-tooltip="Cerrar sesion"><i class="zmdi zmdi-power"></i></a></li>
                <li><a href="#" class="tooltipped waves-effect waves-light btn-Search" data-position="bottom" data-delay="50" data-tooltip="Buscar"><i class="zmdi zmdi-search"></i></a></li>
               
            </ul>   
        </div>

        <!-- mantenimiento-->

        <div class="container">
            <div class="row">
                <h2 class="center-align">Reporte 2</h2>
                <div class="input-field col s6">
                   
                </div>
                <div class="input-field col s6">
                    <center><h5>${mensAler}</h5></center>
                </div>
                
                
                <br><br>
                <form class="col s12" name="frmPiezas" id="frmPiezas" method="POST" action="PiezasServ">
                    <input type="hidden" name="CodiPiez" value="${CodiPiez}"/>
                    
               
                <div class="row">
                    <div class="input-field col s12">
                        <center>Selecione la persona :</center>
                        <br><br>
                            <select class="browser-default" name="cmbPiez">
                                <!-- jsp:useBean id="beanPiezasCtrl" class="com.sv.udb.controlador.PiezasCtrl" scope="page"/>-->
                               
                                <c:forEach items="${beanPiezasCtrl.consTodo()}" var="fila">
                                    <c:choose>
                                        <c:when test="${fila.codiPiez eq cmbPiez}">
                                            <option name="codi_piez" value="${fila.codiPiez}" selected="">${fila.nombPiez}</option>
                                        </c:when>
                                        <c:otherwise>
                                    <option name="codi_piez" value="${fila.codiPiez}">${fila.nombPiez}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                    </div>
                </div>
                        <br><br><br>
        <!--acciones-->
        <div class="container" style="margin-bottom: 128px;">
            <div class="row">
                
                <div class="col s12 center-align">
                     <input type="submit" class="waves-effect waves-light btn" id="boton"  name="cursBton" value="Generar reporte"/>
                </div>
            </div>
        </div>
                </form>
        
        <!--registros consultados-->
        
            </div>
        </div>
        
        <!--Icon Prefixes-->
        
            
        
        <br><br><br><br><br><br><br>
        <!-- Footer -->
        <footer class="footer-MaterialDark">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        
                    </div>
                    <div class="col l4 offset-l2 s12">
                        
                    </div>
                </div>
            </div>
            <div class="NavLateralDivider"></div>
            <div class="footer-copyright">
                <div class="container center-align">
                    © 2016 Keneth Orlando Vasquez Cruz
                </div>
            </div>
        </footer>
    </section>
    
    <!-- Sweet Alert JS -->
    <script src="js/sweetalert.min.js"></script>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-2.2.0.min.js"><\/script>')</script>
    
    <!-- Materialize JS -->
    <script src="js/materialize.min.js"></script>
    
    <!-- Malihu jQuery custom content scroller JS -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- MaterialDark JS -->
    <script src="js/main.js"></script>
</body>
</html>
