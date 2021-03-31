<%@page import="com.proyecto.utils.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="com.proyecto.control.*"%>
<!DOCTYPE html>
<%@page import="com.proyecto.control.Persona"%>
<%@page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Registro Enviado</title>
</head>
<body>
	<div id="cabecera" class="cabecera">
		<img style="width: 280px; height: 150px;" src="imagenes/secure.png"
			align="left">
		<div style="height: 80px;">Secure Wallet</div>

	</div>
	<%
		Persona per = new Persona();

		int id_tipo;
		String name = request.getParameter("nombres");
		String apellido = request.getParameter("apellido");
		String birth = request.getParameter("nacimiento");
		Date nacim = Date.valueOf(birth);
		String tipoFam = request.getParameter("cmbCat");
		if (tipoFam.equals("1")) {
			id_tipo = 1;
		} else
			id_tipo = 2;
		String correo = request.getParameter("correo");
		String contra = request.getParameter("password");
		String docCI = request.getParameter("ci");
		String telefono = request.getParameter("numtel");
		String sMonto = request.getParameter("ganancias");
		double monto = Double.parseDouble(sMonto);
		Persona persona = new Persona(null, name, apellido, nacim, id_tipo, docCI, correo, telefono);
		Usuario us = new Usuario();
		Ingresos ingresos = new Ingresos();

		/*String result2 = user.RegistrarLogin(id_persona);*/
		String result = persona.RegistrarUsuario();//Metodo para guardar persona

		//Buscar id de persona
		Long id_persona = persona.obtenerIdPorDocumento(docCI);
		contra = Encriptar.encriptar(contra);
		Usuario user = new Usuario(id_persona, correo, contra);
		Ingresos ing = new Ingresos(id_persona, monto);

		//Guardar usuario
		String resultUser = user.RegistrarLogin();
		String resultIng = ing.RegistrarGanancias();
		
		String respuesta="";
		if(result.equals(resultUser) && result.equals(resultIng)){
			 respuesta = "Usuario Registrado Correctamente";
		}else {
			respuesta = "Error en el Registro";
		}
			
		
		String imagen = persona.addImagen(respuesta);
		
		String alCorreo = "Gracias por registrarte en Secure Wallet " + name
				+ " " + apellido
				+ "\n Estamos para ayudarte: \n Cualquier inquietud responda a este correo \n Att: Secure Wallet S.A";
		
		Email email = new Email();
		boolean envio = email.enviarCorreo("scrwallet@gmail.com", "SecureWallet2020", correo, alCorreo,
				"Registrado en Secure Wallet");
		String sms = "";
		if (envio == true) {
			sms = "Gracias. Te contactaremos pronto";
		} else {
			sms = "TU COSA NO VALE";
		}
		
	%>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="main" align="center">
		<h1 align="center"><%=respuesta%></h1>
		
		<table class="tabla">
			<tr>
				<th colspan="2" align="center"><%=imagen%></th>

			</tr>
			<tr>
				<td><a href="login.jsp"><h5>Iniciar Sesión</h5></a></td>
				<td><a href="registro.jsp"><h5>Regresar a la Página de
							Registro</h5></a></td>
			</tr>

		</table>
	</div>

	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>

</body>
</html>