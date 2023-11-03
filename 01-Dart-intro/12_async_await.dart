void main() async {
  print('inicio del programa');

  try {
    final value = await httpget('http://google.com.co');
    print(value);
  } catch (err) {
    print('error: $err');
  }

  print('Fin del programa');
}

Future<String> httpget(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw 'error en la peticion';
  //return 'valor de retorno';
}
