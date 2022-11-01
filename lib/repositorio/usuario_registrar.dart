import 'package:firebase_auth/firebase_auth.dart';

class Usuario_Registrar{

 Future<bool> registrarUsuario(String email, String password) async{

   try{
     final credencial = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     return true;
   }on FirebaseAuthException catch(e){
     print("Aquiiiiiiiiiiiiiiiii "+e.toString());
     return false;
   }catch(e){
     print(e);
     return false;
   }
  }

}