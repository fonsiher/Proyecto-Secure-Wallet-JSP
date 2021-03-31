<%@page import="com.proyecto.control.*"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Menú Edición</title>
</head>
<body>

	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
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

	</div>
	<br>
	<br>
	<br>

	<div class="main" align="center">
		<h3 align="left">
			<%
				UsuarioLogeado log = null;
				try {
					HttpSession objSesion = request.getSession();
					log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
				} catch (Exception ex) {

				}

				if (log != null) {
			%>Usuario:
			<%=log.getNombre()%>
			<%=log.getApellido()%>


			<%
				} else {
			%>
			<jsp:forward page="login.jsp">
				<jsp:param name="error" value="Sesión Cerrada.<br>Ingrese de Nuevo" />
			</jsp:forward>
			<%
				}
			%>

		</h3>
		<%
			if (log.getId_tipofam() == 1) {
		%>

		<p align="right">
			<a href="EditarUsuarios.jsp"><h2 align="center">Editar Datos
					de los Usuarios</h2></a>
		</p>
		<p>
			<img style="width: 280px; height: 150px;"
				src="imagenes/usuarios.png" align="center">
		</p>
		<p></p>
		<p align="right">
			<a href="EditarTipos.jsp"><h2 align="center">Editar Tipos de
					Gastos</h2></a>
		</p>
		<p>
			<img style="width: 280px; height: 150px;"
				src="imagenes/tipos-de-gastos.jpg" align="center">
		</p>
		<p></p>
		<p align="right">
			<a href="EditarFactura.jsp"><h2 align="center">Editar Datos
					de Factura</h2></a>
		</p>
		<p>
			<img style="width: 280px; height: 150px;"
				src="imagenes/FacturaEdit.jpg" align="center">
		</p>

		<%
			} else if ((log.getId_tipofam() == 2)) {
		%>

		<%
			Persona persona = new Persona();
				String tabla = persona.listarDatosPersona(log.getId_persona());
				out.print(tabla);
		%>
		<p></p>
		<p align="center">
			<a href="menuPrincipal.jsp"><h4>Volver al Menú Principal</h4></a>
		</p>



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