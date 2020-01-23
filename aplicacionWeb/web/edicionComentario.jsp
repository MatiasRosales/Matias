<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="static javax.swing.DropMode.INSERT" %>
<%@ page import="javax.print.DocFlavor" %>

<%
    String id = request.getParameter("comentario_id");
    String usuario=request.getParameter("comentario_usuario");
    String puntaje =request.getParameter("comentario_puntaje");
    String mensaje = request.getParameter("comentario_mensaje");

    Connection conn = null;

    int idInt = Integer.parseInt(id);
    try
    {

        int puntajeInt = Integer.parseInt(puntaje);

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db","root","1234");
        CallableStatement sp =  conn.prepareCall("{call actualizarComentario(?,?,?,?)}");
        sp.setInt(1,idInt);
        sp.setString(2,usuario);
        sp.setString(3,mensaje);
        sp.setInt(4,puntajeInt);


        sp.execute();

        out.println("Data is successfully updated!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }

%>

<script>

    window.alert(" Comentario Editado");
    location.href='listadoComentario.jsp?id=<%=idInt%>' ;
</script>
