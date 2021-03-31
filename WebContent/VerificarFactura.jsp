<%@page import="com.proyecto.utils.Email"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.proyecto.control.*"%>
<%@page import="com.proyecto.control.Usuario"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@page import="java.sql.Date"%>
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
				Factura factura = new Factura();
				List<Gastos> gasto = new ArrayList<>();

				UsuarioLogeado log = null;
				try {
					HttpSession objSesion = request.getSession();
					log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
				} catch (Exception ex) {

				}
				Long id_persona = log.getId_persona();
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				// req es la HttpServletRequest que recibimos del formulario.
				// Los items obtenidos serán cada uno de los campos del formulario,
				// tanto campos normales como ficheros subidos.
				List items = upload.parseRequest(request);
				String directorio = request.getRealPath("/");
				String nombreArchivo = null;
				// Se recorren todos los items, que son de tipo FileItem
				for (Object item : items) {
					FileItem uploaded = (FileItem) item;
					// Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
					// subido donde nos interese
					if (!uploaded.isFormField()) {
						// No es campo de formulario, guardamos el fichero en algún sitio
						nombreArchivo = uploaded.getName();
						File fichero = new File(directorio + "/upload/", nombreArchivo);
						if (fichero.exists()) {
							fichero.delete();
						}
						uploaded.write(fichero);
					} else {
						// es un campo de formulario, podemos obtener clave y valor
						String key = uploaded.getFieldName();
						String valor = uploaded.getString();
						if (key.equalsIgnoreCase("numFactura")) {
							factura.setNum_factura(valor);
						}
						if (key.equalsIgnoreCase("fechaFactura")) {
							factura.setFecha_factura(Date.valueOf(valor));
						}
						if (key.equalsIgnoreCase("ruc")) {
							factura.setRuc(valor);
						}
						if (key.equalsIgnoreCase("totalFactura")) {
							factura.setTotal_factura(Double.parseDouble(valor));
						}
						if (key.equalsIgnoreCase("dedAlim")) {
							if (valor != null && !valor.isEmpty()) {
								Gastos alimentacion = new Gastos();
								alimentacion.setDescripcion("Deducible alimentacion");
								alimentacion.setFecha_gasto(factura.getFecha_factura());
								alimentacion.setId_persona(log.getId_persona());
								alimentacion.setId_tipogasto(2);
								alimentacion.setMonto(Double.parseDouble(valor));
								gasto.add(alimentacion);
							}
						}
						if (key.equalsIgnoreCase("dedViv")) {
							if (valor != null && !valor.isEmpty()) {
								Gastos vivienda = new Gastos();
								vivienda.setDescripcion("Deducible Vivienda");
								vivienda.setFecha_gasto(factura.getFecha_factura());
								vivienda.setId_persona(log.getId_persona());
								vivienda.setId_tipogasto(3);
								vivienda.setMonto(Double.parseDouble(valor));
								gasto.add(vivienda);
							}
						}
						if (key.equalsIgnoreCase("dedVest")) {
							if (valor != null && !valor.isEmpty()) {
								Gastos vestimenta = new Gastos();
								vestimenta.setDescripcion("Deducible vestimenta");
								vestimenta.setFecha_gasto(factura.getFecha_factura());
								vestimenta.setId_persona(log.getId_persona());
								vestimenta.setId_tipogasto(4);
								vestimenta.setMonto(Double.parseDouble(valor));
								gasto.add(vestimenta);
							}
						}
						if (key.equalsIgnoreCase("dedEduc")) {
							if (valor != null && !valor.isEmpty()) {
								Gastos educacion = new Gastos();
								educacion.setDescripcion("Deducible educacion");
								educacion.setFecha_gasto(factura.getFecha_factura());
								educacion.setId_persona(log.getId_persona());
								educacion.setId_tipogasto(5);
								educacion.setMonto(Double.parseDouble(valor));
								gasto.add(educacion);
							}
						}
						if (key.equalsIgnoreCase("dedSalud")) {
							if (valor != null && !valor.isEmpty()) {
								Gastos salud = new Gastos();
								salud.setDescripcion("Deducible salud");
								salud.setFecha_gasto(factura.getFecha_factura());
								salud.setId_persona(log.getId_persona());
								salud.setId_tipogasto(6);
								salud.setMonto(Double.parseDouble(valor));
								gasto.add(salud);
							}
						}

					}
				}

				String respuesta = factura.RegistrarFactura(directorio + "/upload", nombreArchivo);
				String imagen = factura.addImagen(respuesta);
				try {
					Long idfactura = factura.obtenerIdDocumento(factura.getRuc(), factura.getFecha_factura(),
							factura.getTotal_factura(), factura.getNum_factura());
					for (Gastos gas : gasto) {
						gas.setId_factura(idfactura.intValue());
						gas.RegistrarGastoPorFactura();
						Long xxs=Long.parseLong(gas.getId_tipogasto()+"");
						Double montoMaximo = gas.obtenerMontoMaximo(xxs);
						Double montoConsumo = gas.obtenerMontoConsumo(xxs);
						String descripcionGasto=gas.obtenerDescripcion(xxs);
						
						if(montoMaximo<montoConsumo){
							Email email= new Email();
							email.enviarCorreo("scrwallet@gmail.com", "SecureWallet2020", log.getLogin(), "Ha excedido el monto maximo deducible en: " +descripcionGasto, "Advertencia sobre paso de gasto");
						}
						
					}
				} catch (Exception ex) {

				}
				if (log != null) {
			%>
			Usuario:
			<%=log.getNombre()%>
			<%=log.getApellido()%>
		</h3>


		<%
			} else {
		%>

		<jsp:forward page="login.jsp">
			<jsp:param name="error" value="Sesión Cerrada.<br>Ingrese de Nuevo" />
		</jsp:forward>

		<%
			}
		%>

		<h2 align="center"><%=respuesta%></h2>
		<p align="center"><%=imagen%></p>
		<p align="center">
			<a href="menuGastos.jsp">Registrar Otro Gasto</a> ;& <a
				href="menuPrincipal.jsp">Regresar al Menú Principal</a>
		</p>
		<p align="center"></p>




	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>

</body>

</html>