import 'package:firebase_auth/firebase_auth.dart';

class Usuario_Registrar{

 Future<String?> registrarUsuario(String email, String password) async{

   try{
     final credencial = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     return credencial.user?.uid;
   } on FirebaseAuthException catch(e){
     return e.code;
   } on FirebaseException catch(e){
     return e.code;
   }
  }

}