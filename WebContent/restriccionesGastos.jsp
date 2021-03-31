<%@page import="com.proyecto.control.Tipos_gastos"%>
<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Restricciones</title>
</head>
<body>
	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>
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
		
		<center></center>
	</div>
	<br>
	<br>
	<br>
	<br>

	<div class="main" align="center">
		<h2>Tipos de Gastos Registrados</h2>
		<h4>(5 primeros tipos predefinidos por el SRI)</h4>

		<%
			Tipos_gastos tipos = new Tipos_gastos();
			String listadoDed = tipos.listarTipoDeducibles();
			out.print(listadoDed);
		%>

		<a href=menuPrincipal.jsp><h4>Si no deseas registrar más
				tipos de gastos. De Click Aquí</h4></a>
		<h4>Caso contrario llene la tabla posterior</h4>
		<h3>Aquí puede registrar otros tipos de gastos diferentes</h3>


		<br> <br>

		<iframe src="tablaNuevoTipo.jsp" width="600" height="300"
			scrolling="auto"></iframe>

	</div>

	<table>
		<tr>
			<td><input type="submit" value="De Acuerdo Con los Tipos" /></td>
			<td><a href="registroOtro.jsp"><button>Registrar
						Otros Tipos</button></a></td>

		</tr>
	</table>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>