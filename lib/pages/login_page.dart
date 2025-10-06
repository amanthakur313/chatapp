

import 'dart:math';

import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passcontroller = TextEditingController();
  
 final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });
  
  
  void login(BuildContext context) async {

final authService  = AuthService();

try{
  await authService.signInWithEmailPassword(_emailcontroller.text,_passcontroller.text);
 
}
catch(e){
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(e.toString()),
  ));
}

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Theme.of(context).colorScheme.background,
body:Center(
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Icon(Icons.message,size: 60,
color: Theme.of(context).colorScheme.primary,),

const SizedBox(
  height: 50,
),

Text("WelCome back, you've been missed!"),

const SizedBox(
  height: 25,
),

MyTextfield(
  controller: _emailcontroller,
  hintText: "Email",
  obscureText: false,
),

const SizedBox(
  height: 10,
),

MyTextfield(
  controller: _passcontroller,
  obscureText: true,
  hintText: "Password",
),

const SizedBox(
  height: 10,
),

MyButton(
  onTap: ()=>login(context),
  text: "Login",
),
const SizedBox(
  height: 10,
),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Not a memeber ? ",style: TextStyle(
      color: Theme.of(context).colorScheme.primary
    ),),
    GestureDetector(
      onTap: onTap,
      child: Text("Register now ",style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),),
    ),
  ],
)



  ],
),),
    );
  }
}