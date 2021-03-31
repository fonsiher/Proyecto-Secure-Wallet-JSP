<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Insert title here</title>
</head>
<body>
	<form action="registroOtro.jsp" method="post">

		<table class="tabla">
			<tr>
				<th colspan="2">
					<h3>Ingreso de Nuevos Tipos de Gastos</h3>
				</th>
			</tr>
			<tr>
				<td>Nombre del Tipo de Gasto:</td>
				<td><input type="text" name="nombretipo" align="left"></td>
			</tr>
			<tr>
				<td>Monto Máximo a Gastar:</td>
				<td><input type="text" name="montomax"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Guardar" /></td>
			</tr>
		</table>


	</form>


</body>
</html>