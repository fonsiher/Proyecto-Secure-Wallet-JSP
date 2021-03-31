
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Vista Gastos</title>
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
				Long id = Long.parseLong(request.getParameter("idpersona"));
				Persona per = new Persona();
				per = per.listarUsuarioId(id);
				if (log != null) {
			%>
			<form action="actualizarPersona.jsp" method="post">
				<table align="center">
					<tr>
						<th colspan="2">Actualizacion tipo de gastos</th>
					</tr>
					<tr>
						<td>Id</td>
						<td><input type="text" name="txtId" readonly="true"
							value="<%=per.getId_persona()%>" /></td>
					</tr>
					<tr>
						<td>Nombre</td>
						<td><input type="text" name="txtNombre"
							value="<%=per.getNombre()%>" /></td>
					</tr>
					<tr>
						<td>Apellido</td>
						<td><input type="text" name="txtApellido"
							value="<%=per.getApellido()%>" /></td>
					</tr>
					<tr>
						<td>Correo</td>
						<td><input type="text" name="txtCorreo" readonly="true"
							value="<%=per.getCorreo()%>" /></td>
					</tr>
					<tr>
						<td>Numero telefono</td>
						<td><input type="text" name="txtTelefono"
							value="<%=per.getNum_telefono()%>" /></td>
					</tr>
					<tr>
						<td>Monto</td>
						<td><input type="text" name="txtMonto"
							value="<%=per.getMonto()%>" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Actualizar" /></td>
					</tr>
				</table>
			</form>
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
	</div>
</body>
</html>