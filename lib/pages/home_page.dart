import 'package:drassistant/auth/auth_service.dart';
import 'package:drassistant/components/my_drawer.dart';
import 'package:drassistant/services/chat/chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
    drawer: MyDrawer(),
      body: ,
    );
  }

}