<%--
  Created by IntelliJ IDEA.
  User: mrosales
  Date: 1/14/2020
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%

    int id = Integer.parseInt(request.getParameter("id") );
    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas_db", "root", "1234");
        CallableStatement cs = conn.prepareCall("{call eliminarComentario(?)}");
        cs.setInt(1, id);
        cs.execute();

        out.println("Data is successfully deleted!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }

%>
