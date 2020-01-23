package Model;

import javax.jnlp.ClipboardService;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Producto {

    private String nombre;
    private String genero;
    private int anio;
    private String origen;
    private int puntaje = 0;
    private List<Comentario> comentarios = new ArrayList<>();
    private String categoria;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public List<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios) {
        this.comentarios = comentarios;
    }
    public void addComentario(Comentario comentario){
        this.comentarios.add(comentario);
        this.actualizarPuntaje();
    }
    public void actualizarPuntaje(){
        List<Integer> listapuntajes = comentarios.stream().map(Comentario::getPuntaje).collect(Collectors.toList());
        int cantElementos = listapuntajes.size();
        int sumaPuntaje = listapuntajes.stream().mapToInt(Integer::intValue).sum();
        this.puntaje = ( sumaPuntaje / cantElementos   );
    }

    public void crearComentario(String usuario, String comentario, int puntaje){
        Comentario nuevoComentario = new Comentario(usuario,comentario,puntaje);
        this.addComentario(nuevoComentario);
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void eliminarComentario(Comentario comentario){
        comentarios.remove(comentario);
        actualizarPuntaje();
    }

    public void modificarComentario(Comentario comentario,String nuevo_usuario,String nuevo_comentario,int nuevo_puntaje){
        comentario.modificarAtributos(nuevo_usuario,nuevo_comentario,nuevo_puntaje);
        actualizarPuntaje();
    }
}
