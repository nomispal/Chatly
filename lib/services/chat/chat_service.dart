import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drassistant/models/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String,dynamic>>> getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        // go through each indiviual user
        final user = doc.data();
        // retrun user
        return user;
      }).toList();
    });
  }
   // send message
   Future<void> sendMessage(String receiverID, message) async{
    // get current user info
     final String currentUserID = _auth.currentUser!.uid;
     final String currentUserEmail = _auth.currentUser!.email!;
     final Timestamp timestamp = Timestamp.now();


    // create a new message
     Message newMessage = Message(
         senderID: currentUserID,
         senderEmail: currentUserEmail,
         recevierID: receiverID,
         timestamp: timestamp,
       message: message,
     );

     // construct chat room ID for the two Users (sorted  to ensure  uniqueness)
     List<String> ids = [currentUserID,receiverID];
     ids.sort();//sort th ids (this ensure the chatroomID is the same for two people)
     String chatRoomID = ids.join('_');

     // add new messages to database
     await _firestore
         .collection("chat_rooms")
         .doc(chatRoomID)
         .collection("messages")
         .add(newMessage.toMap());

      }

  // get message

}