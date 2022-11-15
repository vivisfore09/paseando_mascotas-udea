import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/pages/home_page.dart';
import 'package:paseando_pet/pages/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paseando_pet/pages/paseadores_page.dart';

import 'favoritos_page.dart';


class MenuPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green
              ),
              child: Image.network('https://w7.pngwing.com/pngs/312/283/png-transparent-man-s-face-avatar-computer-icons-user-profile-business-user-avatar-blue-face-heroes-thumbnail.png')
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin, size: 30, color: Colors.black,),
                title: Text((FirebaseAuth.instance.currentUser?.email).toString(), style: const TextStyle( fontSize: 16)),
                textColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.blue,),
                title: const Text("Salir", style: TextStyle( fontSize: 20)),
                textColor: Colors.blue,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class menuInferior extends StatelessWidget {
  const menuInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dog,size: 30),
              label: "Mis Mascotas"
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.personWalking,size: 30),
              label: "Paseadores"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart,size: 30),
              label: "Favoritos")
        ],
      onTap: (indice){
          if(indice==0){
            Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const HomePage()));
          }else if(indice==1){
            Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const PaseadoresPage()));
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (contetx)=> const FavoritosPage()));
          }
      },

    );
  }
}

