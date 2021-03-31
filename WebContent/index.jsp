<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página Principal</title>
<head>
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Página Principal</title>
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
				</ul>
			</nav>
		</center>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="main">

		<div>
			
			<table style="width: 100%;" cellspacing="1" cellpadding="3"
				border="0" bgcolor="#1E679A">
				<tr>
					<td><font color="#FFFFFF" face="arial, verdana, helvetica"
						align="left"> </font></td>
				</tr>
				<tr>
					<td class="cuerpo">


						<h2>¿Quiénes Somos?</h2>
						<p>Secure Wallet es una aplicación web enfocada en la
							contabilidad para el hogar y en la gestión de cuentas personales
							que le permite tener bajo control todos sus ingresos y gastos
							personales con énfasis en tipos de gastos que pueden ser
							establecidos como son vivienda, vestimenta , ocio, alimentación,
							salud entre otros.</p>
						<p>
							Es totalmente compatible con Windows, Mac, iPad, iPhone y
							Android. Y disponible para navegadores Google Chrome, Safari,
							Mozilla Firefox y Opera Mini <br>
						</p>
					</td>
					<td class="cuerpo"><img src="imagenes/imagen.png"
						align="right" style="width: 350px; height: 350px;"></td>
				</tr>

			</table>
		</div>
	</div>
	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>