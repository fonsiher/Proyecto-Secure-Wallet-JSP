<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<%@page import="com.proyecto.control.Tipos_gastos"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Escoger Ver Gasto</title>
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
		<form action="VistaGastos.jsp" method="post">
			<table class="tabla">

				<tr>
					<th colspan="3">
						<h3>Escoga lo que quiere ver</h3>
					</th>
				</tr>

				<tr>
					<td>Fecha de gasto:</td>
					<td><input type="month" name="fechaGasto"></td>
					<td></td>
				</tr>
				<tr>

					<td>Tipo de Gasto:</td>
					<td colspan="3" align="center">

						<h2>
							<%
								Tipos_gastos esp = new Tipos_gastos();
								String especi = esp.mostrarTipos();
								out.print(especi);
							%>

						</h2>

					</td>
				</tr>

				<tr>
					<td colspan="3" align="center"><input type="submit"
						name="btnverGasto" value="Enviar"></td>
				</tr>
				</form>
			</table>
	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>