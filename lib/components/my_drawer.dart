import 'package:chatapp/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/setting_page.dart';
class MyDrawer extends StatelessWidget{
    void logout() async {
    final _auth = AuthService();

await    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
backgroundColor: Theme.of(context).colorScheme.background,
child:Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  
  Column(
    children: [

DrawerHeader(
    child:Center(
      child: Icon(Icons.message,
      size: 40,
      color: Theme.of(context).colorScheme.primary,
      ),
    ) ),


    Padding(padding: EdgeInsets.only(left: 25),
    child: 
    ListTile(
      title: Text("H O M E"),
      leading: Icon(Icons.home),
      onTap: (){
        Navigator.pop(context);
      },
    ),),

 Padding(padding: EdgeInsets.only(left: 25),
    child: 
    ListTile(
      title: Text("S E T T I N G"),
      leading: Icon(Icons.settings),
      onTap: (){
        Navigator.pop(context);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage(),));
      },
    ),),


    ],
  ),
     Padding(padding: EdgeInsets.only(left: 25,bottom: 25),
    child: 
    ListTile(
      title: Text("L O G O U T"),
      leading: Icon(Icons.logout),
      onTap: logout,
    ),),

],
)
    );
  }

}