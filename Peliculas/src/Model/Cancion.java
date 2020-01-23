package Model;

public class Cancion extends Producto {
    private String artista;
    private String album;

    public Cancion(String nombre, String genero, int anio, String origen, String artista, String album){
        this.setNombre(nombre);
        this.setGenero(genero);
        this.setAnio(anio);
        this.setOrigen(origen);
        this.setArtista(artista);
        this.setAlbum(album);
        this.setCategoria("Cancion");
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }


    public void modificarAtributos(String nuevo_titulo,String nuevo_genero, int nuevo_anio,String nuevo_origen,String nuevo_artista,String nuevo_album){
        this.setNombre(nuevo_titulo);
        this.setGenero(nuevo_genero);
        this.setAnio(nuevo_anio);
        this.setOrigen(nuevo_origen);
        this.setArtista(nuevo_artista);
        this.setAlbum(nuevo_album);


    }
}
