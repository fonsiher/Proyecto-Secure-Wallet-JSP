<%@page import="com.proyecto.utils.Encriptar"%>
<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
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



	<%
		String mensaje = "";
		String login = request.getParameter("txtusuario");
		String clave = request.getParameter("txtcontra");
		clave = Encriptar.encriptar(clave);
		UsuarioLogeado logeado = null;
		try {
			Usuario usuario = new Usuario();
			logeado = usuario.obtenerPorLoginClave(login, clave);
			HttpSession objSesion = request.getSession();
			objSesion.setAttribute("usuarioLogeado", logeado);
			mensaje = "Busqueda completada";
		} catch (Exception ex) {
			mensaje = "Error al consultar";
			ex.printStackTrace();
		}
	%>

	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
		<%
			if (logeado == null) {
		%>

		<jsp:forward page="login.jsp">
			<jsp:param name="error"
				value="Datos incorrectos.<br>Vuelva a intentarlo." />
		</jsp:forward>
		<%
			} else if (logeado.getId_tipofam() == 1) {
		%>
		<center>
			<nav>
				<ul>
					<li><a href="restriccionesGastos.jsp">EDITAR SUS TIPOS DE GASTOS</a></li>
					<li><a href="menuGastos.jsp">INGRESE SUS GASTOS</a></li>
					<li><a href="MenuVer.jsp">VER DATOS DE SUS GASTOS</a></li>
					<li><a href="login.jsp">CERRAR SESIÓN</a></li>

				</ul>
			</nav>
		</center>
		<%
			} else if (logeado.getId_tipofam() == 2) {
		%>

		<center>
			<nav>
				<ul>
					<li><a href="menuEdicion.jsp">EDITAR SUS DATOS</a></li>
					<li><a href="menuGastos.jsp">INGRESE SUS GASTOS</a></li>
					<li><a href="MenuVer.jsp">VER DATOS DE SUS GASTOS</a></li>
					<li><a href="login.jsp">CERRAR SESIÓN</a></li>
				</ul>
			</nav>
		</center>

		<%
			}
		%>


	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="main" align="center">


		<h1 align="center"><%=mensaje%></h1>
		<%
			UsuarioLogeado log = null;
			try {
				HttpSession objSesion = request.getSession();
				log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
			} catch (Exception ex) {

			}

			if (log != null) {
		%>En el sistema:
		<%=log.getApellido()%>
		<%=log.getNombre()%>

		<%
			}
		%>
		<%
			if (logeado == null) {
		%>
		<jsp:forward page="login.jsp">
			<jsp:param name="error"
				value="Datos incorrectos.<br>Vuelva a intentarlo." />
		</jsp:forward>
		<%
			} else if (logeado.getId_tipofam() == 1) {
		%>

		<table style="width: 100%;" cellspacing="1" cellpadding="3" border="0"
			bgcolor="#1E679A">
			<tr>
				<td><font color="#FFFFFF" face="arial, verdana, helvetica"
					align="left"> </font></td>
			</tr>
			<tr>
				<td class="cuerpo">

					<h1>
						Bienvenido a Secure Wallet:
						<%=logeado.getNombre()%>
						<%=logeado.getApellido()%>
					</h1>

					<p align="center">Administrador del Sistema</p>

				</td>

				<td class="cuerpo"><img src="imagenes/administradorHombre.jpg"
					align="right" style="width: 335px; height: 320px;"></td>
			</tr>
		</table>

		<%
			} else if ((logeado.getId_tipofam() == 2)) {
		%>

		<table style="width: 100%;" cellspacing="1" cellpadding="3" border="0"
			bgcolor="#1E679A">
			<tr>
				<td><font color="#FFFFFF" face="arial, verdana, helvetica"
					align="left"> </font></td>
			</tr>
			<tr>
				<td class="cuerpo">

					<h1>
						Bienvenido a Secure Wallet:
						<%=logeado.getNombre()%>
						<%=logeado.getApellido()%>
					</h1>

					<p align="center">Miembro de Familia</p>

				</td>

				<td class="cuerpo"><img src="imagenes/usuarioHombre.png"
					align="right" style="width: 200px; height: 450px;"></td>
			</tr>
		</table>



		<%
			}
		%>




	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>