import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text, this.ontap});
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
       child: Container(
         decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.secondary,
           borderRadius: BorderRadius.circular(12),
         ),
         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
         padding: EdgeInsets.all(25),
         child: Row(
           children: [
             // icon
             Icon(Icons.person),
             SizedBox(width: 25,),
             // user name
             Text(text),

           ],
         ),
       ),
    );
  }

}