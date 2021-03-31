<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Menu Ver Gastos</title>
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
					<li><a href="login.jsp">CERRAR SESI�N</a></li>
				</ul>
			</nav>
		</center>
	</div>
	<br>
	<br>


	<div class="main" align="center">
		<br>
		<h3 align="left">
			<%
				UsuarioLogeado log = null;
				try {
					HttpSession objSesion = request.getSession();
					log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
				} catch (Exception ex) {

				}

				if (log != null) {
			%>
			Usuario:
			<%=log.getNombre()%>
			<%=log.getApellido()%>


			<%
				} else {
			%>

			<jsp:forward page="login.jsp">
				<jsp:param name="error" value="Sesi�n Cerrada.<br>Ingrese de Nuevo" />
			</jsp:forward>

			<%
				}
			%>
		</h3>

		<br>

		<p align="right">
			<a href="ElegirVer.jsp"><h2 align="center">Ver Gastos por
					Fecha y Tipo de Gasto</h2></a>
		</p>
		<p>
			<img style="width: 280px; height: 150px;"
				src="imagenes/calendario.jpg" align="center">
		</p>
		<p></p>
		<p>
			<a href="VerTodo.jsp"><h2 align="center">Ver Gastos
					Generales</h2></a>
		</p>
		<p>
			<img style="width: 280px; height: 150px;"
				src="imagenes/gastosGenerales.jpg" align="center">
		</p>



	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hern�ndez - �lvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>