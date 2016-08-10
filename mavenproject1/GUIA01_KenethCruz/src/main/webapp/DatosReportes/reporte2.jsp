<%-- 
    Document   : report2
    Created on : 08-08-2016, 09:20:27 PM
    Author     : aleso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="com.sv.udb.recursos.*"  %>

<%  
 Connection conexion = new Conexion().getConn();
/*Establecemos la ruta del reporte*/ 
File reportFile = new File(application.getRealPath("Reportes/Reporte2.jasper"));
 
/*Enviamos parámetros porque nuestro reporte los necesita asi que escriba 
y seguiremos el formato del método runReportToPdf*/ 
/*Con Map y el HaspMap nos servira para crear los paramentros*/
Map parameters = new HashMap();
/*Capturamos el valor de nuestra formulario que es el codigo del cliente que es un
varchar(5), lo almacenamos en una String*/
String codiPers = request.getParameter("cmbPersona");
/*Digitamos la siguiente linea de codigo entre parentesis ira el parametro que agregamos en nuestro reporte
llamado $P{CODIGO}, pero solo se escribira "CODIGO", el String que capturamos lo colocamos, en este caso el 
reporte solo nos pide un parametro*/
parameters.put("CODIGO", codiPers); 
/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
/*Indicamos que la respuesta va a ser en formato PDF*/ 
response.setContentType("application/pdf");
response.setContentLength(bytes.length); 
ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/ 
ouputStream.flush(); 
ouputStream.close();
            
%>
