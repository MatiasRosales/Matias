package Model;

public class Pelicula extends Producto {

    public Pelicula(String nombre, String genero, int anio, String origen){
        this.setNombre(nombre);
        this.setGenero(genero);
        this.setAnio(anio);
        this.setOrigen(origen);
        this.setCategoria("Pelicula");

    }


    public void modificarAtributos(String nuevo_titulo,String nuevo_genero, int nuevo_anio,String nuevo_origen){
        this.setNombre(nuevo_titulo);
        this.setGenero(nuevo_genero);
        this.setAnio(nuevo_anio);
        this.setOrigen(nuevo_origen);
    }



}
