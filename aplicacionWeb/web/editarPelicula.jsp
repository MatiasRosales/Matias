<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EditarPelicula</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>



<%

    int id = Integer.parseInt(request.getParameter("id") );
    Connection conn = null;


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
    PreparedStatement ps;
    ResultSet rs;
    ps = conn.prepareStatement("select id_producto,prod_titulo,prod_genero,prod_año,prod_origen from Producto where id_producto = ? ");
    ps.setInt(1,id);
    rs = ps.executeQuery();

%>



<%
    while(rs.next()){
%>

<form   class="form-horizontal" method="post" action="edicionPelicula.jsp"  >
    <fieldset>

        <!-- Form Name -->
        <legend>Editar Pelicula</legend>

        <div class="form-group">

            <div class="col-md-4">
                <input   id="pelicula_id" name="pelicula_id" type="text"  value="<%= rs.getString("id_producto")%>"    class="form-control input-md" style="display: none" >

            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="pelicula_titulo">Titulo</label>
            <div class="col-md-4">
                <input id="pelicula_titulo" name="pelicula_titulo" type="text"  value="<%= rs.getString("prod_titulo")%>" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="pelicula_genero">Genero</label>
            <div class="col-md-4">
                <input id="pelicula_genero" name="pelicula_genero" type="text"  value="<%= rs.getString("prod_genero")%>" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="pelicula_anio">Año</label>
            <div class="col-md-4">
                <input id="pelicula_anio" name="pelicula_anio" type="text"  value="<%= rs.getInt("prod_año")%>" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="pelicula_origen">Origen</label>
            <div class="col-md-4">
                <input id="pelicula_origen" name="pelicula_origen" type="text"  value="<%= rs.getString("prod_origen")%>" class="form-control input-md">

            </div>
        </div>
        <%}      %>
        <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="boton_editar_pelicula"></label>
            <div class="col-md-8">
                <button id="boton_editar_pelicula" name="boton_editar_pelicula" type="submit"  class="btn btn-success">Guardar Cambios</button>
            </div>
        </div>

    </fieldset>
</form>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>


