void main() {
  List<int> numeros = [1,2,3,4,5]; //Definición de lista con tipo de datos enteros
  print( numeros ); //Se imprime lista
  
  numeros.add(6); //Se agrega el numero 6 a la lista numeros.
  print( numeros ); //Se vuelve a imprimir la lista para que actualice los valores.
  
  
  // Tamaño fijo
  //Esta funcion (generate) genera una lista con los elementos que le des por argumentos.
  final masNumeros = List.generate(10, (index) => index); //Esta funcion genera una lista con los elementos que le des por argumentos.
  print("\n");
  print(masNumeros);
//   masNumeros.add(1); Esto no es correcto
masNumeros[3] = 1; //esta cambiando el valor de 3 por el numero 1.
print( masNumeros); //Se actualiza lista
  
}