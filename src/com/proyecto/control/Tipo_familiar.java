package com.proyecto.control;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.proyecto.conexion.clsConexion;

public class Tipo_familiar {
	private int id_tipofam;
	private String descripcion_fam;

	public Tipo_familiar(int id_tipofam, String descripcion_fam) {
		super();
		this.id_tipofam = id_tipofam;
		this.descripcion_fam = descripcion_fam;
	}

	public Tipo_familiar() {
		super();
	}

	public int getId_tipofam() {
		return id_tipofam;
	}

	public void setId_tipofam(int id_tipofam) {
		this.id_tipofam = id_tipofam;
	}

	public String getDescripcion_fam() {
		return descripcion_fam;
	}

	public void setDescripcion_fam(String descripcion_fam) {
		this.descripcion_fam = descripcion_fam;
	}

	public String consultarCategoria() {
		String combo = "<select name = 'cmbCat' style=\"width: 140px\">";
		String sql = "select id_tipofam,descripcion_fam from public.tipo_familiar";
		ResultSet rs = null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql);
			combo += "<option value=0>Escoja una Opción:</option>";
			if (rs != null) {
				while (rs.next()) {
					combo += "<option value=" + rs.getInt(1) + ">" + rs.getString(2) + "</option>";
				}
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		combo += "</select>";
		return combo;
	}

}