<%@page import="com.proyecto.control.Tipo_familiar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Registro</title>
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
		
		function mostrarConfirmacion() {
			
			var tipo2 = document.getElementById("confpass");
			 if (tipo2.type == "password") {
				tipo2.type = "text";

			} else {
				
				tipo2.type = "password"
			}
		}
	</script>

	<script>
	$('#confpass').keyup(function () {
		 
	    var text_2 = $('password').val();
	    var text_3 = $('confpass').val();
	 
	    if (text_2 === text_3) {
	        $('#confpass').text("").css("background-color", "#00cc66");
	    } else {
	        $('#confpass').text("error no coinciden").css("background-color", "#ff6666");
	    }
	    if (text_3 === "") {
	        $('#confpass').text("No se puede dejar en blanco").css("color", "black");
	    }
	 
	});
	</script>

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

	<div class="main" align="center">
		<form action="verificarRegistro.jsp" method="post">

			<table class="tabla">
				<tr>
					<th colspan="3">
						<h3>Regístrese en el Sistema</h3>
					</th>
				</tr>

				<tr>
					<td>Nombre:</td>
					<td><input type="input" name="nombres"></td>
					<td></td>
				</tr>
				<tr>
					<td>Apellido:</td>
					<td><input type="input" name="apellido"></td>
					<td></td>

				</tr>
				<tr>
					<td>Fecha de Nacimiento:</td>
					<td><input type="date" name="nacimiento"></td>
					<td></td>
				</tr>

				<tr>
					<td>Tipo de Familiar:</td>
					<td>

						<h2>
							<%
								Tipo_familiar esp = new Tipo_familiar();
								String especi = esp.consultarCategoria();
								out.print(especi);
							%>

						</h2>

					</td>
					<td></td>
				</tr>

				<tr>
					<td>Número de Documento de Identidad:</td>
					<td><input type="input" name="ci"></td>
					<td></td>
				</tr>
				<tr>
					<td>Correo Electrónico:</td>
					<td><input type="input" name="correo"></td>
					<td></td>
				</tr>

				<tr>
					<td>Contraseña:</td>
					<td><input type="password" id="password" name="password"></td>
					<td>
						<button class="btn btn-primary" type="button"
							onclick="mostrarContrasena()">Mostrar</button>
					</td>


				</tr>
				<tr>
					<td>Confirmar Contraseña:</td>
					<td><input type="password" id="confpass" name="password"></td>
					<td>
						<button class="btn btn-primary" type="button"
							onclick="mostrarConfirmacion()">Mostrar</button>
					</td>

				</tr>

				<tr>
					<td>Número de Teléfono:</td>
					<td><input type="input" name="numtel"></td>
					<td></td>
				</tr>
				
				<tr>
					<td>Ganancias Mensuales:</td>
					<td><input type="input" name="ganancias"></td>
					<td></td>
				</tr>

				<tr>
					<td colspan="3" align="center"><input type="submit"
						value="Registrarse" /></td>
				</tr>
			</table>


		</form>
	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>
