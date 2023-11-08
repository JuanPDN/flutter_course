import 'package:flutter/material.dart';

class CouterFunctionsScreen extends StatefulWidget {
  const CouterFunctionsScreen({super.key});

  @override
  State<CouterFunctionsScreen> createState() => _CouterFunctionsScreenState();
}

class _CouterFunctionsScreenState extends State<CouterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter Functions'), actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtom(
              icon: Icons.refresh_outlined,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
              icon: Icons.plus_one_outlined,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                setState(() {
                  if(clickCounter == 0) return;
                  clickCounter--;
                });
              },
            )
          ],
        ));
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButtom({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
