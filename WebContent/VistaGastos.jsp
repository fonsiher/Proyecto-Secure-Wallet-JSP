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
					<li><a href="editAdmin.jsp">EDITAR SUS DATOS</a></li>
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
		<%
			Gastos gastos = new Gastos();
			String tipogasto = request.getParameter("cmbTipos");
			String fechaGasto = request.getParameter("fechaGasto");
			String[] fech = fechaGasto.split("-");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date fecha = dateFormat.parse(fech[0] + "-" + fech[1] + "-01");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(fecha); // Configuramos la fecha que se recibe
			calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
			Date fecha1 = calendar.getTime(); // Devuelve el objeto Date con los nuevos días añadidos

			String fechaInicio = fech[0] + "-" + fech[1] + "-01";
			DateFormat dateFormat2 = new SimpleDateFormat("dd");
			String fechaFinal = fech[0] + "-" + fech[1] + "-" + dateFormat2.format(fecha1);
			//out.print(fechaFinal);
			int tipo = Integer.parseInt(tipogasto);
			String tabla = gastos.mostrarVista(tipo, fechaInicio, fechaFinal);
		%>

		<div id="tab">
			<%
				out.print(tabla);
			%>
		</div>
		<p>
			<input type="button" value="Create PDF" id="btPrint"
				onclick="createPDF()" />
		</p>
		<script>
			function createPDF() {
				var sTable = document.getElementById('tab').innerHTML;

				var style = "<style>";
				style = style + "table {width: 100%;font: 17px Calibri;}";
				style = style
						+ "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
				style = style + "padding: 2px 3px;text-align: center;}";
				style = style + "</style>";

				// CREATE A WINDOW OBJECT.
				var win = window.open('', '', 'height=700,width=700');

				win.document.write('<html><head>');
				win.document.write('<title>Profile</title>'); // <title> FOR PDF HEADER.
				win.document.write(style); // ADD STYLE INSIDE THE HEAD TAG.
				win.document.write('</head>');
				win.document.write('<body>');
				win.document.write(sTable); // THE TABLE CONTENTS INSIDE THE BODY TAG.
				win.document.write('</body></html>');

				win.document.close(); // CLOSE THE CURRENT WINDOW.

				win.print(); // PRINT THE CONTENTS.
			}
		</script>


	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>