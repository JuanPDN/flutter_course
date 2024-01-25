import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = (SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam finibus aliquet ligula dapibus suscipit. Proin rutrum ante eu pharetra laoreet. Ut non nisl id erat commodo pretium non vel nibh.'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam finibus aliquet ligula dapibus suscipit. Proin rutrum ante eu pharetra laoreet. Ut non nisl id erat commodo pretium non vel nibh. Fusce gravida blandit facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget sapien vitae metus dignissim tincidunt. Nunc consectetur hendrerit risus, faucibus bibendum enim vehicula eu. Sed vehicula fermentum ultricies. Sed venenatis purus sed purus dignissim, ut molestie diam sollicitudin. Pellentesque gravida sem sit amet sem accumsan aliquam. Nulla malesuada scelerisque rutrum. Donec non leo at purus venenatis blandit in eget libero.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Dialogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
