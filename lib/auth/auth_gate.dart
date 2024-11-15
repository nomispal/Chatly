import 'package:drassistant/auth/login_or_register.dart';
import 'package:drassistant/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            // user logged in
            if(snapshot.hasData){
              return HomePage();
            }
            // user is not loggged in
            else{
              return const LoginOrRegister();
            }
          })
    );
  }

}