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
				</ul>
			</nav>
		</center>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
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
				int id_tipo = 0;

				if (log != null) {
					String id = request.getParameter("txtId");
					String txtNombre = request.getParameter("txtNombre");
					String txtApellido = request.getParameter("txtApellido");
					String txtCorreo = request.getParameter("txtCorreo");
					String txtTelefono = request.getParameter("txtTelefono");
					String txtMonto = request.getParameter("txtMonto");
					Persona per = new Persona();
					per.setId_persona(Long.parseLong(id));
					per.setNombre(txtNombre);
					per.setApellido(txtApellido);
					per.setCorreo(txtCorreo);
					per.setNum_telefono(txtTelefono);
					per.setMonto(Double.parseDouble(txtMonto));
					String resultado = per.actualizarPersona();
					String resultado2 = per.actualizarMonto();
					String rfinal ="";
					if(resultado.equals("Persona actualizada con exito")&& resultado2.equals("Monto actualizado con Éxito")){
						 rfinal = "Datos Editados Correctamente";
					}else 
						rfinal="No se pudo Editar";
					
					String img = per.addImagenEUsuario(rfinal);
					
			%>
			Usuario:
			<%=log.getNombre()%>
			<%=log.getApellido()%>
			<br/>
			<h3 align="center"><%=rfinal%></h3>
			<p align="center"><%=img%></p>
			<a href="menuPrincipal.jsp">Regresar al Menú Principal</a>
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


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>