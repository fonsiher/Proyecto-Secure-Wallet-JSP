<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<%@page session="true"%>	
	
<title>Ingreso al Sistema</title>
</head>
<body>

	<script>
		function mostrarContrasena() {
			var tipo = document.getElementById("password");
			if (tipo.type == "password") {
				tipo.type = "text";
			} else {
				tipo.type = "password";
			}
		}
	</script>
	<div id="cabecera" class="cabecera">
		<%
			try {
				HttpSession objSesion = request.getSession();
				objSesion.invalidate();
			} catch (Exception ex) {

			}
		%>
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
	<div class="main" align="center">
		<form action="verificacionLogin.jsp" method="post">

			<table class="tabla">
				<tr>
					<th colspan="3">
						<h3>Ingreso Al Sistema</h3>
					</th>
				</tr>
				<tr>
					<td>Correo Electrónico:</td>
					<td><input type="text" name="txtusuario"></td>
					<td></td>
				</tr>
				<tr>
					<td>Contraseña:</td>
					<td><input type="password" id="password" name="txtcontra"></td>
					<td>
						<button class="btn btn-primary" type="button"
							onclick="mostrarContrasena()">Mostrar Contraseña</button>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit"
						value="Login" /></td>
				</tr>
			</table>

			<h3>¿Aún no estás registrado?</h3>
			<h4>
				<a href="registro.jsp">Regístrate Aquí</a>
			</h4>

		</form>
	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>