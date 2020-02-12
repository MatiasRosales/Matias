<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ListadoComentarios</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
     <link href="<c:url value="/resources/CSS/ListadoComentarios.css" />" rel="stylesheet">
     <link href="<c:url value="/resources/CSS/ListadoProductos.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/JavaScripts/CargarFormularios.js" />"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="<c:url value="/resources/JavaScripts/knockout-3.5.1.js" />"></script>
    <h1 >  Comentarios  </h1>

</head>
<body>


</br>
</br>
<div id="titulo">
    <label> Título  </label>
    <input class="form-control" id="titulo_inhabilitado"  data-bind="value: titulo"  disabled>
</div>

</br>
<div id="puntuacion">
    <label> Puntuacion  </label>
    
      <input class="form-control" id="puntuacion_inhabilitado"   data-bind="value: puntaje"  type="hidden"  disabled>    
		
       
</div>

</br>
<table class='table table-bordered table-condensed table-striped table-hover  '>
    <thead class="thead-dark">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Usuario</th>
        <th scope="col">Comentario</th>
        <th scope="col">Puntuacion</th>

    </tr>
     <c:forEach items="${listaComentarios}" var="comentario">
    <tr  id="<c:out value="${comentario.id}"   />"  class="table-row" onclick="marcar(this)">
        <td ><c:out value="${comentario.id}"   /></td>
        <td> <c:out value="${comentario.usuario}"   /></td>
        <td><c:out value="${comentario.mensaje}"   /></td>
        <td><c:out value="${comentario.puntaje}"   /></td>
        
    </tr>
   </c:forEach>
    </thead>
    <tbody>


    </tbody>
</table>

</br>
<button id="boton_editar" type="button" formmethod="get" onclick="editarComentario()" class="btn btn-primary btn-lg">Editar</button>
<button id="boton_eliminar" name="boton_eliminar" formmethod="get" onclick="eliminarComentario()" class="btn btn-danger">Eliminar</button>
<button id="boton_volver" type="button" onclick="location.href='irListadoProductos'" class="btn btn-primary btn-lg">ir a Productos</button>


<script>



function eliminarComentarios(idComentario){
	 $.ajax({
		 type:'GET',
			url:'eliminarComentario',
			dataType: 'json',
			data:{id: idComentario },
			contentType : 'application/json',
			success : function(data) {	
		eliminarSTARS();
				mostrarSTARS(data);
		
				
				
				}
	 });
	 $("#"+idComentario+"").remove();
	 
	 
	 
	 
	 
};


function eliminarSTARS(){
	$(".fa-star").remove();
};






	
	
function ProductoViewModel(titulo,puntaje){
	this.titulo = ko.observable(titulo);
	this.puntaje = ko.observable(puntaje);
	mostrarSTARS(puntaje);
}	



ko.applyBindings(new ProductoViewModel( "${titulo}",${puntuacion}));

</script>




        <script src="<c:url value="/resources/JavaScripts/jquery-3.4.1.min.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>