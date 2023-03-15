void main() {
  
  //se crea una instancia de la clase
  final wolverine = new Heroe( 'Logan','Regeneración');
    
  print( wolverine ); //se imprime el contenido que tiene la instancia
}

//Declaración de clase
class Heroe {
  //Declaracion de propiedades 
  String nombre;
  String poder;
  
  //Asignar y obetner el argumento
  Heroe(
    this.nombre, 
    this.poder 
  );
  
  //Retornar las propiedades nombre y poder
  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${ this.poder }';
  }
  
}


