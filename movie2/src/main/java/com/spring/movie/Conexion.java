package com.spring.movie;

import java.sql.*;

public class Conexion {

	 Connection conn = null;
	
	public Conexion() throws SQLException {
		this.conectar();
	}
	

	
	public  void conectar() throws SQLException {
		 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
	        
	}
	
	
	public Connection getConexion() {
		return conn;
	}
	
	
	
	
}
