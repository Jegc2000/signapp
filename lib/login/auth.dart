import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final GoogleSignIn _googleCredentials = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var googleEmail="";
  var googleDisplayname="";
  var googleImage="";

  String returnGoogleEmail(){
    return googleEmail;
  }

  String returnGoogleName(){
    return googleDisplayname;
  }

  String returnGoogleImage(){
    return googleImage;
  }

  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    await _googleCredentials.signOut();
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    //Iniciar sesion con Google
    final googleUser = await _googleCredentials.signIn();
    final googleAuth = await googleUser!.authentication;
    googleEmail= googleUser.email;
    googleDisplayname = googleUser.displayName.toString();
    googleImage = googleUser.photoUrl.toString();



    // credenciales de usuario de Google
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    await _createUserCollectionFirebase(_auth.currentUser!.uid);  
  }

  Future<void> _createUserCollectionFirebase(String uid) async{
    
    //Revisar si existe el documento del usuario que se esta autenticando
    var userDoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if(!userDoc.exists){ 
      //Si no existe, crear el documento 
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "favorites":[],
      });
    } else {
      return;
    }
  }

}