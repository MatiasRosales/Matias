package Model;

public class Serie extends Producto {
    private int cantidadDeEpisodios;
    private int cantidadDeTemporadas;


    public Serie(String nombre, String genero, int anio, String origen, int cantEpis, int cantTemp){
        this.setNombre(nombre);
        this.setGenero(genero);
        this.setAnio(anio);
        this.setOrigen(origen);
        this.setCantidadDeEpisodios(cantEpis);
        this.setCantidadDeTemporadas(cantTemp);
        this.setCategoria("Serie");
    }


    public int getCantidadDeEpisodios() {
        return cantidadDeEpisodios;
    }

    public void setCantidadDeEpisodios(int cantidadDeEpisodios) {
        this.cantidadDeEpisodios = cantidadDeEpisodios;
    }

    public int getCantidadDeTemporadas() {
        return cantidadDeTemporadas;
    }

    public void setCantidadDeTemporadas(int cantidadDeTemporadas) {
        this.cantidadDeTemporadas = cantidadDeTemporadas;
    }

    public void modificarAtributos(String nuevo_titulo,String nuevo_genero, int nuevo_anio,String nuevo_origen,int cantidadDeEpisodios,int cantidadDeTemporadas){
        this.setNombre(nuevo_titulo);
        this.setGenero(nuevo_genero);
        this.setAnio(nuevo_anio);
        this.setOrigen(nuevo_origen);
        this.setCantidadDeEpisodios(cantidadDeEpisodios);
        this.setCantidadDeTemporadas(cantidadDeTemporadas);


    }


}
