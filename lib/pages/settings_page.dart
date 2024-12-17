import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      body: Row(
        children: [
           // dark mode
          Text("Dark mode"),

          // switch toggle

          CupertinoSwitch(
              value: true,
              onChanged: (value){},
          )
        ],
      ),
    );
  }
}