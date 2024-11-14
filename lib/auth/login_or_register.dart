import 'package:drassistant/pages/login_page.dart';
import 'package:drassistant/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show login page
  bool ShowLoginPage = true;
  // toggle betweem pages
  void togglePages(){
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(ShowLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}