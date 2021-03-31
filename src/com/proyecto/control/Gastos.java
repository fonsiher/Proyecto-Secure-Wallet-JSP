package com.proyecto.control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proyecto.conexion.clsConexion;
import com.proyecto.utils.GastoMensual;
import com.proyecto.utils.ResumenGastos;

public class Gastos {
	private Long id_persona;
	private int id_tipogasto;
	private String descripcion;
	private Integer id_factura;
	private java.sql.Date fecha_gasto;
	private double monto;

	public Gastos() {

	}

	public Gastos(Long id_persona, int tipogasto, String descripcion, Integer factura, java.sql.Date fecha_gasto,
			double monto) {
		this.id_persona = id_persona;
		this.id_tipogasto = tipogasto;
		this.descripcion = descripcion;
		this.id_factura = factura;
		this.fecha_gasto = fecha_gasto;
		this.monto = monto;

	}

	public Long getId_persona() {
		return id_persona;
	}

	public void setId_persona(Long id_persona) {
		this.id_persona = id_persona;
	}

	public int getId_tipogasto() {
		return id_tipogasto;
	}

	public void setId_tipogasto(int id_tipogasto) {
		this.id_tipogasto = id_tipogasto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getId_factura() {
		return id_factura;
	}

	public void setId_factura(Integer id_factura) {
		this.id_factura = id_factura;
	}

	public java.sql.Date getFecha_gasto() {
		return fecha_gasto;
	}

	public void setFecha_gasto(java.sql.Date fecha_gasto) {
		this.fecha_gasto = fecha_gasto;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public String RegistrarGasto() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO gastos(id_persona,id_tipogasto,descripcion,fecha_gasto,monto)";
		sql += "VALUES(?,?,?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setLong(1, this.getId_persona());
			pr.setInt(2, this.getId_tipogasto());
			pr.setString(3, this.getDescripcion());
			pr.setDate(4, this.getFecha_gasto());
			pr.setDouble(5, this.getMonto());

			if (pr.executeUpdate() == 1) {
				result = "Gasto guardado con Éxito";

			} else {
				result = "No se pudo guardar el gasto";
			}
		} catch (Exception ex) {
			result = ex.getMessage();
		} finally {
			try {
				pr.close();
				con.getConexion().close();
			} catch (Exception ex) {
				result = ex.getMessage();
			}
		}

		return result;

	}

	public String RegistrarGastoPorFactura() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO gastos(id_persona,id_tipogasto,descripcion,id_factura,fecha_gasto,monto)";
		sql += "VALUES(?,?,?,?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setLong(1, this.getId_persona());
			pr.setInt(2, this.getId_tipogasto());
			pr.setString(3, this.getDescripcion());
			pr.setInt(4, this.getId_factura());
			pr.setDate(5, this.getFecha_gasto());
			pr.setDouble(6, this.getMonto());

			if (pr.executeUpdate() == 1) {
				result = "Gasto guardado con Éxito";

			} else {
				result = "No se pudo guardar el gasto";
			}
		} catch (Exception ex) {
			result = ex.getMessage();
		} finally {
			try {
				pr.close();
				con.getConexion().close();
			} catch (Exception ex) {
				result = ex.getMessage();
			}
		}

		return result;

	}

	public String addImagen(String result) {
		String resp = "";
		if (result.equals("Gasto guardado con Éxito")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 270px; height: 250px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 270px; height: 250px;\">";

		return resp;
	}

	public String mostrarVista(int id_tipogasto, String fechaInicial, String fechaFinal) {
		String tabla = "<table id=\"tblCustomers\" border=1 align=\"center\" class=\"tabla2\"";
		String sql = "select * from reportetotalgastos where codigotipo =" + id_tipogasto + " and fecha_gasto between '"
				+ fechaInicial + "' and '" + fechaFinal + "'";
		ResultSet rs = null;
		tabla += "<tr>" + "<th>Nombre</th>" + "<th>Apellido</th>" + "<th>Código Tipo</th>" + "<th>Tipo de Gasto</th>"
				+ "<th>Monto Gasto</th>" + "<th>Número Factura</th>" + "<th>Total del Factura</th>"
				+ "<th>Fecha de Gasto</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getString(1) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getInt(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(4) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(5) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(6) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(7) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDate(8) + "</pre></td>" + "</tr>";
			}
			tabla += "</table>";

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}
		return tabla;
	}

	public List<ResumenGastos> mostrarVista(int anio) {
		String sql = "select * from montoacumulado where anio = '" + anio + "'";
		ResultSet rs = null;
		List<ResumenGastos> datos = new ArrayList<ResumenGastos>();
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				ResumenGastos rg = new ResumenGastos();
				rg.setTipodegasto(rs.getString(1));
				rg.setMes(rs.getInt(3));
				rg.setMonto(rs.getDouble(4));
				datos.add(rg);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}
		return datos;
	}

	public Double obtenerIngresos() {
		String sql = "select sum(monto) from persona p, ingresos i " + " where p.id_persona = i.id_persona;";
		ResultSet rs = null;
		Double totalIngreso = null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				totalIngreso = rs.getDouble(1);

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}
		return totalIngreso;
	}

	public List<GastoMensual> obtenerGastosMensuales(Integer anio) {
		String sql = "select mes,(sum(sumatoria)) from montoacumulado where anio = " + anio + "			group by mes; ";
		ResultSet rs = null;
		List<GastoMensual> datos = new ArrayList<GastoMensual>();
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				GastoMensual rg = new GastoMensual();
				rg.setMes(rs.getInt(1));
				rg.setValor(rs.getString(2));

				datos.add(rg);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}
		return datos;
	}

	public Double obtenerMontoMaximo(Long id) {
		String sql = "SELECT " + 
				"	  max_gasto " + 
				"	FROM public.tipo_gasto " + 
				"	WHERE " + 
				"	  id_tipogasto ="+id;
		ResultSet rs = null;
		Double totalIngreso=null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				totalIngreso=rs.getDouble(1);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			con.cerrarConexion();
		}
		return totalIngreso;
	}
	public Double obtenerMontoConsumo(Long id) {
		String sql = "SELECT " + 
				"	  sum(monto) " + 
				"	FROM public.gastos " + 
				"	WHERE " + 
				"	  id_tipogasto ="+id;
		ResultSet rs = null;
		Double totalIngreso=null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				totalIngreso=rs.getDouble(1);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			con.cerrarConexion();
		}
		return totalIngreso;
	}
	
	public String obtenerDescripcion(Long id) {
		String sql = "SELECT " + 
				"	  descripcion " + 
				"	FROM public.tipo_gasto " + 
				"	WHERE " + 
				"	  id_tipogasto ="+id;
		ResultSet rs = null;
		String totalIngreso=null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				totalIngreso=rs.getString(1);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			con.cerrarConexion();
		}
		return totalIngreso;
	}
}
