<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EditarSerie</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>


<form class="form-horizontal" method="post" action="editarSerie" modelAttribute= "producto">
    <fieldset>

        <!-- Form Name -->
        <legend>Editar Serie</legend>

        <div class="form-group">
            <div class="col-md-4">
                <input id="serie_id" name="id" type="text"  value="${id}"    class="form-control input-md" style="display: none" >

            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_titulo">Titulo</label>
            <div class="col-md-4">
                <input id="serie_titulo" name="titulo" type="text" value="${titulo}" class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_genero">Genero</label>
            <div class="col-md-4">
                <input id="serie_genero" name="genero" type="text" value="${genero}" class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_anio">Año</label>
            <div class="col-md-4">
                <input id="serie_anio" name="anio" type="text" value="${anio}" class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_origen">Origen</label>
            <div class="col-md-4">
                <input id="serie_origen" name="origen" type="text" value="${origen}"class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_episodios">Episodios</label>
            <div class="col-md-4">
                <input id="serie_episodios" name="episodios" type="text" value="${episodios}" class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="serie_temporadas">Temporadas</label>
            <div class="col-md-4">
                <input id="serie_temporadas" name="temporadas" type="text" value="${temporadas}" class="form-control input-md" required>

            </div>
        </div>
        
        <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="boton_editar_serie"></label>
            <div class="col-md-8">
                <button id="boton_editar_serie" name="boton_editar_serie"  type="submit" class="btn btn-success">guardar Cambios</button>
            </div>
        </div>

    </fieldset>
</form>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>