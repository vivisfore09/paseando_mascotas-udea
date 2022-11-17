
import 'package:cloud_firestore/cloud_firestore.dart';

class datosPaseador{

  String id="";
  String nombre="";
  String ciudad="";
  String contacto="";
  String foto="";
  String perfil="";
  late GeoPoint ubicacion;

  datosPaseador(
      this.id, this.nombre, this.ciudad, this.contacto, this.foto, this.perfil,this.ubicacion);

  /*@override
  datosPaseador(
      this.id, this.nombre, this.ciudad, this.contacto, this.foto, this.perfil);*/
}

