package Test;

import Exceptions.ProductoNotFoundException;
import Model.*;
import org.junit.Assert;
import org.junit.Before;

import static org.junit.jupiter.api.Assertions.*;

class SistemaTest {

public Sistema sistema = new Sistema();

@Before
    public void setUp(){

    Cancion despacito = new Cancion("Despacito","Reggaeton",2017,"Puerto Rico","luis Fonsi","Despacio");
    Cancion despacito2 = new Cancion("Despacito 2","Reggaeton",2019,"Puerto Rico","luis Fonsi","Despacio");
    Pelicula rocky5  = new Pelicula("Rocky 5","Accion",1990,"Estados Unidos");
    Pelicula rocky2 = new Pelicula("Rocky 2","Accion",1980,"canada");
    Serie serie1 = new Serie("Stranger Things","Misterio",2016,"Estados unidos",50,3);
    Serie serie2 = new Serie("Night in the Woods","Drama",2017,"Canada",3,1);
    rocky2.crearComentario("usuario1","Buena peli",8);
    rocky2.crearComentario("usuario2","excelente",10);
    rocky5.crearComentario("usuario1","la 2 es mejor",6);

sistema.addProducto(despacito);
sistema.addProducto(despacito2);
sistema.addProducto(rocky5);
sistema.addProducto(rocky2);
sistema.addProducto(serie1);
sistema.addProducto(serie2);

}

    @org.junit.jupiter.api.Test
    void addProducto() {
    this.setUp();
        Cancion despacito3 = new Cancion("Despacito 3","Reggaeton",2020,"Puerto Rico","luis Fonsi","Despacio");
sistema.addProducto(despacito3);
        Assert.assertEquals(true, sistema.getProductos().contains(despacito3)  );
        Assert.assertEquals(7,sistema.getProductos().size());

    }





    @org.junit.jupiter.api.Test
    void obtenerListadoDePeliculas() {
        this.setUp();
          Assert.assertEquals( 2,  sistema.obtenerListado("Pelicula").size()      );
    }

    @org.junit.jupiter.api.Test
    void obtenerListadoDeSeries() {
        this.setUp();
        Assert.assertEquals( 2,  sistema.obtenerListado("Serie").size()      );
    }

    @org.junit.jupiter.api.Test
    void obtenerListadoDeCanciones() {
        this.setUp();
        Assert.assertEquals( 2,  sistema.obtenerListado("Cancion").size() );
    }

    @org.junit.jupiter.api.Test
    void obtenerListadoDeSeriesVacio() {
        Assert.assertEquals( 0,  sistema.obtenerListado("Serie").size()      );
    }




    @org.junit.jupiter.api.Test
    void buscarPeliculasPorNombre() throws ProductoNotFoundException {
    this.setUp();
        Pelicula rocky5  = new Pelicula("Rocky 5","Accion",1990,"Estados Unidos");
    Assert.assertEquals(rocky5.getNombre(), sistema.buscarPorNombre("Rocky 5","Pelicula").getNombre() );
        Assert.assertEquals(rocky5.getGenero(), sistema.buscarPorNombre("Rocky 5","Pelicula").getGenero() );
    }

    @org.junit.jupiter.api.Test
    void buscarPeliculasPorNombreNoExistente() throws ProductoNotFoundException {
        this.setUp();

        assertThrows( ProductoNotFoundException.class, ()-> { sistema.buscarPorNombre("Despacito","Pelicula");   }  );
    }

    @org.junit.jupiter.api.Test
    void buscarPeliculasPorGenero(){
        this.setUp();
        Assert.assertEquals(2,sistema.buscarPorGenero("Accion","Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarPeliculasPorGeneroComedia(){
        this.setUp();
        Assert.assertEquals(0,sistema.buscarPorGenero("Comedia","Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarPeliculasPorPuntajeHasta9(){
        this.setUp();
        Assert.assertEquals(2,sistema.buscarPorPuntaje(1,9,"Pelicula").size());
    }
    @org.junit.jupiter.api.Test
    void buscarPeliculasPorPuntajeHasta7(){
        this.setUp();
        Assert.assertEquals(1,sistema.buscarPorPuntaje(1,7,"Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarMalasPeliculas(){
        this.setUp();
        Assert.assertEquals(0,sistema.buscarPorPuntaje(2,5,"Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarporAño(){
        this.setUp();
        Assert.assertEquals(1,sistema.buscarPorAño(1980,"Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarporAñoActual(){
        this.setUp();
        Assert.assertEquals(0,sistema.buscarPorAño(2020,"Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarPorOrigen(){
        this.setUp();
        Assert.assertEquals(1,sistema.buscarPorOrigen("Estados Unidos","Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void buscarPorOrigenVacio(){
        this.setUp();
        Assert.assertEquals(0,sistema.buscarPorOrigen("Argentina","Pelicula").size());
    }

    @org.junit.jupiter.api.Test
    void EliminarProducto(){
        this.setUp();
        Cancion despacito3 = new Cancion("Despacito 3","Reggaeton",2020,"Puerto Rico","luis Fonsi","Despacio");
        sistema.addProducto(despacito3);
        Assert.assertEquals(true, sistema.getProductos().contains(despacito3) );
        sistema.eliminarProducto(despacito3);
        Assert.assertEquals(false, sistema.getProductos().contains(despacito3) );
    }

    @org.junit.jupiter.api.Test
    void EliminarComentario(){
        Pelicula rocky2 = new Pelicula("Rocky 2","Accion",1980,"canada");
        Comentario comentario = new Comentario("usuario3","gg",7);
        rocky2.crearComentario("usuario1","Buena peli",8);
        rocky2.crearComentario("usuario2","excelente",10);
        rocky2.addComentario(comentario);
        Assert.assertEquals(3,rocky2.getComentarios().size());
        rocky2.eliminarComentario(comentario);
        Assert.assertEquals(2,rocky2.getComentarios().size());
    }


    @org.junit.jupiter.api.Test

    void modificarPelicula() throws ProductoNotFoundException {
    this.setUp();
    sistema.modificarPelicula("Rocky 2","Rocky balboa 2","Romance",1991,"China");
        Assert.assertEquals("Rocky balboa 2", sistema.buscarPorNombre("Rocky balboa 2","Pelicula").getNombre() );
        Assert.assertEquals("Romance", sistema.buscarPorNombre("Rocky balboa 2","Pelicula").getGenero() );
    }

    @org.junit.jupiter.api.Test
    void modificarComentario(){
        Pelicula rocky2 = new Pelicula("Rocky 2","Accion",1980,"canada");
        Comentario comentario = new Comentario("usuario3","gg",7);
        rocky2.addComentario(comentario);
        rocky2.modificarComentario(comentario,"usuario4","malisimo",2);
        Assert.assertEquals( 2, rocky2.getPuntaje());
    }



























}