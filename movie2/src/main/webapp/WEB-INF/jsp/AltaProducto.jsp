<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <link href="<c:url value="/resources/CSS/AltaProducto.css" />" rel="stylesheet">
<script src="<c:url value="/resources/JavaScripts/CargarFormularios.js" />"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"> </script>

    <title>Nuevo Producto</title>
</head>
<body>
<h1> Alta Producto   </h1>
</br>
</br>
</br>
<h3> Tipo de Producto   </h3>

<div id="botones" class="btn-group btn-group-toggle" data-toggle="buttons">
    <label class="btn btn-secondary active">
        <input type="radio" name="options" id="option1" onclick="abrirFormularioPeliculas()" autocomplete="off" > Pelicula
    </label>
    <label class="btn btn-secondary">
        <input type="radio" name="options" id="option2" autocomplete="off" onclick="abrirFormularioSerie()"> Serie
    </label>
    <label class="btn btn-secondary">
        <input type="radio" name="options" id="option3" autocomplete="off" onclick="abrirFormularioCancion()"> Cancion
    </label>
</div>

</br>


<div  class = "form-popup" id="bloqueFormularioPelicula">
    <form method="post" action="cargarPelicula" class="form-container" id="formularioPeliculas" method="post" modelAttribute="producto">
        <fieldset>
            <!-- Form Name -->
            <legend>Alta Pelicula</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="titulo_input">Titulo</label>
                <div class="col-md-4">
                    <input id="titulo_input" onkeyup="verificarTitulo(this.id)" name="titulo" type="text" class="form-control input-md" required>
					<span class="span" > </span>
                </div>
            </div>
            
          <script>
          function verificarTitulo(id){
        	  $.ajax({
        		  type:'GET',
        			url:'listaNombreProductos',
        			dataType: 'json', 
        			data:{},
        			contentType : 'application/json',
        			success: function(data){
        				
        				if(  data.includes( $("#"+id+"").val()  )  ){
        				
        					$("#"+id+"").siblings("span").text('Titulo ya existente');
        				 deshabilitarAltaBoton(true);
        				}//cierre if
        				else{
        					$("#"+id+"").siblings("span").text('');
        					deshabilitarAltaBoton(false);
        				}//cierre else
        				
        			}//cierre funcion con los datos de la db
        	  }); //cierre funcion ajax
        	  
          }; //cierre verificarTitulo
          
          
          
          function deshabilitarAltaBoton(booleano){
        		$("[name='boton_aceptar']").each( function() {
					this.disabled = booleano;  
				} );
          }
          
          
          
          </script>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="genero_input">Genero</label>
                <div class="col-md-4">
                    <input id="genero_input" name="genero" type="text"  class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="anio_input">Año dos</label>
                <div class="col-md-4">
                    <input id="anio_input" name="anio" type="text"   class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="origen_input">Origen</label>
                <div class="col-md-4">
                    <input id="origen_input" name="origen" type="text" class="form-control input-md" required>

                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="boton_aceptar"></label>
                <div class="col-md-8">
                    <button id="boton_aceptar" type="submit" name="boton_aceptar" class="btn btn-success">Aceptar</button>
                    <button id="boton_limpiar" onclick="return resetForm(this.form);" name="boton_limpiar" class="btn btn-danger">Limpiar</button>
   					<button id="boton_volver" onclick= "location.href='principal.jsp'" name="boton_volver" class="btn btn-success">Volver</button>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<div class="form-popup" id="bloqueFormularioSerie">
<form class="form-container" method="post" action="cargarSerie"  modelAttribute="producto">
    <fieldset>

        <!-- Form Name -->
        <legend>Alta Serie</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" >Titulo</label>
            <div class="col-md-4">
                <input id="input_titulo_serie" onkeyup="verificarTitulo(this.id)"  name="titulo" type="text"class="form-control input-md" required>
				<span class="span"></span>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_genero_serie">Genero</label>
            <div class="col-md-4">
                <input id="input_genero_serie" name="genero" type="text" class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_anio_serie" >Año</label>
            <div class="col-md-4">
                <input id="input_anio_serie" name="anio" type="text"  class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_origen_serie">Origen</label>
            <div class="col-md-4">
                <input id="input_origen_serie" name="origen" type="text"  class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_episodios">Episodios</label>
            <div class="col-md-4">
                <input id="input_episodios" name="episodios" type="text"  class="form-control input-md" required>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="input_temporada">Temporadas</label>
            <div class="col-md-4">
                <input id="input_temporada" name="temporadas" type="text"  class="form-control input-md" required>

            </div>
        </div>

        <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="boton_aceptar"></label>
            <div class="col-md-8">
                <button id="boton_aceptarSerie"  type="submit" name="boton_aceptar" class="btn btn-success">Aceptar</button>
                <button id="boton_limpiarSerie" onclick="return resetForm(this.form);" name="boton_limpiar" class="btn btn-danger">Limpiar</button>
                   <button id="boton_volver" onclick= "location.href='principal.jsp'" name="boton_volver" class="btn btn-success">Volver</button>
            </div>
        </div>

    </fieldset>
</form>
</div>

<div class="form-popup" id="bloqueFormularioCancion">
    <form class="form-container" method="post" action="cargarCancion" method="post" modelAttribute="producto">
        <fieldset>

            <!-- Form Name -->
            <legend>Alta Cancion</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_titulo">Titulo</label>
                <div class="col-md-4">
                    <input id="input_titulo" onkeyup="verificarTitulo(this.id)" name="titulo" type="text" class="form-control input-md" required>
					<span class="span"></span>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_genero">Genero</label>
                <div class="col-md-4">
                    <input id="input_genero" name="genero" type="text"class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_anio_cancion">Año</label>
                <div class="col-md-4">
                    <input id="input_anio_cancion" name="anio" type="text"  class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_origen_cancion">Origen</label>
                <div class="col-md-4">
                    <input id="input_origen_cancion" name="origen" type="text"  class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_artista">Artista</label>
                <div class="col-md-4">
                    <input id="input_artista" name="artista" type="text" class="form-control input-md" required>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="input_album">Album</label>
                <div class="col-md-4">
                    <input id="input_album" name="album" type="text"  class="form-control input-md" required>

                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="boton_aceptar"></label>
                <div class="col-md-8">
                    <button id="boton_aceptarCancion"  type="submit" name="boton_aceptar" class="btn btn-success">Aceptar</button>
                    <button id="boton_limpiarCancion" onclick="return resetForm(this.form);"  name="boton_limpiar" class="btn btn-danger">Limpiar</button>
                       <button id="boton_volver" onclick= "location.href='principal.jsp'" name="boton_volver" class="btn btn-success">Volver</button>
                </div>
            </div>

        </fieldset>
    </form>


</div>






<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>