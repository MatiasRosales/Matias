package com.spring.movie;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.PreparedStatement;

@Controller
public class ProductoController {

	
	
@RequestMapping("/cargarPelicula")
public ModelAndView cargarProducto(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c =new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call nuevapelicula(?,?,?,?)}");
	
	 cs.setString(1,prod.getTitulo());
     cs.setString(2,prod.getGenero());
    cs.setInt(3,prod.getAnio());
     cs.setString(4,prod.getOrigen());

     cs.execute();
     
     ModelAndView mv = new ModelAndView();
     mv.setViewName("VentanaResultado");
     mv.addObject("mensaje", ""+prod.getTitulo()+" cargado/a correctamente!!!");
     
     return mv;

}

@RequestMapping("/cargarSerie")
public ModelAndView cargarSerie(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c =new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call nuevaserie(?,?,?,?,?,?)}");
	
	 cs.setString(1,prod.getTitulo());
     cs.setString(2,prod.getGenero());
    cs.setInt(3,prod.getAnio());
     cs.setString(4,prod.getOrigen());
     cs.setInt(5, prod.getEpisodios());
     cs.setInt(6, prod.getTemporadas());

     cs.execute();
     
     ModelAndView mv = new ModelAndView();
     mv.setViewName("VentanaResultado");
     mv.addObject("mensaje", ""+prod.getTitulo()+" cargado/a correctamente!!!");
     
     return mv;

}


@RequestMapping("/cargarCancion")
public ModelAndView cargarCancion(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c =new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call nuevacancion(?,?,?,?,?,?)}");
	
	 cs.setString(1,prod.getTitulo());
     cs.setString(2,prod.getGenero());
    cs.setInt(3,prod.getAnio());
     cs.setString(4,prod.getOrigen());
     cs.setString(5, prod.getArtista());
     cs.setString(6, prod.getAlbum());

     cs.execute();
     
     ModelAndView mv = new ModelAndView();
     mv.setViewName("VentanaResultado");
     mv.addObject("mensaje", ""+prod.getTitulo()+" cargado correctamente!!!");
     
     return mv;

}




/*
@RequestMapping("/eliminarProducto")
public ModelAndView eliminarProducto(@RequestParam String id) throws SQLException {
	int idInt =Integer.parseInt(id );
	Conexion c =new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call eliminarProducto(?)}");
	cs.setInt(1,idInt);
	
	cs.execute();
	
	
     ModelAndView mv = new ModelAndView();
     mv.setViewName("VentanaResultado");
     mv.addObject("mensaje", "Producto borrado correctamente!!!");
     
     return mv;

}
*/


@RequestMapping(value= "/eliminarProducto" , method = RequestMethod.POST)
public void eliminarProducto(@RequestParam String id) throws SQLException {
	int idInt =Integer.parseInt(id);
	Conexion c =new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call eliminarProducto(?)}");
	cs.setInt(1,idInt);
	cs.execute();
     
}







@RequestMapping("/editarPelicula")
public ModelAndView editarPelicula(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c = new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call actualizarPelicula(?,?,?,?,?)    }");
	cs.setInt(1,prod.getId());
    cs.setString(2,prod.getTitulo());
    cs.setString(3,prod.getGenero());
    cs.setInt(4,prod.getAnio());
    cs.setString(5,prod.getOrigen());
    cs.execute();
    
    ModelAndView mv = new ModelAndView();
    mv.setViewName("VentanaResultado");
    mv.addObject("mensaje","Pelicula editada corretamente!");
    
    return mv;
}



@RequestMapping("/editarSerie")
public ModelAndView editarSerie(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c = new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call actualizarSerie(?,?,?,?,?,?,?)}");
	cs.setInt(1,prod.getId());
    cs.setString(2,prod.getTitulo());
    cs.setString(3,prod.getGenero());
    cs.setInt(4,prod.getAnio());
    cs.setString(5,prod.getOrigen());
    cs.setInt(6, prod.getEpisodios());
    cs.setInt(7, prod.getTemporadas());
    cs.execute();
    
    ModelAndView mv = new ModelAndView();
    mv.setViewName("VentanaResultado");
    mv.addObject("mensaje","Serie editada corretamente!");
    
    return mv;
}




@RequestMapping("/editarCancion")
public ModelAndView editarCancion(@ModelAttribute("producto") Producto prod) throws SQLException {
	Conexion c = new Conexion();
	CallableStatement cs = c.getConexion().prepareCall("{call actualizarCancion(?,?,?,?,?,?,?)  }");
	cs.setInt(1,prod.getId());
    cs.setString(2,prod.getTitulo());
    cs.setString(3,prod.getGenero());
    cs.setInt(4,prod.getAnio());
    cs.setString(5,prod.getOrigen());
    cs.setString(6, prod.getArtista());
    cs.setString(7, prod.getAlbum());
    cs.execute();
    
    ModelAndView mv = new ModelAndView();
    mv.setViewName("VentanaResultado");
    mv.addObject("mensaje","Cancion editada corretamente!");
    
    return mv;
}

    

 @RequestMapping( value= "/filtrarProductos", method= RequestMethod.GET)

 public  @ResponseBody  List<Producto> filtrarProductos(@RequestParam String titulo,@RequestParam String genero, @RequestParam String categoria,@RequestParam String anio, @RequestParam String origen,@RequestParam String min,@RequestParam String max  ) throws SQLException{
		Conexion c = new Conexion();
		
		 String sqlNormal = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria";
		    String sqlConFiltros ;
		    
		    if(  "".equals(titulo)  &&   "".equals(genero) && "".equals(categoria) && "".equals(origen) &&  "".equals(min) && "".equals(max) && "".equals(anio) ){
		        sqlConFiltros = sqlNormal;
		    }
		    else{
		        if(  min == "" && max == ""){
		            min = "0";
		            max= "10";
		        }

		        sqlConFiltros = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria where prod_titulo LIKE '%"+titulo+"%' and p.prod_año LIKE '%"+anio+"%'  and p.prod_genero LIKE '%"+genero+"%' and p.id_categoria LIKE '%"+categoria+"%' and p.prod_origen LIKE '%"+ origen+"%' and p.prod_puntaje between '"+min+"' and '"+max+"'  ";



		    }
		     
		    PreparedStatement ps;
	        ResultSet rs;
	        ps = (PreparedStatement) c.getConexion().prepareStatement(sqlConFiltros);
	        rs = ps.executeQuery();
	        
	        List <Producto> listaProductos = new ArrayList<Producto>();
	        
	        while(rs.next()) {
	       	 listaProductos.add(new Producto(rs.getInt("id_producto"),rs.getString("prod_titulo"),rs.getString("prod_genero"),rs.getString("c.cat_nombre"), rs.getInt("prod_año"),rs.getString("prod_origen"),rs.getString("prod_artista"),rs.getString("prod_album"),rs.getInt("prod_episodios"), rs.getInt("prod_temporadas"),rs.getInt("prod_puntaje") ));
	       	 
	        }
	        
	        return listaProductos;
	 
	     	        
	 
 }
 
 
 
 
 @RequestMapping(value= "/listaNombreProductos",method= RequestMethod.GET)
 public @ResponseBody List<String> listaNombreProductos() throws SQLException{
	 List<String> lista = new ArrayList<String>();
	 Conexion c = new Conexion();
	 String sql = "select prod_titulo from Producto";
	 PreparedStatement ps;
	 ResultSet rs;
	 ps= (PreparedStatement) c.getConexion().prepareStatement(sql);
	 rs = ps.executeQuery();
	 while(rs.next()) {
		 lista.add(rs.getString("prod_titulo"));
	 }
	 
	 
	 return lista;
 }

    

    
    
	
}









	

