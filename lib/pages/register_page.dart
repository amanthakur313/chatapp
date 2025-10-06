
import 'package:flutter/material.dart';
import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textField.dart';
// import 'dart:math';

// import 'package:chatapp/auth/auth_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:chatapp/components/my_button.dart';
// import 'package:chatapp/components/my_textField.dart';
class RegisterPage extends StatelessWidget {
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passcontroller = TextEditingController();
final TextEditingController _confirmpasscontroller = TextEditingController();

 final void Function()? onTap;

void Register(BuildContext context) async{

final _auth = AuthService();

if(_passcontroller.text == _confirmpasscontroller.text){
  try{
 await _auth.signUpWithEmailPassword(_emailcontroller.text,
 _passcontroller.text);
  } catch(e){
 showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(e.toString()),
  ));
}

}
else{
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text("Password don't match!"),
  ));
}
}

RegisterPage({
  super.key,
  required this.onTap,
});
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

Text("Let's create an account for you "),

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

MyTextfield(
  controller: _confirmpasscontroller,
  obscureText: true,
  hintText: "confirm Password",
),

const SizedBox(
  height: 10,
),

MyButton(
  onTap: ()=>Register(context),
  text: "Register",
),
const SizedBox(
  height: 10,
),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Already have an account ? ",style: TextStyle(
      color: Theme.of(context).colorScheme.primary
    ),),
    GestureDetector(
      onTap: onTap,
  child:  Text("Login now ",style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
    ),),),
  ],
)



  ],
),),
    );
  }
}