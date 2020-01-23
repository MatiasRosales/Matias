import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SQLPeliculas {
    private static Connection con ;

    public SQLPeliculas(){
        Conexion c = new Conexion();
        con = c.getConexion();

    }

    private static String insertar = " INSERT INTO Producto(prod_titulo,id_categoria,prod_genero,prod_año,prod_origen) values(?,1,?,?,?)";

    public void guardar(String titulo, String genero, int año,String origen   ) throws SQLException {
        PreparedStatement preparedStatement = null;
        preparedStatement = con.prepareStatement(insertar);
        preparedStatement.setString(1, titulo);
        preparedStatement.setString(2,genero);
        preparedStatement.setInt(3,año);
        preparedStatement.setString(4,origen);
        preparedStatement.executeUpdate();

    }


}
