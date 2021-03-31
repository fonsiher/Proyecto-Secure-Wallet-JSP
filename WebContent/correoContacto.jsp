<%@page import="com.proyecto.control.*"%>
<%@page import="com.proyecto.utils.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Contacto</title>
</head>
<body>
	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
		<center>
			<nav>
				<ul>
					<li><a href="index.jsp">INICIO</a></li>
					<li><a href="beneficios.jsp">BENEFICIOS</a></li>
					<li><a href="informacion.jsp">INFORMACION</a></li>
					<li><a href="login.jsp">LOGIN</a></li>
					<li><a href="contacto.jsp">CONTÁCTANOS</a></li>
					<li><a href="registro.jsp">REGÍSTRATE</a></li>
			</nav>
		</center>

	</div>
	<br>
	<br>
	<br>

	<div class="main" align="center">
		<h3 align="center">
			<%
				String name = request.getParameter("nombre");
				String numtel = request.getParameter("telefono");
				String correo = request.getParameter("correoCont");
				String duda = request.getParameter("dudaContacto");

				String mensaje = "Gracias por contactar a Secure Wallet " + name
						+ "\n te contestaremos pronto sobre tu duda sobre: " + duda
						+ "\n Saludos Cordiales\n Att: Secure Wallet S.A";

				Email email = new Email();
				boolean envio = email.enviarCorreo("scrwallet@gmail.com", "SecureWallet2020", correo, mensaje,
						"Contacto Secure Wallet");
				String respuesta = "";
				if (envio == true) {
					respuesta = "Gracias. Te contactaremos pronto";
				} else {
					respuesta = "TU COSA NO VALE";
				}

				String imagen = email.addImagen(respuesta);
			%>
		</h3>
		<h3 align="center"><%=respuesta %></h3>
		<p align="center"><%=imagen %></p>
		<p align="center"></p>
		<p align="center"><a href="index.jsp"><h4>Volver a la Pantalla Principal</h4></a></p>

	</div>
	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>