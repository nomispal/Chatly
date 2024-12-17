import 'package:drassistant/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.0)
        ),
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             // dark mode
            Text("Dark mode"),

            // switch toggle

            CupertinoSwitch(
                value:
                Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value){
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
            )
          ],
        ),
      ),
    );
  }
}