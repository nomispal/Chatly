import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drassistant/auth/auth_service.dart';
import 'package:drassistant/components/chat_bubble.dart';
import 'package:drassistant/components/my_textfield.dart';
import 'package:drassistant/services/chat/chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // Text Controller
  final TextEditingController _messageController = TextEditingController();

  // chat and auth services
  final ChatService _chatService = ChatService();

  final AuthService _authService = AuthService();

  // send messages
  void SendMessages() async {
    // if there iss something in the message
    if (_messageController.text.isNotEmpty) {
      //send message
      await _chatService.sendMessage(receiverID, _messageController.text.trim());

      // clear the text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text(receiverEmail,
          style: TextStyle(
            color: Colors.grey,
          ),),
      ),
      body: Column(
        children: [
          // dislay all messages
          Expanded(
            child: _buildMessageList(),
          ),
          // user input
          _buildUserInput()
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    String senderID = _authService.getcurrentuser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return Text("Error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading..");
        }
        //build list view
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // if it is current user

    bool isCurrentUser = data['senderID'] == _authService.getcurrentuser()!.uid;


    // Allign messages to the right otherwise allign in to the left
    var allignment = isCurrentUser? Alignment.centerRight : Alignment.centerLeft;


    return Container
      (
        child: Column(
          crossAxisAlignment:
          isCurrentUser? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(isCurrentUser: isCurrentUser ,
          messgae: data["message"],
          )
        ],
      ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Row(
        children: [
          // text fiel should take most of the space
          Expanded(
              child: MyTextField(
                  hintText: "Type a Message",
                  obscureText: false,
                  controller: _messageController)
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(Icons.arrow_upward),
              color: Colors.white,
              onPressed: SendMessages,
            ),
          ),
        ],
      ),
    );
  }
}