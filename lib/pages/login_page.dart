import 'package:drassistant/auth/auth_service.dart';
import 'package:drassistant/components/my_button.dart';
import 'package:drassistant/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and pass text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // tap tp go to register page
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  //login
  void Login(BuildContext context) async{
    // auth service
    final authService = AuthService();
    try{
      await authService.signInWithEmailPassword(
          _emailController.text, _passController.text);
    } catch(e){
      showDialog(
          context: context,
          builder:(context)=> AlertDialog(
            title: Text(e.toString()),
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image(image: AssetImage("assets/voice.png"),),
            const SizedBox(height: 50,),
            //welcome back message
            Text(
              "Welcome back you have been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 25,),

            //email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 25,),
            //pass textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passController,
            ),
            const SizedBox(height: 25,),
            //login button
            MyButton(
              text: "Login"
              ,onTap:()=>Login(context),),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),


            // register now
          ],
        ),
      ),
    );

  }

}