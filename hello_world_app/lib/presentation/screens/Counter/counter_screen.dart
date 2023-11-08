import 'package:flutter/material.dart';

class CouterScreen extends StatefulWidget {
  const CouterScreen({super.key});

  @override
  State<CouterScreen> createState() => _CouterScreenState();
}

class _CouterScreenState extends State<CouterScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            const Text('Clicks', style: TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter += 1;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
