<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id =  request.getParameter("pelicula_id")      ;
    String titulo=request.getParameter("pelicula_titulo");
    String genero=request.getParameter("pelicula_genero");
    String anio = request.getParameter("pelicula_anio");
    String origen =request.getParameter("pelicula_origen");

    Connection conn = null;


    try
    {
        int anioInt = Integer.parseInt(anio);
        int idInt = Integer.parseInt(id);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call actualizarPelicula(?,?,?,?,?)    }");
        sp.setInt(1,idInt);
        sp.setString(2,titulo);
        sp.setString(3,genero);
        sp.setInt(4,anioInt);
        sp.setString(5,origen);

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

    window.alert(" Pelicula Editada");
    location.href="ListadoProductos.jsp"
</script>