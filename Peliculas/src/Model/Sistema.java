package Model;

import Exceptions.ProductoNotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Sistema {
    private List<Producto> productos = new ArrayList<>();

    public List<Producto> getProductos() {
        return productos;
    }


    public void addProducto(Producto p){
        this.productos.add(p);
    }

    public void verificarProductoporNombre(String nombre, String categoria) throws ProductoNotFoundException {
        if(   obtenerListado(categoria).stream().filter(producto -> producto.getNombre().equals(nombre)).count() != 1){
            throw new ProductoNotFoundException("pelicula no encontrada");
        }

    }
    public Producto buscarPorNombre(String nombre, String categoria) throws ProductoNotFoundException {
        verificarProductoporNombre(nombre,categoria);
        List<Producto> peliculas = this.obtenerListado(categoria);
        return peliculas.stream().filter(producto -> producto.getNombre().equals(nombre)).collect(Collectors.toList()).get(0);

    }
    public List<Producto> obtenerListado(String categoria){
        return productos.stream().filter(producto -> producto.getCategoria().equals(categoria)).collect(Collectors.toList());
    }
    public List<Producto> buscarPorGenero(String genero,String categoria) {
        return obtenerListado(categoria).stream().filter(producto -> producto.getGenero().equals(genero)).collect(Collectors.toList());

    }

    public List<Producto> buscarPorPuntaje(int min, int max, String categoria){
        return this.obtenerListado(categoria).stream().filter( producto -> producto.getPuntaje() >= min && producto.getPuntaje() <= max    ).collect(Collectors.toList());
    }

    public List<Producto> buscarPorAño(int año,String categoria){
        return obtenerListado(categoria).stream().filter(producto -> producto.getAnio() == año).collect(Collectors.toList());
    }

    public List<Producto> buscarPorOrigen(String origen,String categoria){
        return obtenerListado(categoria).stream().filter(producto -> producto.getOrigen().equals(origen)).collect(Collectors.toList());
    }

    public void eliminarProducto(Producto producto){
        this.productos.remove(producto);
    }

    public void modificarPelicula(String titulo, String nuevo_titulo,String nuevo_genero,int nuevo_anio, String nuevo_origen ) throws ProductoNotFoundException {
       Pelicula producto = (Pelicula) buscarPorNombre(titulo,"Pelicula");
        producto.modificarAtributos(nuevo_titulo,nuevo_genero,nuevo_anio,nuevo_origen);
    }
    public void modificarCancion(String titulo, String nuevo_titulo,String nuevo_genero,int nuevo_anio, String nuevo_origen,String nuevo_artista,String nuevo_album ) throws ProductoNotFoundException {
        Cancion producto = (Cancion) buscarPorNombre(titulo,"Cancion");
        producto.modificarAtributos(nuevo_titulo,nuevo_genero,nuevo_anio,nuevo_origen,nuevo_artista,nuevo_album);
    }

    public void modificarSerie(String titulo, String nuevo_titulo,String nuevo_genero,int nuevo_anio, String nuevo_origen,int cantidadEpisodios, int cantidadTemporadas ) throws ProductoNotFoundException {
        Serie producto = (Serie) buscarPorNombre(titulo,"Serie");
        producto.modificarAtributos(nuevo_titulo,nuevo_genero,nuevo_anio,nuevo_origen,cantidadEpisodios,cantidadTemporadas);
    }



}
