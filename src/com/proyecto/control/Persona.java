package com.proyecto.control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proyecto.conexion.clsConexion;

public class Persona {
	private String nombre;
	private String apellido;
	private java.sql.Date fecha_nacimiento;
	private int id_tipofam;
	private String doc_identidad;
	private String correo;
	private String num_telefono;
	private Long id_persona;
	private Double monto;

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public Persona(Long id_persona, String nombre, String apellido, java.sql.Date fecha_nacimiento, int id_tipofam,
			String doc_id, String correo, String num_tel) {

		super();
		this.id_persona = id_persona;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fecha_nacimiento = fecha_nacimiento;
		this.id_tipofam = id_tipofam;
		this.doc_identidad = doc_id;
		this.correo = correo;
		this.num_telefono = num_tel;
	}

	public Persona() {
		super();
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public java.sql.Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(java.sql.Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}

	public int getId_tipofam() {
		return id_tipofam;
	}

	public void setId_tipofam(int id_tipofam) {
		this.id_tipofam = id_tipofam;
	}

	public String getDoc_identidad() {
		return doc_identidad;
	}

	public void setDoc_identidad(String doc_identidad) {
		this.doc_identidad = doc_identidad;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getNum_telefono() {
		return num_telefono;
	}

	public void setNum_telefono(String num_telefono) {
		this.num_telefono = num_telefono;
	}

	/*
	 * public boolean verificarUsuario(String nlogin, String nclave) { boolean
	 * respuesta = false; String sentencia = "Select * from usuario where correo='"
	 * + nlogin + "' and password='" + nclave + "';"; System.out.print(sentencia);
	 * try { ResultSet rs; clsConexion clsCon = new clsConexion(); rs =
	 * clsCon.Consulta(sentencia); if (rs.next()) { respuesta = true;
	 * this.setCorreo(nlogin); this.setPassword(nclave);
	 * this.setId_tipofam(rs.getInt(4)); this.setNombre(rs.getString(1)); } else {
	 * respuesta = false; rs.close(); } } catch (Exception ex) {
	 * System.out.println(ex.getMessage()); } return respuesta; }
	 */

	public String RegistrarUsuario() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO persona(nombre,apellido,id_tipofam,fecha_nacim,correo_electronico,doc_identidad,num_telefono)";
		sql += "VALUES(?,?,?,?,?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, this.getNombre());
			pr.setString(2, this.getApellido());
			pr.setInt(3, this.getId_tipofam());
			pr.setDate(4, this.getFecha_nacimiento());
			pr.setString(5, this.getCorreo());
			pr.setString(6, this.getDoc_identidad());
			pr.setString(7, this.getNum_telefono());
			// Parametros de imagen

			/*
			 * File fichero = new File(dirArchivo); FileInputStream streamEntrada = new
			 * FileInputStream(fichero); pr.setBinaryStream(7,
			 * streamEntrada,(int)fichero.length());
			 */

			if (pr.executeUpdate() == 1) {
				result = "Se ha insertado el usuario satisfactoriamente";
			} else {
				result = "No se pudo insertar el usuario";
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

	public Long obtenerIdPorDocumento(String docidentidad) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select ");
		sql.append("   p.id_persona ");
		sql.append(" from ");
		sql.append("   public.persona p ");
		sql.append(" where ");
		sql.append("   p.doc_identidad='".concat(docidentidad).concat("';"));
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
		if (result.equals("Usuario Registrado Correctamente")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 335px; height: 320px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 335px; height: 320px;\">";

		return resp;
	}
	
	public String addImagenEUsuario(String result) {
		String resp = "";
		if (result.equals("Datos Editados Correctamente")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 335px; height: 320px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 335px; height: 320px;\">";

		return resp;
	}

	public Long getId_persona() {
		return id_persona;
	}

	public void setId_persona(Long id_persona) {
		this.id_persona = id_persona;
	}

	public String listarDatosPersona(Long id_persona) {
		String tabla = "<table border=1 align=\"center\" class=\"tabla2\"";
		String sql = "select nombre, apellido,correo_electronico, num_telefono, monto from persona p, ingresos i \r\n"
				+ "where i.id_persona = p.id_persona\r\n" + "and p.id_persona = " + id_persona;
		ResultSet rs = null;
		tabla += "<tr>" + "<th>Nombre</th>" + "<th>Apellido</th>" + "<th>Correo Electronico</th>"
				+ "<th>Número de Teléfono</th>" + "<th>Ganancias Mensuales</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getString(1) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(4) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(5) + "</pre></td>" + "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return tabla;
	}

	public String listarDatosUsuarios() {
		String tabla = "<table border=1 align=\"center\" class=\"tabla2\"";
		String sql = "select * from datosUsuarios";
		ResultSet rs = null;
		tabla += "<tr>" + "<th>Nombre</th>" + "<th>Apellido</th>" + "<th>Tipo Familiar</th>"
				+ "<th>Correo Electrónico</th>" + "<th>Número de Teléfono</th>" + "<th>Ganancias Mensuales</th>"
				+ "<th>Actualizar</th>" + "</tr>";
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr>" + "<td><pre style=\"text-aling:center\">" + rs.getString(1) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(2) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(3) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(4) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getString(5) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\">" + rs.getDouble(6) + "</pre></td>"
						+ "<td><pre style=\"text-aling:center\"><a href='edicionPersona.jsp?idpersona=" + rs.getLong(7)
						+ "'>actualizar</a></pre></td>" + "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return tabla;
	}

	public Persona listarUsuarioId(Long id) {

		String sql = "select * from datosUsuarios where id_persona =" + id.toString();
		ResultSet rs = null;
		clsConexion con = new clsConexion();
		Persona persona = new Persona();
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				persona.setNombre(rs.getString(1));
				persona.setApellido(rs.getString(2));
				persona.setCorreo(rs.getString(4));
				persona.setNum_telefono(rs.getString(5));
				persona.setMonto(rs.getDouble(6));
				persona.setId_persona(rs.getLong(7));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return persona;
	}

	public String actualizarPersona() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = " UPDATE public.persona "
				+ "	SET nombre=?, apellido=?, num_telefono=? "
				+ "	WHERE id_persona=" + this.getId_persona() + "; ";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setString(1, this.getNombre());
			pr.setString(2, this.getApellido());
			pr.setString(3, this.getNum_telefono());
			if (pr.executeUpdate() == 1) {
				result = "Persona actualizada con exito";

			} else {
				result = "No se pudo actualizar de persona";
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
	
	public String actualizarMonto() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = " UPDATE public.ingresos " + 
				"	SET monto=? "
				+ "	WHERE id_persona=" + this.getId_persona() + "; ";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setDouble(1, this.getMonto());
			if (pr.executeUpdate() == 1) {
				result = "Monto actualizado con Éxito";
			} else {
				result = "No se pudo actualizar el monto";
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
