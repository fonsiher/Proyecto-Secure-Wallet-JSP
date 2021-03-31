package com.proyecto.control;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proyecto.conexion.clsConexion;

public class Factura {
	private Long id;

	private String ruc;
	private java.sql.Date fecha_factura;
	private double total_factura;
	private String num_factura;
	private File imagen;

	public Factura() {

	}

	public Factura(String ruc, java.sql.Date fecha_factura, double total_factura, String num_factura) {
		this.ruc = ruc;
		this.fecha_factura = fecha_factura;
		this.total_factura = total_factura;
		this.num_factura = num_factura;

	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public java.sql.Date getFecha_factura() {
		return fecha_factura;
	}

	public void setFecha_factura(java.sql.Date fecha_factura) {
		this.fecha_factura = fecha_factura;
	}

	public double getTotal_factura() {
		return total_factura;
	}

	public void setTotal_factura(double total_factura) {
		this.total_factura = total_factura;
	}

	public String getNum_factura() {
		return num_factura;
	}

	public void setNum_factura(String num_factura) {
		this.num_factura = num_factura;
	}

	public File getImagen() {
		return imagen;
	}

	public void setImagen(File imagen) {
		this.imagen = imagen;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*
	 * File fichero = new File(dirArchivo); FileInputStream streamEntrada = new
	 * FileInputStream(fichero); pr.setBinaryStream(7,
	 * streamEntrada,(int)fichero.length());
	 */

	public String RegistrarFactura(String directorio, String imagen) {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO factura(ruc,fecha_factura,total_factura,numero_factura,imagen)";
		sql += "VALUES(?,?,?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, this.getRuc());
			pr.setDate(2, this.getFecha_factura());
			pr.setDouble(3, this.getTotal_factura());
			pr.setString(4, this.getNum_factura());

			File fichero = new File(directorio + "/" + imagen);

			FileInputStream streamEntrada = new FileInputStream(fichero);
			pr.setBinaryStream(5, streamEntrada, (int) fichero.length());

			if (pr.executeUpdate() == 1) {
				result = "Factura guardada con Éxito";
			} else {
				result = "No se pudo insertar la factura";
			}

		} catch (Exception ex) {
			result = ex.getMessage();
			ex.printStackTrace();
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

	public Long obtenerIdDocumento(String ruc, Date fecha, double total, String numeroFactura) {
		StringBuilder sql = new StringBuilder();

		sql.append(" SELECT id_factura ");
		sql.append(" 	FROM public.factura ");
		sql.append(" where  ");
		sql.append("   ruc = '".concat(ruc).concat("'  "));
		sql.append("   and fecha_factura = '".concat(fecha.toString()).concat("' "));
		sql.append("   and total_factura = ".concat(total + "").concat(" "));
		sql.append("   and numero_factura = '".concat(numeroFactura).concat("' "));
		sql.append(" limit 1; ");
		ResultSet rs = null;
		clsConexion con = new clsConexion();
		Long id = null;
		try {
			rs = con.Consulta(sql.toString());
			if (rs != null) {
				while (rs.next()) {
					id = rs.getLong(1);
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}
		return id;
	}

	public String addImagen(String result) {
		String resp = "";
		if (result.equals("Factura guardada con Éxito")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 270px; height: 250px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 270px; height: 250px;\">";

		return resp;
	}

	public String listarDatosFacturas() {
		String tabla = "<table border=1 align=\"center\" class=\"tabla2\"";
		String sql = "select ruc,fecha_factura,total_factura,numero_factura,id_factura from factura";
		ResultSet rs = null;
		tabla += "<tr>" + "<th>RUC</th>" + "<th>Fecha de la Factura</th>" + "<th>Total de la Factura</th>"
				+ "<th>Número de la Factura</th>" + "<th>Elimimar</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getString(1) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDate(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(4) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\"><a href='eliminarFactura.jsp?idfactura="
						+ rs.getString(5) + "'>eliminar</a></pre></td>" + "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return tabla;
	}

	public String eliminarFactura(Long id) {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "delete from factura where id_factura = " + id.toString();
		try {
			pr = con.getConexion().prepareStatement(sql);
			if (pr.executeUpdate() == 1) {
				result = "Factura eliminada con Éxito";
			} else {
				result = "No se pudo eliminar la factura";
			}

		} catch (Exception ex) {
			result = ex.getMessage();
			ex.printStackTrace();
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

}
