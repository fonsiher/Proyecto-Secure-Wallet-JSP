<%@page import="com.proyecto.utils.Email"%>
<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@page import="com.proyecto.control.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				Gastos gastos = new Gastos();

				UsuarioLogeado log = null;
				try {
					HttpSession objSesion = request.getSession();
					log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
				} catch (Exception ex) {

				}
				int id_tipo = 0;
				Long id_persona = log.getId_persona();
				String fecha_gasto = request.getParameter("fechaGasto");
				Date fecha = Date.valueOf(fecha_gasto);
				String tipoGasto = request.getParameter("cmbTipos");
				Long tipog = Long.parseLong(tipoGasto);
				String descripcion = request.getParameter("desGasto");
				Integer id_factura = null;
				String sMonto = request.getParameter("montoGasto");
				double monto = Double.parseDouble(sMonto);
				Gastos gas = new Gastos(id_persona, tipog.intValue(), descripcion, id_factura, fecha, monto);
				String respuesta = gas.RegistrarGasto();

				Double montoMaximo = gas.obtenerMontoMaximo(tipog);
				Double montoConsumo = gas.obtenerMontoConsumo(tipog);
				String descripcionGasto=gas.obtenerDescripcion(tipog);
				
				if(montoMaximo<montoConsumo){
					Email email= new Email();
					email.enviarCorreo("scrwallet@gmail.com", "SecureWallet2020", log.getLogin(), "Ha excedido el monto maximo deducible en: " +descripcionGasto, "Advertencia sobre paso de gasto");
				}

				String imagen = gas.addImagen(respuesta);

				if (log != null) {
			%>
			Usuario:
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

		<h2 align="center"><%=respuesta%></h2>
		<p align="center"><%=imagen%></p>
		<p align="center">
			<a href="menuGastos.jsp">Registrar Otro Gasto</a>
		</p>
		<a href="menuPrincipal.jsp">Regresar al Menú Principal</a>


	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>