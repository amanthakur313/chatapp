
import 'package:chatapp/models/message.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class ChatService  {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  final FirebaseAuth  _auth = FirebaseAuth.instance;


  Stream<List<Map<String,dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String reciverID,message)async{

final String currentUserID = _auth.currentUser!.uid;

final String currentUserEmail = _auth.currentUser!.email!;

final Timestamp timestamp = Timestamp.now();

//create a new message
 Message  newMessage = Message(
  senderID: currentUserID, 
  senderEmail: currentUserEmail, 
  reciverID: reciverID,
   message: message, 
   timestamp: timestamp);


   //constract chat room id two user

   List<String> ids = [currentUserID,reciverID];
ids.sort();

String chatRoomID  = ids.join('_');


//add new message to database

await _firestore
.collection("chat_rooms")
.doc(chatRoomID)
.collection("messages")
.add(newMessage.toMap());
  }

//getmessage 

Stream<QuerySnapshot> getMessages(String userID,otherUserID){

  List<String> ids = [userID,otherUserID];
ids.sort();

String chatRoomID = ids.join('_');

return _firestore
.collection("chat_rooms")
.doc(chatRoomID)
.collection("messages")
.orderBy("timestamp",descending: false)
.snapshots();
}

}