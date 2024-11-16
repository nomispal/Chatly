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
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context,snapshot){
          //error
    if(snapshot.hasError){
      return const Text("Error");
    }
    if(snapshot.connectionState==ConnectionState.waiting){
      return const Text("loading..");
    }
    return ListView(
    children:
      snapshot.data!.map<Widget>((userData)=>_buildUserListItem).toList(),
    );
    });
  }
  Widget <_buildUserListItem>{}

}