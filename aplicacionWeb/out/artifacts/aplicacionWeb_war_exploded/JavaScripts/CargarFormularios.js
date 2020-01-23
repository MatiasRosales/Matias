
function abrirFormularioPeliculas(){
document.getElementById("bloqueFormularioPelicula").style.display = "block"  ;
    document.getElementById("bloqueFormularioSerie").style.display = "none"  ;
    document.getElementById("bloqueFormularioCancion").style.display = "none"  ;

}

function abrirFormularioSerie(){
    document.getElementById("bloqueFormularioSerie").style.display = "block"  ;
    document.getElementById("bloqueFormularioPelicula").style.display = "none";
    document.getElementById("bloqueFormularioCancion").style.display = "none"  ;
}


function abrirFormularioCancion(){
    document.getElementById("bloqueFormularioCancion").style.display = "block"  ;
    document.getElementById("bloqueFormularioPelicula").style.display = "none";
    document.getElementById("bloqueFormularioSerie").style.display = "none"  ;
}

function resetForm(form) {
    // clearing inputs
    var inputs = form.getElementsByTagName('input');
    for (var i = 0; i<inputs.length; i++) {
        switch (inputs[i].type) {
            case 'hidden':
            case 'text':
                inputs[i].value = '';
                break;
            case 'radio':
            case 'checkbox':
                inputs[i].checked = false;
        }
    }

    // clearing selects
    var selects = form.getElementsByTagName('select');
    for (var i = 0; i<selects.length; i++)
        selects[i].selectedIndex = 0;

    // clearing textarea
    var text= form.getElementsByTagName('textarea');
    for (var i = 0; i<text.length; i++)
        text[i].innerHTML= '';

    return false;
}

var idMarcado = null;
var marcado=null;
function marcar(fila) {
    fila.style.background = 'red';
    idMarcado = fila.id;
    if (marcado!=null)
        marcado.style.background = '';
    marcado = fila;
}

function editarProducto(){

    if(idMarcado != null){
        var fila = document.getElementById(idMarcado);
            var categoria = fila.cells.item(3).innerText;


        location.href = 'editar'+categoria+'.jsp?id='+idMarcado;
    }

}


function eliminarProducto(){

    if(idMarcado != null){
        location.href = 'eliminar.jsp?id='+idMarcado;
    }

}

function verComentarios(){
    if(idMarcado!= null){
        location.href = 'listadoComentario.jsp?id='+idMarcado;
    }


}

function eliminarComentario(){
    if(idMarcado!= null){
        location.href = 'eliminarComentario.jsp?id='+idMarcado;
    }
}


function editarComentario(){
    if(idMarcado!= null){
        location.href = 'editarComentario.jsp?id='+idMarcado;
    }
}

function cargarComentario(){
    if(idMarcado!= null){
        location.href = 'cargarComentario.jsp?id='+idMarcado;
}
}