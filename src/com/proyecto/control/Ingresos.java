	package com.proyecto.control;

import java.sql.PreparedStatement;

public class Ingresos {
	
	private Long id_persona;
	private String descripcion;
	private double monto;
	
	public Ingresos() {
		
	}
	
	public Ingresos(Long id_persona, double monto) {
		this.id_persona= id_persona;
		this.monto = monto; 
	}

	public Long getId_persona() {
		return id_persona;
	}

	public void setId_persona(Long id_persona) {
		this.id_persona = id_persona;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}
	
	public String RegistrarGanancias() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO ingresos(id_persona,descripcion,monto)";
		sql += "VALUES(?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setLong(1, this.id_persona);
			pr.setString(2, "Ganancias Mensuales");
			pr.setDouble(3, this.getMonto());

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

}
