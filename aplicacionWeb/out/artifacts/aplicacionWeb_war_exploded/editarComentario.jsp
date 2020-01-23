<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EditarComentario</title>
    <h1> Editar Comentario </h1>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="../../CSS/EditarComentario.css" rel="stylesheet" type="text/css">


</head>
<body>


<%

    int id = Integer.parseInt(request.getParameter("id") );
    Connection conn = null;


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
    PreparedStatement ps;
    ResultSet rs;
    ps = conn.prepareStatement("select id_comentario,com_usuario,com_mensaje,com_puntaje from comentario where id_comentario = ? ");
    ps.setInt(1,id);
    rs = ps.executeQuery();

%>



<%
    while(rs.next()){
%>



<form id="form" class="form-horizontal" method="post" action="edicionComentario.jsp">
    <fieldset>

        <div class="form-group">

            <div class="col-md-4">
                <input   id="comentario_id" name="comentario_id" type="text"  value="<%= rs.getString("id_comentario")%>"    class="form-control input-md" style="display: none" >

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_usuario">Usuario</label>
            <div class="col-md-4">
                <input id="comentario_usuario" name="comentario_usuario" type="text"   value="<%= rs.getString("com_usuario")%>"  class="form-control input-md">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_puntaje">Puntaje</label>
            <div class="col-md-4">
                <input id="comentario_puntaje" name="comentario_puntaje" type="text"  value="<%= rs.getInt("com_puntaje")%>"   class="form-control input-md">

            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="comentario_mensaje">Mensaje</label>
            <div class="col-md-4">
                <input id="comentario_mensaje" name="comentario_mensaje" type="text"  value="<%= rs.getString("com_mensaje")%>"   class="form-control input-md">

            </div>
        </div>

        <!-- Textarea -->

        <%}      %>
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