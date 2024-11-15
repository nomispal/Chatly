import 'package:drassistant/auth/auth_service.dart';
import 'package:drassistant/components/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and pass text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  // on tap to go to the login page
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});
  void Register (BuildContext context){
    final _auth = AuthService();
    if(_passController.text==_confirmpassController.text){
      try{
        _auth.signupWithEmailPassword(
            _emailController.text,
             _passController.text
        );
      }catch (e){
        showDialog(
            context: context,
            builder:(context)=> AlertDialog(
              title: Text(e.toString()),
            )
        );
      }
    }
    else{
      showDialog(
          context: context,
          builder:(context)=> AlertDialog(
            title: Text("Password doesn't match"),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
            const SizedBox(height: 50,),
            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
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
            // confirm pass field
            MyTextField(
              hintText: "Confirm passowrd",
              obscureText: true,
              controller: _confirmpassController,
            ),
            const SizedBox(height: 25,),

            //login button
            MyButton(
              text: "Login",
              onTap: () => Register(context),),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                  style: TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary),
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