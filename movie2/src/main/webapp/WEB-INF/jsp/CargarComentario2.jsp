<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Cargar Comentario 2</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>

  <link href="<c:url value="/resources/CSS/style.css" />" rel="stylesheet">


<style>
    h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
    body {font-family: "Open Sans"}
</style>


<body>

<!-- Navigation bar with social media icons -->

<!-- w3-content defines a container for fixed size centered content,
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">

    <!-- Header -->
    <header class="w3-container w3-center w3-padding-48">
      <h1 style="color: white" > Nuevo Comentario</h1>
    </header>

    <!-- Image header -->


    <!-- Grid -->
    <form id="msform" method="post" action="subirComentario" modelAttribute="comentario">
        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Usuario</li>
            <li>Puntaje</li>
            <li>Mensaje</li>
        </ul>
 
               
        <fieldset>
        
 
                <input   id="id" name="id" type="text" value="${id}"  style="display: none" >

        
            <h2 class="fs-title">Inserte su nombre de usuario</h2>
            <h3 class="fs-subtitle">paso 1</h3>
            <input  id="usuario" type="text" name="usuario" placeholder="Usuario" required />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Puntaje</h2>
            <h3 class="fs-subtitle">paso 2</h3>
            <input id="puntaje" type="hidden" name="puntaje" placeholder="Puntaje" />
             <div class="rate">
     <input type="radio" onclick="STARS()" id="star10" name="rate" value="10" />
    <label for="star10" title="10">10 stars</label>
     <input type="radio" onclick="STARS()" id="star9" name="rate" value="9" />
    <label for="star9" title="9">9 stars</label>
     <input type="radio" onclick="STARS()" id="star8" name="rate" value="8" />
    <label for="star8" title="8">8 stars</label>
     <input type="radio"  onclick="STARS()" id="star7" name="rate" value="7" />
    <label for="star7" title="7">7 stars</label>
     <input type="radio" onclick="STARS()" id="star6" name="rate" value="6" />
    <label for="star6" title="6">6 stars</label>
    <input type="radio" onclick="STARS()" id="star5" name="rate" value="5" />
    <label for="star5" title="5">5 stars</label>
    <input type="radio" onclick="STARS()" id="star4" name="rate" value="4" />
    <label for="star4" title="4">4 stars</label>
    <input type="radio" onclick="STARS()" id="star3" name="rate" value="3" />
    <label for="star3" title="3">3 stars</label>
    <input type="radio" onclick="STARS()" id="star2" name="rate" value="2" />
    <label for="star2" title="2">2 stars</label>
    <input type="radio" onclick="STARS()" id="star1" name="rate" value="1" />
    <label for="star1" title="1">1 star</label>
  </div>
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">Mensaje</h2>
            <h3 class="fs-subtitle">Deje su comentario!</h3>

            <textarea id="mensaje" name="mensaje" placeholder="Comentario" required></textarea>
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="submit" name="submit" class="submit action-button" value="Submit" />
        </fieldset>
    </form>

</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="<c:url value="/resources/JavaScripts/jQuery.js" />"></script>
</body>
</html>







