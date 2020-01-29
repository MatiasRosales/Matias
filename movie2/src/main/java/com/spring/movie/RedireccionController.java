package com.spring.movie;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedireccionController {

	
	
@RequestMapping("/irAltaProducto")
public ModelAndView irAltaProducto() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("AltaProducto");
	
	return mv;
}

@RequestMapping("/irCargarComentario")
public ModelAndView irCargarComentario(@RequestParam String id) {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("CargarComentario2");
	mv.addObject("id",id);
	return mv;
}

/*

@RequestMapping("/irListadoProductos")
public ModelAndView cargarListadoProductos(@ModelAttribute("FiltroProductos") FiltroProductos filtroProd) throws SQLException {
	Conexion c = new Conexion();
	
	 String sqlNormal = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria";
	    String sqlConFiltros ;
	    
	    if(  "".equals(filtroProd.getTitulo())  &&   "".equals(filtroProd.getGenero()) && "".equals(filtroProd.getCategoria()) && "".equals(filtroProd.getOrigen()) &&  "".equals(filtroProd.getMin()) && "".equals(filtroProd.getMax())  ){
	        sqlConFiltros = sqlNormal;
	    }
	    else{
	        if(  filtroProd.getMin() == "" && filtroProd.getMax() == ""){
	            filtroProd.setMin("0");
	            filtroProd.setMax("10");
	        }

	        sqlConFiltros = "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria where prod_titulo LIKE '%"+filtroProd.getTitulo()+"%' and p.prod_genero LIKE '%"+filtroProd.getGenero()+"%' and p.id_categoria LIKE '%"+filtroProd.getCategoria()+"%' and p.prod_origen LIKE '%"+ filtroProd.getOrigen()+"%' and p.prod_puntaje between '"+filtroProd.getMin()+"' and '"+filtroProd.getMax()+"'  ";



	    }
	    if( filtroProd.getTitulo() == null && filtroProd.getGenero()== null && filtroProd.getCategoria() == null && filtroProd.getOrigen()==null && filtroProd.getMin()== null && filtroProd.getMax() == null  ){
	        sqlConFiltros = sqlNormal;
	    }    
	    PreparedStatement ps;
        ResultSet rs;
        ps = (PreparedStatement) c.getConexion().prepareStatement(sqlConFiltros);
        rs = ps.executeQuery();
        
     ModelAndView mv = new ModelAndView();
     mv.setViewName("ListadoProductos");
     List <Producto> productos = new ArrayList<Producto>();
     
     while(rs.next()) {
    	 productos.add(new Producto(rs.getInt("id_producto"),rs.getString("prod_titulo"),rs.getString("prod_genero"),rs.getString("c.cat_nombre"), rs.getInt("prod_año"),rs.getString("prod_origen"),rs.getString("prod_artista"),rs.getString("prod_album"),rs.getInt("prod_episodios"), rs.getInt("prod_temporadas"),rs.getInt("prod_puntaje") ));
    	 
     }
     
     mv.addObject("listaProductos",productos);
     
     
     return mv;

}
*/
@RequestMapping("/irListadoProductos")
public ModelAndView cargarListadoProductos() throws SQLException {
	Conexion c = new Conexion();
	
	 String sql= "Select id_producto,prod_titulo,prod_genero,c.cat_nombre,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas,prod_puntaje from producto p join categoria c on c.id_categoria = p.id_categoria";
	  
	    PreparedStatement ps;
        ResultSet rs;
        ps = (PreparedStatement) c.getConexion().prepareStatement(sql);
        rs = ps.executeQuery();
        
    
     List <Producto> productos = new ArrayList<Producto>();
     
     while(rs.next()) {
    	 productos.add(new Producto(rs.getInt("id_producto"),rs.getString("prod_titulo"),rs.getString("prod_genero"),rs.getString("c.cat_nombre"), rs.getInt("prod_año"),rs.getString("prod_origen"),rs.getString("prod_artista"),rs.getString("prod_album"),rs.getInt("prod_episodios"), rs.getInt("prod_temporadas"),rs.getInt("prod_puntaje") ));
    	 
     }
     ModelAndView mv = new ModelAndView();
     mv.setViewName("ListadoProductos"); 
     mv.addObject("listaProductos",productos);
     
     
     return mv;

}




@RequestMapping("/irEditarPelicula")
public ModelAndView irEditarPelicula(@RequestParam String id) throws SQLException {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("editarPelicula");
	Conexion c = new Conexion();
	int idInt = Integer.parseInt(id);
	PreparedStatement ps;
    ResultSet rs;
    ps = c.getConexion().prepareStatement("select id_producto,prod_titulo,prod_genero,prod_año,prod_origen from Producto where id_producto = ? ");
    ps.setInt(1,idInt);
    rs = ps.executeQuery();
    Producto prod = new Producto();
    while(rs.next()) {
    	prod.setId( rs.getInt("id_producto")  );
    	prod.setTitulo(rs.getString("prod_titulo"));
    	prod.setGenero(rs.getString("prod_genero"));
    	prod.setAnio(rs.getInt("prod_año"));
    	prod.setOrigen(rs.getString("prod_origen"));
    }
    
    
    mv.addObject("id",prod.getId());
    mv.addObject("titulo",prod.getTitulo());
    mv.addObject("genero",prod.getGenero());
    mv.addObject("anio",prod.getAnio());
    mv.addObject("origen",prod.getOrigen());
	
	
	return mv;
}
@RequestMapping("/irEditarSerie")
public ModelAndView irEditarSerie(@RequestParam String id) throws SQLException {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("editarSerie");
	Conexion c = new Conexion();
	int idInt = Integer.parseInt(id);
	PreparedStatement ps;
    ResultSet rs;
    ps = c.getConexion().prepareStatement("select id_producto,prod_titulo,prod_genero,prod_año,prod_origen,prod_episodios,prod_temporadas from Producto where id_producto = ? ");
    ps.setInt(1,idInt);
    rs = ps.executeQuery();
    Producto prod = new Producto();
    while(rs.next()) {
    	prod.setId( rs.getInt("id_producto")  );
    	prod.setTitulo(rs.getString("prod_titulo"));
    	prod.setGenero(rs.getString("prod_genero"));
    	prod.setAnio(rs.getInt("prod_año"));
    	prod.setOrigen(rs.getString("prod_origen"));
    	prod.setEpisodios(rs.getInt("prod_episodios"));
    	prod.setTemporadas(rs.getInt("prod_temporadas"));
    }
    
    
    mv.addObject("id",prod.getId());
    mv.addObject("titulo",prod.getTitulo());
    mv.addObject("genero",prod.getGenero());
    mv.addObject("anio",prod.getAnio());
    mv.addObject("origen",prod.getOrigen());
    mv.addObject("episodios",prod.getEpisodios());
    mv.addObject("temporadas",prod.getTemporadas());
	
	
	return mv;
}

@RequestMapping("/irEditarCancion")
public ModelAndView irEditarCancion(@RequestParam String id) throws SQLException {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("editarCancion");
	Conexion c = new Conexion();
	int idInt = Integer.parseInt(id);
	PreparedStatement ps;
    ResultSet rs;
    ps = c.getConexion().prepareStatement("select id_producto,prod_titulo,prod_genero,prod_año,prod_origen,prod_artista,prod_album from Producto where id_producto = ? ");
    ps.setInt(1,idInt);
    rs = ps.executeQuery();
    Producto prod = new Producto();
    while(rs.next()) {
    	prod.setId( rs.getInt("id_producto")  );
    	prod.setTitulo(rs.getString("prod_titulo"));
    	prod.setGenero(rs.getString("prod_genero"));
    	prod.setAnio(rs.getInt("prod_año"));
    	prod.setOrigen(rs.getString("prod_origen"));
    	prod.setArtista(rs.getString("prod_artista"));
    	prod.setAlbum(rs.getString("prod_album"));
    }
    
    
    mv.addObject("id",prod.getId());
    mv.addObject("titulo",prod.getTitulo());
    mv.addObject("genero",prod.getGenero());
    mv.addObject("anio",prod.getAnio());
    mv.addObject("origen",prod.getOrigen());
    mv.addObject("artista",prod.getArtista());
    mv.addObject("album",prod.getAlbum());

	
	return mv;
}

@RequestMapping("/irEditarComentario")
public ModelAndView irEditarComentario(@RequestParam String id) throws SQLException{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("editarComentario");
	Conexion c = new Conexion();
	int idInt = Integer.parseInt(id);
	PreparedStatement ps;
    ResultSet rs;
    ps = c.getConexion().prepareStatement("select id_comentario,com_usuario,com_mensaje,com_puntaje from comentario where id_comentario = ? ");
    ps.setInt(1,idInt);
    rs = ps.executeQuery();
	Comentario comentario = new Comentario();
	while(rs.next()) {
		comentario.setId(rs.getInt("id_comentario"));
		comentario.setUsuario(rs.getString("com_usuario"));
		comentario.setMensaje(rs.getString("com_mensaje"));
		comentario.setPuntaje(rs.getInt("com_puntaje"));
	}
	
	mv.addObject("id",comentario.getId());
	mv.addObject("usuario",comentario.getUsuario());
	mv.addObject("puntaje",comentario.getPuntaje());
	mv.addObject("mensaje",comentario.getMensaje());
	
	return mv;
	
}






}





	

