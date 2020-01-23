<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/13/2020
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="static javax.swing.DropMode.INSERT" %>
<%@ page import="javax.print.DocFlavor" %>

<%
    String titulo=request.getParameter("titulo_serie");
    String genero=request.getParameter("genero_serie");
    String anio = request.getParameter("anio_serie");
    String origen =request.getParameter("origen_serie");
    String episodios = request.getParameter("episodios_serie");
    String temporadas = request.getParameter("temporadas_serie");
    Connection conn = null;


    try
    {
        int anioInt = Integer.parseInt(anio);
        int episodioInt = Integer.parseInt(episodios);
        int temporadaInt = Integer.parseInt(temporadas);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call nuevaserie(?,?,?,?,?,?)}");
        sp.setString(1,titulo);
        sp.setString(2,genero);
        sp.setInt(3,anioInt);
        sp.setString(4,origen);
        sp.setInt(5,episodioInt);
        sp.setInt(6,temporadaInt);

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