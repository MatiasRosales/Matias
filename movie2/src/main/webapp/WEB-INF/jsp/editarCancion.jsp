<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.swing.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EditarCancion</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<form class="form-horizontal" method="post" action="editarCancion" modelAttribute="producto">
    <fieldset>

        <!-- Form Name -->
        <legend>Editar Cancion</legend>

        <div class="form-group">
            <div class="col-md-4">
                <input id="cancion_id" name="id" type="text"  value="${id}"    class="form-control input-md" style="display: none">

            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_titulo">Titulo</label>
            <div class="col-md-4">
                <input id="cancion_titulo" name="titulo" type="text"  value="${titulo}"  class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_genero">Genero</label>
            <div class="col-md-4">
                <input id="cancion_genero" name="genero" type="text" value="${genero}" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_anio">Año</label>
            <div class="col-md-4">
                <input id="cancion_anio" name="anio" type="text" value= "${anio}" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_origen">Origen</label>
            <div class="col-md-4">
                <input id="cancion_origen" name="origen" type="text" value="${origen}" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_artista">Artista</label>
            <div class="col-md-4">
                <input id="cancion_artista" name="artista" type="text" value="${artista}"  class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="cancion_album">Album</label>
            <div class="col-md-4">
                <input id="cancion_album" name="album" type="text" value="${album}" class="form-control input-md">

            </div>
        </div>
        <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="boton_editar_cancion"></label>
            <div class="col-md-8">
                <button id="boton_editar_cancion" name="boton_editar_cancion" type="submit" class="btn btn-success">Guardar cambios</button>

            </div>
        </div>

    </fieldset>
</form>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>