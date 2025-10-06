
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget{
final TextEditingController controller;
String hintText;
final bool obscureText;
final FocusNode? focusNode;
 MyTextfield({
  super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,
   this.focusNode,
});

  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.symmetric(horizontal: 25),
   child:  
   TextField(
    obscureText:obscureText,
    controller: controller,
    focusNode: focusNode,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      fillColor:Theme.of(context).colorScheme.secondary ,
      filled: true,
      hintText: hintText,
hintStyle: TextStyle(
  color: Theme.of(context).colorScheme.primary,

),

    ),),
   );
}
}