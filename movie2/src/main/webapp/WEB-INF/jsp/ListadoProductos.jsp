<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado Productos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <link href="<c:url value="/resources/CSS/ListadoProductos.css" />" rel="stylesheet">
<script src="<c:url value="/resources/JavaScripts/CargarFormularios.js" />"></script> 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"> </script>

</head>
<body>

<h1  > Listado de Productos  </h1>
<form class="form-horizontal"  >
    <fieldset >

        <!-- Form Name -->
        <legend>Filtros de Búsqueda</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" >Titulo</label>
            <div class="col-md-4">
                <input id="titulo" name="titulo" type="text" value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" >Genero</label>
            <div class="col-md-4">
                <input id="genero" name="genero" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" >Categoria</label>
            <div class="col-md-4">
                <select id="categoria" name="categoria" class="form-control">
                    <option value="">Seleccionar</option>
                    <option value="1">Pelicula</option>
                    <option value="2">Serie</option>
                    <option value="3">Cancion</option>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" >Origen</label>
            <div class="col-md-4">
                <input id="origen" name="origen" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Puntuación</label>
            <div class="col-md-4">
                <input id="min" name="min" type="text"  value="" class="form-control input-md">
                <input id="max" name="max" type="text"  value="" class="form-control input-md">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label  id="label_año" class="col-md-4 control-label"  >Año</label>
            <div class="col-md-4">
                <input id="anio" name="anio" type="text"  value="" class="form-control input-md">

            </div>
        </div>
        </br>
        <!-- Button (Double) -->
        <div id="botones" class="form-group">
            <label class="col-md-4 control-label" for="boton_aceptar"></label>
            <div class="col-md-8" >
                <button id="boton_aceptar" type="button" onclick=" filtrar()" name="boton_aceptar" class="btn btn-success">Buscar</button>
                <button id="boton_limpiar" onclick="return resetForm(this.form);"  name="boton_limpiar" class="btn btn-danger">Limpiar</button>

            </div>
        </div>

    </fieldset>
</form>



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
    <tbody>
  
   <c:forEach items="${listaProductos}" var="producto">
    <tr   id="<c:out value="${producto.id}"   />"   class="table-row" onclick="marcar(this)">
        <td><c:out value="${producto.id}"   /></td>
        <td><c:out value="${producto.titulo}"   /></td>
        <td><c:out value="${producto.genero}"   /></td>
        <td><c:out value="${producto.categoria}"   /></td>
        <td><c:out value="${producto.anio}"   /></td>
        <td><c:out value="${producto.origen}"   /></td>
        <td><c:out value="${producto.artista}"   /></td>
        <td><c:out value="${producto.album}"   /></td>
        <td><c:out value="${producto.episodios}"   /></td>
        <td><c:out value="${producto.temporadas}"   /></td>
        <td><c:out value="${producto.puntaje}"   /></td>
    </tr>
</c:forEach>

   
    


    </tbody>
</table>

</br>
<button id="boton_editar" type="submit" formmethod="get" onclick="editarProducto()" class="btn btn-primary btn-lg">Editar</button>
<button id="boton_comentarios" formmethod="get" onclick="verComentarios() " class="btn btn-primary btn-lg">Ver Comentarios</button>
<button id="boton_eliminar" name="boton_eliminar" formmethod="get" onclick="eliminarProducto()"   class="btn btn-danger">Eliminar</button>
<button id="boton_nuevo_comentario" type="submit"  formmethod="get" onclick="cargarComentario()" class="btn btn-primary btn-lg">Nuevo Comentario</button>




<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>




<script>


 function filtrar(){
	 $('#table tbody').empty();
	$.ajax({
		type:'GET',
		url:'filtrarProductos',
		dataType: 'json',
		data:{
			titulo:$("#titulo").val(),
			genero:	$("#genero").val(),
			categoria:	$("#categoria").val(),
			anio: $("#anio").val(),
			origen: $("#origen").val(),
			min: $("#min").val(),
			max: $("#max").val()
		}, 
		contentType : 'application/json',
		success : function(data) {	
	
			data.forEach(elemento => $('#table').append('<tr id= '+elemento.id+'  class="table-row" onclick="marcar(this)" > <td> '+elemento.id+'  </td> <td> '+elemento.titulo+'  </td> <td> '+elemento.genero+'  </td>  <td> '+elemento.categoria+'  </td> <td> '+elemento.anio+'  </td> <td> '+elemento.origen+'  </td> <td> '+elemento.artista+' </td> <td> '+elemento.album+' </td> <td> '+elemento.episodios+'  </td> <td> '+elemento.temporadas+'  </td> <td> '+elemento.puntaje+' </td> </tr>'));
			
			
			
			}
		
		});	

};
 
 
 function eliminarProductos(idProducto){
	 $.ajax({
		 type:'POST',
			url:'eliminarProducto',
			data:{id: idProducto }
	 });
	 $("#"+idProducto+"").remove();
	 
	 
	 
 }
 


</script>





</body>
</html>