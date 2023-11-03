void main() {
  print('inicio del programa');

  httpget('http://google.com.co').then((value) {
    print(value);
  }).catchError((err) {
    print('Error: $err');
  });

  print('Fin del programa');
}

Future<String> httpget(String url) {
  return Future.delayed(const Duration(seconds: 1), () {
    throw 'error en la petición http';
    //return 'respuesta de la petición http';
  });
}
