<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EditarComentario</title>
    <h1> Editar Comentario </h1>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <link href="<c:url value="/resources/CSS/EditarComentario.css" />" rel="stylesheet">

</head>
<body>

<form id="form" class="form-horizontal" method="post" action="editarComentario"  modelAttribute="comentario">
    <fieldset>

        <div class="form-group">

            <div class="col-md-4">
                <input   id="comentario_id" name="id" type="text"  value="${id}"    class="form-control input-md" style="display: none" >

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_usuario">Usuario</label>
            <div class="col-md-4">
                <input id="comentario_usuario" name="usuario" type="text"   value="${usuario}"  class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_puntaje">Puntaje</label>
            <div class="col-md-4">
                <input id="comentario_puntaje" name="puntaje" type="text"  value="${puntaje}"   class="form-control input-md">

            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_mensaje">Mensaje</label>
            <div class="col-md-4">
                <input id="comentario_mensaje" name="mensaje" type="text"  value="${mensaje}"   class="form-control input-md">

            </div>
        </div>

        <!-- Textarea -->

  
        <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-8">
                <button id="boton_editar_comentario" name="boton_editar-comentario" type="submit" class="btn btn-success">Guardar Cambios</button>
            </div>
        </div>

    </fieldset>
</form>






<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>