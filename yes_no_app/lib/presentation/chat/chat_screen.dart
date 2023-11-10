import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-DcLpLT7UOE9utjAoU63lFF5F0uf4_heZyS4x-Eir1Kk7ReM77RZ4pzUj4A46HD9CP3o&usqp=CAU'),
          ),
        ),
        centerTitle: true,
        title: const Text('Chat de prueba'),
      ),
    );
  }
}