package com.proyecto.control;

public class UsuarioLogeado {
	private Long id_persona;
	private String doc_identidad;
	private String apellido;
	private String nombre;
	private String login;
	private String clave;
	private Long id_tipofam;
	
	public Long getId_persona() {
		return id_persona;
	}
	public void setId_persona(Long id_persona) {
		this.id_persona = id_persona;
	}
	public String getDoc_identidad() {
		return doc_identidad;
	}
	public void setDoc_identidad(String doc_identidad) {
		this.doc_identidad = doc_identidad;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public Long getId_tipofam() {
		return id_tipofam;
	}
	public void setId_tipofam(Long id_tipofam) {
		this.id_tipofam = id_tipofam;
	}
	public String getDescripcion_fam() {
		return descripcion_fam;
	}
	public void setDescripcion_fam(String descripcion_fam) {
		this.descripcion_fam = descripcion_fam;
	}
	private String descripcion_fam; 
}
