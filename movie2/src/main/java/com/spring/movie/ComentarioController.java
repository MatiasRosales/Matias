package com.spring.movie;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;

@Controller
public class ComentarioController {

@RequestMapping("/mostrarComentarios")
public ModelAndView mostrarComentarios(@RequestParam String id ) throws SQLException {
	int idInt = Integer.parseInt(id);
	Producto prod = new Producto();
	List<Comentario> comentarios = new ArrayList<Comentario>();
	ModelAndView mv = new ModelAndView();
	mv.setViewName("listadoComentario");
	Conexion c = new Conexion();
	PreparedStatement ps;
    ResultSet rs;
    ps = (PreparedStatement) c.getConexion().prepareStatement("select id_comentario,com_usuario,com_mensaje,com_puntaje from comentario where id_producto = ?");
    ps.setInt(1,idInt);
    rs = ps.executeQuery();
    
    while(rs.next()) {
    	comentarios.add(new Comentario(rs.getInt("id_comentario"),rs.getString("com_usuario"),rs.getString("com_mensaje"),rs.getInt("com_puntaje")));
    }
    
    
    PreparedStatement ps2 = (PreparedStatement) c.getConexion().prepareStatement("select prod_titulo,prod_puntaje from producto where id_producto = ?");
    ResultSet rs2;
    ps2.setInt(1,idInt);
    rs2 = ps2.executeQuery();

while(rs2.next()) {
	 prod.setPuntaje(rs2.getInt("prod_puntaje"));
	    prod.setTitulo(rs2.getString("prod_titulo")); 
	
}
   
mv.addObject("titulo",prod.getTitulo());
mv.addObject("puntuacion",prod.getPuntaje());
mv.addObject("listaComentarios",comentarios);
    
	return mv;
	
}

@RequestMapping("/subirComentario")
public ModelAndView subirComentario(@ModelAttribute("comentario") Comentario comentario ) throws SQLException {
ModelAndView mv = new ModelAndView();
Conexion c = new Conexion();
CallableStatement sp =  (CallableStatement) c.getConexion().prepareCall("{call nuevoComentario(?,?,?,?)}");
sp.setInt(1,comentario.getId());
sp.setString(2,comentario.getUsuario());
sp.setString(3,comentario.getMensaje());
sp.setInt(4,comentario.getPuntaje());

sp.execute();

mv.setViewName("VentanaResultado");
mv.addObject("mensaje","Comentario añadido!!");

return mv;
		
}

@RequestMapping("/editarComentario")
public ModelAndView editarComentario(@ModelAttribute("comentario") Comentario comentario )throws SQLException  {
	ModelAndView mv = new ModelAndView();
	Conexion c = new Conexion();
	CallableStatement sp =  (CallableStatement) c.getConexion().prepareCall("{call actualizarComentario(?,?,?,?)}");
	sp.setInt(1,comentario.getId());
	sp.setString(2,comentario.getUsuario());
	sp.setString(3,comentario.getMensaje());
	sp.setInt(4,comentario.getPuntaje());

	sp.execute();

	mv.setViewName("VentanaResultado");
	mv.addObject("mensaje","Comentario editado!!");

	return mv;
			
	
	
}


@RequestMapping("/eliminarComentario")
public ModelAndView eliminarComentario(@RequestParam String id) throws SQLException {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("VentanaResultado");
	Conexion c = new Conexion();
	 CallableStatement cs = (CallableStatement) c.getConexion().prepareCall("{call eliminarComentario(?)}");
	int idInt = Integer.parseInt(id);
	 cs.setInt(1,idInt);
	
	 cs.execute();
	mv.addObject("mensaje", "Comentario Eliminado");
	return mv;
}







}



