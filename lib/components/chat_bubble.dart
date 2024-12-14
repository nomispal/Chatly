import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messgae;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.messgae,
    required this.isCurrentUser}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser? Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 7.0),
      child: Text(messgae,
      style: TextStyle(
        color: Colors.white,
      ),),
    );
  }
}
