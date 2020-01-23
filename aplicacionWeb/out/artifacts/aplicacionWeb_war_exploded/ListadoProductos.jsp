<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/13/2020
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado Productos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="CSS/ListadoProductos.css" rel="stylesheet" type="text/css">
    <script src="JavaScripts/CargarFormularios.js" >    </script>
</head>
<body>

<h1  > Listado de Productos  </h1>
<form class="form-horizontal"  method="post"  action="ListadoProductos.jsp">
    <fieldset >

        <!-- Form Name -->
        <legend>Filtros de Búsqueda</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_nombre">Nombre</label>
            <div class="col-md-4">
                <input id="input_nombre" name="input_nombre" type="text" value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_genero">Genero</label>
            <div class="col-md-4">
                <input id="input_genero" name="input_genero" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_categoria">Categoria</label>
            <div class="col-md-4">
                <select id="input_categoria" name="input_categoria" class="form-control">
                    <option value="">Seleccionar</option>
                    <option value="1">Pelicula</option>
                    <option value="2">Serie</option>
                    <option value="3">Cancion</option>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_origen">Origen</label>
            <div class="col-md-4">
                <input id="input_origen" name="input_origen" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_min">Puntuación</label>
            <div class="col-md-4">
                <input id="input_min" name="input_min" type="text"  value="" class="form-control input-md">
                <input id="input_max" name="input_max" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label  id="label_año" class="col-md-4 control-label" for="input_año"  >Año</label>
            <div class="col-md-4">
                <input id="input_año" name="input_año" type="text"  value="" class="form-control input-md">

            </div>
        </div>
        </br>
        <!-- Button (Double) -->
        <div id="botones" class="form-group">
            <label class="col-md-4 control-label" for="boton_aceptar"></label>
            <div class="col-md-8" >
                <button id="boton_aceptar" name="boton_aceptar" type="submit"  class="btn btn-success">Buscar</button>
                <button id="boton_limpiar" onclick="return resetForm(this.form);"  name="boton_limpiar" class="btn btn-danger">Limpiar</button>

            </div>
        </div>

    </fieldset>
</form>
<%
    String titulo = request.getParameter("input_nombre");
    String genero = request.getParameter("input_genero");
    String categoria = request.getParameter("input_categoria");
    String origen = request.getParameter("input_origen");
    String min = request.getParameter("input_min");
    String max = request.getParameter("input_max");
    String sqlNormal = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria";
    String sqlConFiltros ;


    if( titulo =="" && genero== "" && categoria == "" && origen=="" && min == "" && max == ""  ){
        sqlConFiltros = sqlNormal;
    }
    else{
        if( min == "" && max == "" ){
            min = "0";
            max = "10";
        }

        sqlConFiltros = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria where prod_titulo LIKE '%"+titulo+"%' and p.prod_genero LIKE '%"+genero+"%' and p.id_categoria LIKE '%"+categoria+"%' and p.prod_origen LIKE '%"+origen+"%' and p.prod_puntaje between '"+min+"' and '"+max+"'  ";



    }
    if( titulo == null && genero== null && categoria == null && origen==null && min == null && max == null  ){
        sqlConFiltros = sqlNormal;
    }





    Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        PreparedStatement ps;
        ResultSet rs;
        ps = conn.prepareStatement(sqlConFiltros);
        rs = ps.executeQuery();


%>

<table class='table table-bordered table-condensed table-striped table-hover  ' id="table">
    <thead class="thead-dark">
    <tr >
        <th scope="col">ID</th>
        <th scope="col">Nombre</th>
        <th scope="col">Genero</th>
        <th scope="col">Categoria</th>
        <th scope="col">Año</th>
        <th scope="col">Origen</th>
        <th scope="col">Artista</th>
        <th scope="col">Album</th>
        <th scope="col">Episodios</th>
        <th scope="col">Temporadas</th>
        <th scope="col">Puntaje</th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr   id="<%= rs.getString("id_producto")%>"  class="table-row" onclick="marcar(this)">
        <td > <%= rs.getInt("id_producto")%>   </td>
        <td> <%= rs.getString("prod_titulo")%>  </td>
        <td> <%= rs.getString("prod_genero")%>  </td>
        <td> <%= rs.getString("c.cat_nombre")%>  </td>
        <td> <%= rs.getInt("prod_año")%>  </td>
        <td> <%= rs.getString("prod_origen")%>  </td>
        <td> <%= rs.getString("prod_artista")%>  </td>
        <td> <%= rs.getString("prod_album")%>  </td>
        <td> <%= rs.getInt("prod_episodios")%>  </td>
        <td> <%= rs.getInt("prod_temporadas")%>  </td>
        <td> <%= rs.getInt("prod_puntaje")%>  </td>
    </tr>

<%}      %>
    </thead>
    <tbody>


    </tbody>
</table>

</br>
<button id="boton_editar" type="submit" formmethod="get" onclick="editarProducto()" class="btn btn-primary btn-lg">Editar</button>
<button id="boton_comentarios" formmethod="get" onclick="verComentarios() " class="btn btn-primary btn-lg">Ver Comentarios</button>
<button id="boton_eliminar" name="boton_eliminar" formmethod="get" onclick="eliminarProducto()"   class="btn btn-danger">Eliminar</button>
<button id="boton_nuevo_comentario" type="submit"  formmethod="get" onclick="cargarComentario()" class="btn btn-primary btn-lg">Nuevo Comentario</button>




<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>





</body>
</html>