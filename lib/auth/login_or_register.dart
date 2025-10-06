
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/cupertino.dart';

class LoginOrRegister extends StatefulWidget {
  State<LoginOrRegister> createState()=>_LoginOrRegister();
}

class _LoginOrRegister extends State<LoginOrRegister>{

  bool showLoginPage = true;

  void togglepages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
if(showLoginPage){
  return LoginPage(
    onTap: togglepages,
  );
}else{
  return RegisterPage(
    onTap: togglepages,
  );
}
  }
}