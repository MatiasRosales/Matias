<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/13/2020
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="static javax.swing.DropMode.INSERT" %>
<%@ page import="javax.print.DocFlavor" %>

<%
    String titulo=request.getParameter("titulo_cancion");
    String genero=request.getParameter("genero_cancion");
    String anio = request.getParameter("anio_cancion");
    String origen =request.getParameter("origen_cancion");
    String artista = request.getParameter("artista_cancion");
    String album = request.getParameter("album_cancion");
    Connection conn = null;


    try
    {
        int anioInt = Integer.parseInt(anio);

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call nuevacancion(?,?,?,?,?,?)}");
        sp.setString(1,titulo);
        sp.setString(2,genero);
        sp.setInt(3,anioInt);
        sp.setString(4,origen);
        sp.setString(5,artista);
        sp.setString(6,album);

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
    location.href="javascript:history.back(-1);"
</script>