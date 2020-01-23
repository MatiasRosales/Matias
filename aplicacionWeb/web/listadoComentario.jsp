<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/13/2020
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ListadoComentarios</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="../../CSS/ListadoComentarios.css" rel="stylesheet" type="text/css">
    <link href="CSS/ListadoProductos.css" rel="stylesheet" type="text/css">
    <script src="JavaScripts/CargarFormularios.js" >    </script>
    <h1 >  Comentarios  </h1>

</head>
<body>


<%
    int id = Integer.parseInt(request.getParameter("id") );
    Connection conn = null;


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
    PreparedStatement ps;
    ResultSet rs;
    ps = conn.prepareStatement("select id_comentario,com_usuario,com_mensaje,com_puntaje from comentario where id_producto = ?");
    ps.setInt(1,id);
    rs = ps.executeQuery();

    PreparedStatement ps2 = conn.prepareStatement("select prod_titulo,prod_puntaje from producto where id_producto = ?");
    ResultSet rs2;
    ps2.setInt(1,id);
    rs2 = ps2.executeQuery();


%>

<%
    while(rs2.next()){
%>


</br>
</br>
<div id="titulo">
    <label> Título  </label>
    <input class="form-control" id="titulo_inhabilitado" type="text" value="<%= rs2.getString("prod_titulo")%>" disabled>
</div>

</br>
<div id="puntuacion">
    <label> Puntuacion  </label>
    <input class="form-control" id="puntuacion_inhabilitado" type="text" value="<%= rs2.getString("prod_puntaje")%>" disabled>
</div>
<%}%>
</br>
<table class='table table-bordered table-condensed table-striped table-hover  '>
    <thead class="thead-dark">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Usuario</th>
        <th scope="col">Comentario</th>
        <th scope="col">Puntuacion</th>

    </tr>
    <%
        while(rs.next()){
    %>
    <tr  id="<%= rs.getInt("id_comentario")%> "  class="table-row" onclick="marcar(this)">
        <td > <%= rs.getInt("id_comentario")%>   </td>
        <td> <%= rs.getString("com_usuario")%>  </td>
        <td> <%= rs.getString("com_mensaje")%>  </td>
        <td> <%= rs.getInt("com_puntaje")%>  </td>

    </tr>
    <%}%>
    </thead>
    <tbody>


    </tbody>
</table>

</br>
<button id="boton_editar" type="button" formmethod="get" onclick="editarComentario()" class="btn btn-primary btn-lg">Editar</button>
<button id="boton_eliminar" name="boton_eliminar" formmethod="get" onclick="eliminarComentario()" class="btn btn-danger">Eliminar</button>
<button id="boton_volver" type="button" onclick="location.href='ListadoProductos.jsp   '" class="btn btn-primary btn-lg">ir a Productos</button>







<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>