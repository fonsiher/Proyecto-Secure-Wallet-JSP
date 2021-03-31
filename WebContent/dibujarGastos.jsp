<%@page import="com.proyecto.utils.GastoMensual"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.proyecto.utils.ListaGastos"%>
<%@page import="com.proyecto.utils.ResumenGastos"%>
<%@page import="java.util.List"%>
<%@page import="com.proyecto.control.Gastos"%>
<%@page import="com.proyecto.control.UsuarioLogeado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK REL=StyleSheet HREF="estilos/estilo.css" TYPE="text/css"
	MEDIA=screen>
<title>Registro Facturas</title>
<script src="chart.js"></script>
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
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<%
		UsuarioLogeado log = null;
		try {
			HttpSession objSesion = request.getSession();
			log = (UsuarioLogeado) objSesion.getAttribute("usuarioLogeado");
		} catch (Exception ex) {

		}
		if (log != null) {
	%>
	Usuario:
	<%=log.getNombre()%>
	<%=log.getApellido()%>

	<script src="chart.js"></script>
	<h3>Detalle de gastos</h3>
	<canvas id="myChart" style="height: 200px !important;"></canvas>
	<h3>Ingresos vs Gastos</h3>
	<canvas id="myChart2" style="height: 200px !important;"></canvas>
	<%
			String meses = "'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'";
	String dibujo = "";
	String dibujo2="";
	List<ListaGastos> gastosDetalle = new ArrayList<>();
	String anio = request.getParameter("txtanio");
	if (anio != null && !anio.isEmpty()) {
		Gastos gastos = new Gastos();
		List<ResumenGastos> resumen = gastos.mostrarVista(Integer.parseInt(anio));
		HashMap<String, String> lisGast = new HashMap<String, String>();
		for (ResumenGastos rg : resumen) {
			lisGast.put(rg.getTipodegasto(), rg.getTipodegasto());
		}
		List<String> detallegastos = new ArrayList<String>(lisGast.values());

		for (String g2 : detallegastos) {
			ListaGastos lg = new ListaGastos();
			lg.setNombreGasto(g2);
			Integer numero1 = (int)(Math.random()*250+1);
			Integer numero2 = (int)(Math.random()*250+1);
			Integer numero3 = (int)(Math.random()*250+1);
			String hexa=Integer.toHexString(numero1)+Integer.toHexString(numero2)+Integer.toHexString(numero3);
			lg.setColor(hexa);
			lg.setValores("");
			for (int i = 1; i <= 12; i++) {
				int x = 0;
				for (ResumenGastos rg : resumen) {
					if (rg.getTipodegasto().equalsIgnoreCase(g2) && i == rg.getMes()) {
						lg.setValores(lg.getValores() + rg.getMonto() + ",");
						x++;
					}
				}
				if (x == 0) {
					lg.setValores(lg.getValores() + "0,");
				}
			}
			lg.setValores(lg.getValores().substring(0, lg.getValores().length() - 1));
			gastosDetalle.add(lg);
		}
		for (ListaGastos gastos2x : gastosDetalle) {
			dibujo = dibujo + "{label : '" + gastos2x.getNombreGasto()
					+ "' ,backgroundColor : '#"+gastos2x.getColor()+"', borderColor : 'yellow',data : [" + gastos2x.getValores()
					+ "]},";
		}
		dibujo = dibujo.substring(0, dibujo.length() - 1);

		
		
		Double ingreso=gastos.obtenerIngresos();
		List<GastoMensual> gastosMensuales=gastos.obtenerGastosMensuales(Integer.parseInt(anio));
		
		ListaGastos totalIngreso = new ListaGastos();
		totalIngreso.setNombreGasto("Ingreso Mensual");
		totalIngreso.setValores("");
		Integer numero1 = (int)(Math.random()*250+1);
		Integer numero2 = (int)(Math.random()*250+1);
		Integer numero3 = (int)(Math.random()*250+1);
		String hexa=Integer.toHexString(numero1)+Integer.toHexString(numero2)+Integer.toHexString(numero3);
		totalIngreso.setColor(hexa);
		
		ListaGastos totalGastoMensual = new ListaGastos();
		totalGastoMensual.setNombreGasto("Gasto Mensual");
		totalGastoMensual.setValores("");
		numero1 = (int)(Math.random()*250+1);
		numero2 = (int)(Math.random()*250+1);
		numero3 = (int)(Math.random()*250+1);
		hexa=Integer.toHexString(numero1)+Integer.toHexString(numero2)+Integer.toHexString(numero3);
		totalGastoMensual.setColor(hexa);
		
		for (int i = 1; i <= 12; i++) {
			int x = 0;
			for (GastoMensual rg : gastosMensuales) {
				if (i == rg.getMes()) {
					totalGastoMensual.setValores(totalGastoMensual.getValores() + rg.getValor() + ",");
					x++;
				}
			}
			if(x==0){
				totalGastoMensual.setValores(totalGastoMensual.getValores() + "0,");
			}
			totalIngreso.setValores(totalIngreso.getValores()+ingreso.toString() + ",");
		}
		totalGastoMensual.setValores(totalGastoMensual.getValores().substring(0, totalGastoMensual.getValores().length() - 1));
		totalIngreso.setValores(totalIngreso.getValores().substring(0, totalIngreso.getValores().length() - 1));
		
		
		List<ListaGastos> gastosDetalle2=new ArrayList<>();
		gastosDetalle2.add(totalIngreso);
		gastosDetalle2.add(totalGastoMensual);
		for (ListaGastos gastos2x : gastosDetalle2) {
			dibujo2 = dibujo2 + "{label : '" + gastos2x.getNombreGasto()
					+ "' ,backgroundColor : '#"+gastos2x.getColor()+"', borderColor : 'yellow',data : [" + gastos2x.getValores()
					+ "]},";
		}
		dibujo2 = dibujo2.substring(0, dibujo2.length() - 1);
	}
	%>
	<script>
		var ctx2 = document.getElementById('myChart');
		var ctx = document.getElementById('myChart').getContext('2d');
		ctx2.height = 120;
		var chart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [
	<%=meses%>
		],
				datasets : [ <%=dibujo%> ]
			},
			options : {
				responsive : true
			}
		});
	</script>
	<script>
		var ctx2 = document.getElementById('myChart2');
		var ctx = document.getElementById('myChart2').getContext('2d');
		ctx2.height = 120;
		var chart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [
	<%=meses%>
		],
				datasets : [ <%=dibujo2%> ]
			},
			options : {
				responsive : true
			}
		});
	</script>
	<%
		} else {
	%>
	<%
		}
	%>
	<p align="center"></p>
	<br/>
	<br/>
	<br/>
	<div id="pie" class="footer">
		C Todos los derechos reservados - Secure Wallet S.A 2020<br /> Hecho
		por: Edwin Hernández - Álvaro Jumbo - Carlos Revelo
	</div>
</body>
</html>