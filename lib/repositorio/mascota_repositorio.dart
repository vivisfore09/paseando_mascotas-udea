import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/modelo/mascota_modelo.dart';
import 'dart:convert';

class Mascota_Registrar{


  Future<String> crearMascota(Mascota mascota) async{

    try{
      final uid= FirebaseAuth.instance.currentUser?.uid;
      final documentMasc= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc();
      mascota.id= documentMasc;
      final resultado = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc().set(mascota.convertir());
      return mascota.id;
    } on FirebaseException catch(e){
      print(e.code);
      return e.code;
    }
  }
}