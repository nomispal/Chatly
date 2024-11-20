import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user
  User? getcurrentuser() {
    return _auth.currentUser;
  }
  //sign in
  Future<UserCredential> signInWithEmailPassword(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save user info if it does not exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid,
            'email' : email,
          }
      );
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }  //sign up
  Future<UserCredential> signupWithEmailPassword(String email,String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // save user in an seprate document
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email' : email,
        }
      );
      return userCredential;
    }on FirebaseException catch (e){
      throw Exception(e.code);
    }
  }


  //sign out
Future<void> signout() async{
    return await _auth.signOut();
}

  //errors
}