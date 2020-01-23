<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/10/2020
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="static javax.swing.DropMode.INSERT" %>
<%@ page import="sun.util.resources.cldr.rof.CalendarData_rof_TZ" %>

<%
    String titulo=request.getParameter("titulo_pelicula");
    String genero=request.getParameter("genero_pelicula");
    String anio = request.getParameter("anio_pelicula");
    String origen =request.getParameter("origen_pelicula");

    out.print("anio ingresado 2: "+ anio);
    Connection conn = null;


    try
    {
        int anioInt = Integer.parseInt(anio);

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call nuevapelicula(?,?,?,?)}");
        sp.setString(1,titulo);
        sp.setString(2,genero);
        sp.setInt(3,anioInt);
        sp.setString(4,origen);

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

    window.alert(" Pelicula Ingresada");
    location.href="javascript:history.back(-1);"
</script>