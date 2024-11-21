import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Message{
  final String senderID;
  final String senderEmail;
  final String recevierID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.recevierID,
    required this.message,
    required this.timestamp,
  });


  // convert to a map
  Map<String, dynamic> toMap(){
    return {
      'senderID':senderID,
    'senderEmail':senderEmail,
    'receiverID':recevierID,
    'receiverEmail':message,
  };
  }

}