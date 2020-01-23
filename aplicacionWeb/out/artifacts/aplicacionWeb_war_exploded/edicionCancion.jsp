<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id =  request.getParameter("cancion_id")      ;
    String titulo=request.getParameter("cancion_titulo");
    String genero=request.getParameter("cancion_genero");
    String anio = request.getParameter("cancion_anio");
    String origen =request.getParameter("cancion_origen");
    String artista = request.getParameter("cancion_artista");
    String album = request.getParameter("cancion_album");

    Connection conn = null;


    try
    {
        int anioInt = Integer.parseInt(anio);
        int idInt = Integer.parseInt(id);

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call actualizarCancion(?,?,?,?,?,?,?)  }");
        sp.setInt(1,idInt);
        sp.setString(2,titulo);
        sp.setString(3,genero);
        sp.setInt(4,anioInt);
        sp.setString(5,origen);
        sp.setString(6,artista);
        sp.setString(7,album);

        sp.execute();

        out.println("Data is successfully updated!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }

%>

<script>

    window.alert(" Canción Editada");
    location.href="ListadoProductos.jsp"
</script>