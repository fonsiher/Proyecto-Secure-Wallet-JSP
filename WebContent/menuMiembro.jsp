<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Menú Principal</title>
</head>
<body>
	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
		<center>
			<nav>
				<ul>
					<li><a href="editNormal.jsp">EDITAR SUS DATOS</a></li>
					<li><a href="menuGastos.jsp">INGRESE SUS GASTOS</a></li>
					<li><a href="informacion.jsp">VER DATOS DE SUS GASTOS</a></li>
				</ul>
			</nav>
		</center>
	</div>
	<br>
	<br>
	<br>

	<div class="main" align="center">
		
		<table style="width: 100%;" cellspacing="1" cellpadding="3" border="0"
			bgcolor="#1E679A">
			<tr>
				<td><font color="#FFFFFF" face="arial, verdana, helvetica"
					align="left"> </font></td>
			</tr>
			<tr>
				<td class="cuerpo">

					<h1>Bienvenido a Secure Wallet: %Nombre</h1>
					
					<p align="center">Integrante de Familia</p>

				</td>

				<td class="cuerpo"><img src="imagenes/usuarioMujer.png" align="right"
					style="width: 225px; height: 550px;"></td>
			</tr>
		</table>
	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>