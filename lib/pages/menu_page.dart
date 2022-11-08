import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paseando_pet/pages/login_page.dart';


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
