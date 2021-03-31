 package com.proyecto.control;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proyecto.conexion.clsConexion;

public class Usuario {
	Long id_persona;
	String correo;
	String password;

	public Usuario(Long id_persona, String correo, String password) {
		super();
		this.id_persona = id_persona;
		this.correo = correo;
		this.password = password;
	}

	public Usuario() {

	}

	public Long getId_persona() {
		return id_persona;
	}

	public void setId_persona(Long id_persona) {
		this.id_persona = id_persona;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean verificarUsuario(String nlogin, String nclave) {
		boolean respuesta = false;
		String sentencia = "Select * from usuario where correo='" + nlogin + "' and password='" + nclave + "';";
		System.out.print(sentencia);
		try {
			ResultSet rs;
			clsConexion clsCon = new clsConexion();
			rs = clsCon.Consulta(sentencia);
			if (rs.next()) {
				respuesta = true;
				this.setCorreo(nlogin);
				this.setPassword(nclave);

			} else {
				respuesta = false;
				rs.close();
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return respuesta;
	}


	public String RegistrarLogin() {
		String result = "";
		com.proyecto.conexion.clsConexion con = new com.proyecto.conexion.clsConexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO usuario(id_persona,login,clave)";
		sql += "VALUES(?,?,?)";
		try {
			pr = con.getConexion().prepareStatement(sql);
			pr.setLong(1, this.id_persona);
			pr.setString(2, this.getCorreo());
			pr.setString(3, this.getPassword());

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
	
	
	public UsuarioLogeado obtenerPorLoginClave(String login, String clave) {
		StringBuilder sql=new StringBuilder();
		sql.append(" select "); 
		sql.append("   p.id_persona,doc_identidad,apellido,nombre,login,clave,tf.id_tipofam,tf.descripcion_fam  ");
		sql.append(" from  ");
		sql.append("   persona p,usuario u,tipo_familiar tf ");
		sql.append(" where ");
		sql.append("   p.id_persona = u.id_persona and ");
		sql.append("   tf.id_tipofam = p.id_tipofam and ");
		sql.append("   u.login = '".concat(login).concat("' and "));
		sql.append("   u.clave = '".concat(clave).concat("'; "));
		ResultSet rs = null;
		clsConexion con = new clsConexion();
		try {
			rs = con.Consulta(sql.toString());
			UsuarioLogeado urs=new UsuarioLogeado();
			if (rs != null) {
				while (rs.next()) {
					urs.setId_persona(rs.getLong(1));
					urs.setDoc_identidad(rs.getString(2));
					urs.setApellido(rs.getString(3));
					urs.setNombre(rs.getString(4));
					urs.setLogin(rs.getString(5));
					urs.setClave(rs.getString(6));
					urs.setId_tipofam(rs.getLong(7));
					urs.setDescripcion_fam(rs.getString(8));
					return urs;
				}
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	
}
