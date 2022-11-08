import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/pages/menu_page.dart';
import 'package:paseando_pet/pages/registrar_mascota_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PeseandoPet"),
      ),
      drawer: MenuPage(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hola: ${FirebaseAuth.instance.currentUser?.email}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30, color: Colors.white),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrarMascotaPage()));
        },
      ),
    );
  }
}
