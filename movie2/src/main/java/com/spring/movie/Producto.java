package com.spring.movie;

public class Producto {
	  private int id;
	    private String titulo;
	    private String genero;
	    private String categoria;
	    private int anio;
	    private String origen;
	    private String artista;
	    private String album;
	    private int episodios;
	    private int temporadas;
	    private int puntaje;
	    public Producto() {
	    	
	    }
	    
	    public Producto(int id,String titulo,String genero,String categoria, int anio, String origen,String artista, String album,int episodios,int temporadas,int puntaje) {
	    	this.id = id;
	    	this.titulo = titulo;
	    	this.genero = genero;
	    	this.categoria = categoria;
	    	this.anio = anio;
	    	this.origen = origen;
	    	this.artista = artista;
	    	this.album = album;
	    	this.episodios = episodios;
	    	this.temporadas = temporadas;
	    	this.puntaje = puntaje;
	    	
	    }
	    
	    
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getTitulo() {
	        return titulo;
	    }

	    public void setTitulo(String titulo) {
	        this.titulo = titulo;
	    }

	    public String getGenero() {
	        return genero;
	    }

	    public void setGenero(String genero) {
	        this.genero = genero;
	    }

	    public String getCategoria() {
	        return categoria;
	    }

	    public void setCategoria(String categoria) {
	        this.categoria = categoria;
	    }

	    public int getAnio() {
	        return anio;
	    }

	    public void setAnio(int anio) {
	        this.anio = anio;
	    }

	    public String getOrigen() {
	        return origen;
	    }

	    public void setOrigen(String origen) {
	        this.origen = origen;
	    }

	    public String getArtista() {
	        return artista;
	    }

	    public void setArtista(String artista) {
	        this.artista = artista;
	    }

	    public String getAlbum() {
	        return album;
	    }

	    public void setAlbum(String album) {
	        this.album = album;
	    }

	    public int getEpisodios() {
	        return episodios;
	    }

	    public void setEpisodios(int episodios) {
	        this.episodios = episodios;
	    }

	    public int getTemporadas() {
	        return temporadas;
	    }

	    public void setTemporadas(int temporadas) {
	        this.temporadas = temporadas;
	    }

		public int getPuntaje() {
			return puntaje;
		}

		public void setPuntaje(int puntaje) {
			this.puntaje = puntaje;
		}
}
