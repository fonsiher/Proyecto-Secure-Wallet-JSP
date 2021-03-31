<%@page import="com.proyecto.control.Usuario"%>
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
<title>Menú Principal</title>
</head>
<body>
	<%
		UsuarioLogeado log = null;
		try {
			HttpSession objSesion = request.getSession();
			log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
		} catch (Exception ex) {

		}
	%>
	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
		<%
			if (log.getId_tipofam() == 1) {
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
			} else if (log.getId_tipofam() == 2) {
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

	<div class="main" align="center">
		<%
			if (log.getId_tipofam() == 1) {
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
						Actualmente en Sesión: <%=log.getNombre()%> <%=log.getApellido()%>
					</h1>

					<p align="center">Administrador del Sistema</p>

				</td>

				<td class="cuerpo"><img src="imagenes/administradorHombre.jpg"
					align="right" style="width: 335px; height: 320px;"></td>
			</tr>
		</table>

		<%
			} else if ((log.getId_tipofam() == 2)) {
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
						Actualmente en Sesión:
						<%=log.getNombre()%>
						<%=log.getApellido()%>
					</h1>

					<p align="center">Miembro de Familia</p>

				</td>

				<td class="cuerpo"><img src="imagenes/usuarioHombre.png"
					align="right" style="width: 225px; height: 450px;"></td>
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