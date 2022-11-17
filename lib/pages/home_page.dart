import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/pages/menu_page.dart';
import 'package:paseando_pet/pages/paseadores_page.dart';
import 'package:paseando_pet/pages/registrar_mascota_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List mascotas=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      String? correo=FirebaseAuth.instance.currentUser?.email.toString();
      print("----------------------->>>>>>>>>>>>>>>< "+correo!);
    }
    getMascotas();
  }
  
  Future getMascotas() async{
    String? uid=FirebaseAuth.instance.currentUser?.uid;
    //Busqueda por un parametro
    //QuerySnapshot mascota= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").where("nombre", isEqualTo: "Paquito").get();
    QuerySnapshot mascota= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").get();
    setState(() {
      if(mascota.docs.isNotEmpty){
        for(var masc in mascota.docs){
          mascotas.add(masc.data());
          print("------------------------>>>>>>>>>>>>>>>>>>><<< "+masc.data().toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PeseandoPet"),
        actions: [
          IconButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PaseadoresPage() ));
              },
              icon: const Icon(Icons.accessibility_rounded, size: 30, color: Colors.white))
        ],
      ),
      drawer: MenuPage(),
      body: ListView.builder(
        itemCount: mascotas.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: miCardImage(mascotas[i]["foto"],mascotas[i]["nombre"]+' - '+mascotas[i]["tipo"]+' - '+mascotas[i]["raza"]),
            onTap: (){

            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30, color: Colors.white),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrarMascotaPage()));
        },
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}


class miCardImage extends StatelessWidget {
  
  final String url;
  final String texto;

  miCardImage(this.url, this.texto);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: EdgeInsets.all(20),
      elevation: 20,
      color: Colors.lightGreenAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(url,width: MediaQuery.of(context).size.width,height: 250,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: Colors.lightGreenAccent,
              child: Text(texto, style: const TextStyle(fontSize: 20, color: Colors.white)),
            )
          ],
        ),
      ),
      
    );
  }
}

