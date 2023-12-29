import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola Mundo', fromWho: FromWho.me),
    Message(text: 'Second Message ?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    
  }
}
