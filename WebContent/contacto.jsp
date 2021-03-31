<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Formulario Contacto</title>
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
	<br>

	<div class="main" align="center">
	 <form action="correoContacto.jsp" method="post">
		<table style="width: 100%;" cellspacing="1" cellpadding="3" border="0"
			bgcolor="#1E679A">
			<tr>
				<td><font color="#FFFFFF" face="arial, verdana, helvetica"
					align="left"> </font></td>
			</tr>
			<tr>
				<td class="cuerpo">
					<table cellspacing="10" cellpadding="10" class="tabla"
						>
						<tr>
							<th colspan="2">
								<h3>Complete el Formulario</h3>
							</th>
						</tr>
						
						<tr>
							<td>Ingrese su Nombre:</td>
							<td><input type="text" name="nombre"></td>
						</tr>
						<tr>

						<tr>
							<td>Ingrese su número telefónico (Celular):</td>
							<td><input type="text" name="telefono"></td>
						</tr>
						<tr>
							<td>Ingrese su correo electrónico personal:</td>
							<td><input type="text" name="correoCont"></td>
						</tr>
						<tr>
							<td colspan=2" align="center">Ingrese Su duda:</td>
							
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="dudaContacto" style="WIDTH: 450px; HEIGHT: 45px"
size=30></td>
							
						</tr>
						
							
						<tr>
							<td colspan="2" align="center">
								<input type="submit"
						value="Enviar" />
							</td>
						</tr>
					</table>
	</form>
				</td>

				<td class="cuerpo"><img src="imagenes/whats-app-gmail.png"
					align="right" style="width: 335px; height: 320px;"></td>
			</tr>
		</table>
	</div>



	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>