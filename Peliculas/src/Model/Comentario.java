package Model;

public class Comentario {
    private String autor;
    private String comentario;
    private int puntaje;

    public Comentario(String autor, String comentario, int puntaje){
        this.autor = autor;
        this.comentario = comentario;
        this.puntaje = puntaje;
    }


    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }


    public void modificarAtributos(String usuario,String comentario,int nuevo_puntaje){
        this.puntaje = nuevo_puntaje;
        this.autor = usuario;
        this.comentario = comentario;
    }
}
