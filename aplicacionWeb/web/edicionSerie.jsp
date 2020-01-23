<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="static javax.swing.DropMode.INSERT" %>
<%@ page import="javax.print.DocFlavor" %>

<%
    String id = request.getParameter("serie_id");
    String titulo=request.getParameter("serie_titulo");
    String genero=request.getParameter("serie_genero");
    String anio = request.getParameter("serie_anio");
    String origen =request.getParameter("serie_origen");
    String episodios = request.getParameter("serie_episodios");
    String temporadas = request.getParameter("serie_temporadas");
    Connection conn = null;


    try
    {
        int idInt = Integer.parseInt(id);
        int anioInt = Integer.parseInt(anio);
        int episodioInt = Integer.parseInt(episodios);
        int temporadaInt = Integer.parseInt(temporadas);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call actualizarSerie(?,?,?,?,?,?,?)}");
        sp.setInt(1,idInt);
        sp.setString(2,titulo);
        sp.setString(3,genero);
        sp.setInt(4,anioInt);
        sp.setString(5,origen);
        sp.setInt(6,episodioInt);
        sp.setInt(7,temporadaInt);

        sp.execute();

        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }

%>

<script>

    window.alert(" Canción Ingresada");
    location.href="ListadoProductos.jsp"
</script>