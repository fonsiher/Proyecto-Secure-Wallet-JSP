<%@page import="com.proyecto.control.Tipos_gastos"%>
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
<title>Registro Gastos</title>
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

		<table class="tabla">
			<form action="VerificarGasto.jsp" method="post">
				<tr>
					<th colspan="2">
						<h3>Registre Su Gasto</h3>
					</th>
				</tr>
				<tr>

					<td>Fecha del Gasto:</td>
					<td><input type="date" name="fechaGasto"></td>
				</tr>

				<tr>

					<td>Tipo de Gasto:</td>
					<td>

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
					<td>Descripción del Gasto:</td>
					<td><input type="text" name="desGasto"
						placeholder="Ej: Entradas de Cine"></td>
				</tr>
				<tr>
				<tr>
					<td>Monto Total del Gasto:</td>
					<td><input type="text" name="montoGasto" placeholder="00.00"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						name="btnggasto" value="Guardar Gasto"></td>
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