<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.proyecto.control.Tipos_gastos"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Ingresar Tipo</title>
</head>
<body>
	<%
		Tipos_gastos tipos = new Tipos_gastos();
			String name = request.getParameter("nombretipo");
			String deducible = "0";
			double deduc = Double.parseDouble(deducible);
			String Smonto = request.getParameter("montomax");
			double monto = Double.parseDouble(Smonto);
			Tipos_gastos tg = new Tipos_gastos(name,deduc,monto);
			String result = tg.RegistrarTipo();
			String imagen = tg.addImagen(result);
	%>
	
	<h3 align="center"><%=result%></h3>
	<p align="center"><%=imagen%></p>
	<table align="center">
	
	<tr>
	
	<td><a href=tablaNuevoTipo.jsp>Registar Otro Tipo de Gasto</a></td>
	</tr>
	</table>

</body>

</html>