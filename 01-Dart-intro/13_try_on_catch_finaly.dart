void main() async {
  print('inicio del programa');

  try {
    final value = await httpget('http://google.com.co');
    print('Exito: $value');
  } on Exception catch(err) {
    print('tenemos una exeption: $err');
  } catch (err) {
    print('OPPS algo salio mal!!: $err');
  } finally {
    print('fin del try catch');
  }

  print('Fin del programa');
}

Future<String> httpget(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw Exception('No hay parametros en el URL');

  //throw 'error en la peticion';
  //return 'valor de retorno';
}
