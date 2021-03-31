package com.proyecto.control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proyecto.conexion.clsConexion;

public class Tipos_gastos {

	private Long id_tipogasto;
	private String descripcion;
	private Double max_gasto;
	private String estado;

	public Long getId_tipogasto() {
		return id_tipogasto;
	}

	public void setId_tipogasto(Long id_tipogasto) {
		this.id_tipogasto = id_tipogasto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Double getMax_gasto() {
		return max_gasto;
	}

	public void setMax_gasto(Double max_gasto) {
		this.max_gasto = max_gasto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	String nombre_gasto;
	double max_deduc;
	double valor_maximo;

	public Tipos_gastos(String nombre_gasto, double max_deduc, double valor_maximo) {
		super();

		this.nombre_gasto = nombre_gasto;
		this.max_deduc = max_deduc;
		this.valor_maximo = valor_maximo;
	}

	public Tipos_gastos() {
		super();
	}

	public String getNombre_gasto() {
		return nombre_gasto;
	}

	public void setNombre_gasto(String nombre_gasto) {
		this.nombre_gasto = nombre_gasto;
	}

	public double getMax_deduc() {
		return max_deduc;
	}

	public void setMax_deduc(double max_deduc) {
		this.max_deduc = max_deduc;
	}

	public double getValor_maximo() {
		return valor_maximo;
	}

	public void setValor_maximo(double valor_maximo) {
		this.valor_maximo = valor_maximo;
	}

	/*
	 * public String consultarCategoria(String cod) { String tabla =
	 * "<table border=1 align=\"center\""; String sql =
	 * "Select id_pel,nombre_pel,duracion_pel,sala_pel from public.tb_pelicula where id_cat="
	 * + cod + ""; ResultSet rs = null; tabla += "<tr>" + "<th>Id Película</th>" +
	 * "<th>Nombre</th>" + "<th>Duracion</th>" + "<th>Sala</th>" + "</tr>";
	 * clsConexion con = new clsConexion(); try { rs = con.Consulta(sql); while
	 * (rs.next()) { tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" +
	 * rs.getInt(1) + "</pre></td>" + "<td><pre style=\"text-aling:center\">" +
	 * rs.getString(2) + "</pre></td>" + "<td><pre style=\"text-aling:center\">" +
	 * rs.getInt(3) + "</pre></td>" + "<td><pre style=\"text-aling:center\">" +
	 * rs.getInt(4) + "</pre></td>" + "</tr>"; } tabla += "</table>"; } catch
	 * (SQLException e) { System.out.println(e.getMessage()); } return tabla; }
	 */

	public String listarTipoDeducibles() {
		String tabla = "<table border=1 align=\"center\" class=\"tabla2\"";
		String sql = "Select id_tipogasto,descripcion,max_deduc,max_gasto from public.tipo_gasto";
		ResultSet rs = null;
		tabla += "<tr>" + "<th>Número del Tipo</th>" + "<th>Nombre del Tipo de Gasto</th>"
				+ "<th>Valor Máximo Deducible</th>" + "<th>Valor Máximo a Gastar</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getInt(1) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(4) + "</pre></td>" + "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return tabla;
	}

	public String listarTipos() {
		String tabla = "<table border=1 align=\"center\" class=\"tabla2\"";
		String sql = "select descripcion,max_gasto, estado,id_tipogasto from tipo_gasto\r\n" + "where id_tipogasto >4";
		ResultSet rs = null;
		tabla += "<tr>" + "<th>Tipo de Gasto</th>" + "<th>Máximo a Gastar</th>" + "<th>Estado del Tipo</th>"
				+ "<th>Editar</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getString(1) + "</pre></td>"

						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\"><a href='actualizarGasto.jsp?idtipogasto="
						+ rs.getString(4) + "'>actualizar</a></pre></td>" + "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return tabla;
	}

	public String RegistrarTipo() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO tipo_gasto(descripcion,max_deduc,max_gasto,estado)";
		sql += "VALUES(?,?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, this.getNombre_gasto());
			pr.setDouble(2, this.getMax_deduc());
			pr.setDouble(3, this.getValor_maximo());
			pr.setString(4, "Bien");

			if (pr.executeUpdate() == 1) {
				result = "Nuevo Tipo Guardado con Éxito";

			} else {
				result = "No se pudo insertar el gasto";
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
		if (result.equals("Nuevo Tipo Guardado con Éxito")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 200px; height: 190px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 200px; height: 190px;\">";

		return resp;
	}

	public String mostrarTipos() {
		String combo = "<select name = 'cmbTipos' style=\"width: 170px\">";
		String sql = "select id_tipogasto,descripcion from public.tipo_gasto";
		ResultSet rs = null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			combo += "<option value=0>Escoja una Opción:</option>";
			while (rs.next()) {
				combo += "<option value=" + rs.getInt(1) + ">" + rs.getString(2) + "</option>";
			}

			combo += "</select>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return combo;
	}

	public Tipos_gastos obtenerPorIdentificador(Long id) {
		String sql = "select " + " id_tipogasto, descripcion, max_deduc, max_gasto, estado "
				+ " from public.tipo_gasto " + " where id_tipogasto =" + id.toString();
		ResultSet rs = null;
		Tipos_gastos tipo = new Tipos_gastos();
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tipo.setId_tipogasto(rs.getLong(1));
				tipo.setDescripcion(rs.getString(2));
				tipo.setMax_deduc(rs.getDouble(3));
				tipo.setMax_gasto(rs.getDouble(4));
				tipo.setEstado(rs.getString(5));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			con.cerrarConexion();
		}

		return tipo;
	}

	public String actualizarTipo() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = " UPDATE public.tipo_gasto " + 
		       " SET  descripcion = ?, max_deduc = ?, max_gasto = ?, estado = ? "
				+ "	WHERE id_tipogasto=" + getId_tipogasto().toString() + ";";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, this.getDescripcion());
			pr.setDouble(2, this.getMax_deduc());
			pr.setDouble(3, this.getMax_gasto());
			pr.setString(4, this.getEstado());

			if (pr.executeUpdate() == 1) {
				result = "Actualizado con Éxito";

			} else {
				result = "No se pudo actualizar el gasto";
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

}
