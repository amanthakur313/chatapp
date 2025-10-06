

import 'package:chatapp/Theme/theme_mode.dart';
import 'package:chatapp/Theme/theme_provider.dart';
import 'package:chatapp/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/login_page.dart';
import 'firebase_options.dart';
import 'package:chatapp/auth/auth_gate.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
   
    ChangeNotifierProvider(create: (context)=>ThemeProvider(),
    child: MyApp(),)
    );
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
debugShowCheckedModeBanner: false,
theme: Provider.of<ThemeProvider>(context).themeData,
home: AuthGate(),
  );
  }
}