import java.sql.*;
public class Conexion {
    private static Connection conn;
    private static final String driver =  "com.mysql.jdbc.Driver";
    private static final String user = "root";
    private static final String password = "1234";
    private static final String url = "jdbc:mysql://localhost:3306/peliculas_db";

    public Conexion(){
        conn = null;
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url,user,password);
            if(conn != null){
                System.out.println("Conexion establecida!!!");
            }
        }catch (ClassNotFoundException | SQLException e){
            System.out.println("Error de conexion "+ e);
        }
    }

    // este metodo nos retorna la conexion
    public static Connection getConexion(){
        return conn;
    }

    public void desconectar(){
        conn = null;
        if (conn == null){
            System.out.println("Conexion Terminada");
        }
    }

}
