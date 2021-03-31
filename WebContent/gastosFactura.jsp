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
<title>Registro Facturas</title>
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
				}
			%>
		</h3>
		<form action="VerificarFactura.jsp" method="post" enctype="multipart/form-data" >
			<table class="tabla">

				<tr>
					<th colspan="2">
						<h3>Registre Sus Facturas</h3>
					</th>
				</tr>

				<tr>

					<td>Número de la Factura:</td>
					<td><input type="text" name="numFactura"></td>
				</tr>
				<tr>

					<td>RUC de la Factura:</td>
					<td><input type="text" name="ruc"></td>
				</tr>


				<tr>

					<td>Fecha de emisión de la factura:</td>
					<td><input type="date" name="fechaFactura"></td>
				</tr>

				<tr>
					<td>Monto Total de la Factura:</td>
					<td><input type="text" name="totalFactura" placeholder="00.00"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><b><i>Ingrese Valores
								Deducibles en la Factura</i></b></td>

				</tr>

				<tr>
					<td>Alimentación:</td>
					<td><input type="text" name="dedAlim" placeholder="00.00"></td>

				</tr>

				<tr>
					<td>Vivienda:</td>
					<td><input type="text" name="dedViv" placeholder="00.00"></td>

				</tr>

				<tr>
					<td>Vestimenta:</td>
					<td><input type="text" name="dedVest" placeholder="00.00"></td>

				</tr>

				<tr>
					<td>Eduación:</td>
					<td><input type="text" name="dedEduc" placeholder="00.00"></td>

				</tr>

				<tr>
					<td>Salud:</td>
					<td><input type="text" name="dedSalud" placeholder="00.00"></td>

				</tr>

				<tr>

					<td>Imagen de la Factura (Opcional):</td>
					<td><input type="file" name="fotoFact" accept="image/*,.pdf"></td>
				</tr>


				<tr>
					<td colspan="2" align="center"><input type="submit"
						name="btnguardarFactura" value="GuardarFactura"></td>
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