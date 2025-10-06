
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService{
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   // save user info in seperate doc 

// // _firestore.collection("Users").doc(UserCredential.user!.uid).set({
// // 'uid':userCredential.user!.uid,
// // 'email':email,

// // },
// // );

// _firestore.collection("Users").doc(userCredential.user!.uid).set({
//   'uid': userCredential.user!.uid,
//   'email': email,
// });



// //sign In
//   Future<UserCredential> signInWithEmailPassword(String email,String password)async{
//     try{
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//          password: password);
//          return userCredential;
//     }on FirebaseAuthException catch (e){
//       throw Exception(e.code);
//     }
//   }

//   //signOut

//   Future<void> signOut() async{
//     return await _auth.signOut();
//   }

//   //signUp

//   Future<UserCredential> signUpWithEmailPassword(String email,String password) async{
//     try{
// UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//   email: email,
//    password: password);
//    return userCredential;
//     }on FirebaseAuthException catch(e){
// throw Exception(e.code);
//     }
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Sign In
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

 await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });



      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // 🔹 Sign Out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // 🔹 Sign Up
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ Save user info to Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  
  // ✅ Get current user method
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
