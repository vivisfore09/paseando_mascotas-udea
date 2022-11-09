import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/modelo/mascota_modelo.dart';


class Mascota_Registrar{


  Future<String> crearMascota(Mascota mascota) async{

    try{
      final uid= FirebaseAuth.instance.currentUser?.uid;
      QuerySnapshot nombreMascota= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").where("nombre", isEqualTo: mascota.nombre).get();
      if(nombreMascota.docs.isEmpty){
      final documentMasc= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc();
      mascota.id= documentMasc.id;
      final resultado = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc(mascota.id).set(mascota.convertir());
      return mascota.id;
      }else
        {
          return "La mascota ya existe";
        }
    } on FirebaseException catch(e){
      print(e.code);
      return e.code;
    }
  }
}