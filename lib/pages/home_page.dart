import 'package:drassistant/auth/auth_service.dart';
import 'package:drassistant/components/my_drawer.dart';
import 'package:drassistant/services/chat/chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import 'chat_page.dart';

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

  //build a list of user currently loggedin
Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot){
          //error
          if(snapshot.hasError){
            return Text("Error");
          }
          //loading....
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text("Waiting");
          }
          //return listview
          return ListView(
            children: snapshot.data!.map<Widget>((userData)=>_buildUserListItem(userData,context)).toList(),
          );
        }
    );
}

 //build individual list title for user

Widget _buildUserListItem(Map<String,dynamic> userData, BuildContext context){
    return UserTile(
      text: userData["Email"],
      ontap: (){
        // tapped on a user go to chat page
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                    receiverEmail: userData["Email"]),)
        );
      },
    );
}

}