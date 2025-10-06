
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget{
  final String message;
  final bool isCurrentUser;

  ChatBubble({
    required this.message,
    required this.isCurrentUser
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser? Colors.green:Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 25),
      child: Text(message,style: TextStyle(
        color: Colors.white
      ),),
    );
  }

}