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
								<li><a href="login.jsp">CERRAR SESI?N</a></li>
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
					String txtDescripcion = request.getParameter("txtDescripcion");
					String txtdeduc = request.getParameter("txtmaxdeduc");
					String txtgasto = request.getParameter("txtmaxgasto");
					String txtEstado = request.getParameter("txtEstado");
					Tipos_gastos tipo = new Tipos_gastos();
					tipo.setId_tipogasto(Long.parseLong(id));
					tipo.setDescripcion(txtDescripcion);
					tipo.setMax_deduc(Double.parseDouble(txtdeduc));
					tipo.setMax_gasto(Double.parseDouble(txtgasto));
					tipo.setEstado(txtEstado);
					String resultado = tipo.actualizarTipo();
					Persona per = new Persona();
					String rfinal ="";
					if(resultado.equals("Actualizado con ?xito")){
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
			<a href="menuPrincipal.jsp">Regresar al Men? Principal</a>
			<%
				} else {
			%>

			<jsp:forward page="login.jsp">
				<jsp:param name="error" value="Sesi?n Cerrada.<br>Ingrese de Nuevo" />
			</jsp:forward>

			<%
				}
			%>
		</h3>
	


	</div>


	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hern?ndez - ?lvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>