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
<title>Menú Gastos</title>
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
	<br>
	<br>

	<div class="main" align="center">
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

		<table style="width: 100%;" cellspacing="1" cellpadding="3" border="0"
			bgcolor="#1E679A">

			<tr>
				<th align="center"><h2>Escoja entre las 2 opciones para
						registar sus gastos</h2></th>
			</tr>
			<tr>
				<td><a href=gastosNormales.jsp><h3>Registrar Gastos si
							NO tiene Factura</h3></a> <img src="imagenes/gastosNormales.jpg"
					align="center" style="width: 335px; height: 320px;"></td>

				<td><a href=gastosFactura.jsp><h3>Registrar Gastos CON
							factura</h3></a> <img src="imagenes/factura.jpg" align="center"
					style="width: 335px; height: 320px;"></td>
			</tr>
		</table>
	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>