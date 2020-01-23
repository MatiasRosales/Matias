package com.spring.movie;

public class Comentario {
	
	private int id;
	private String usuario;
	private String mensaje;
	private int puntaje;
	
	public Comentario() {
		
	}
	
	public Comentario(int id,String usuario,String mensaje,int puntaje) {
		this.id = id;
		this.usuario = usuario;
		this.mensaje = mensaje;
		this.puntaje = puntaje;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public int getPuntaje() {
		return puntaje;
	}
	public void setPuntaje(int puntaje) {
		this.puntaje = puntaje;
	}
	
	
	
	
	

}
