
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paseando_pet/modelo/paseadores_local.dart';

import '../modelo/modelos_modelo.dart';
import '../repositorio/Boxes.dart';
import 'detalle_paseador_page.dart';
import 'menu_page.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  //final correo=FirebaseAuth.instance.currentUser?.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Favoritos"),
    ),
    drawer: MenuPage(),
    body:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ListaFavoritos(),
    ),
      bottomNavigationBar: const menuInferior(),
    );
  }

  Widget ListaFavoritos(){

    return ValueListenableBuilder<Box<PaseadoresLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _){
          final lista = box.values.toList().cast<PaseadoresLocal>();
          return ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i){
                return Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(lista[i].foto ?? ""),
                          radius: 50,
                        )
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(lista[i].nombre ?? "", style: const TextStyle(fontSize: 20, color: Colors.black, )),
                        subtitle: Text(lista[i].ciudad ?? ""),
                        onTap: (){
                         //datosPaseador paseadorNew= datosPaseador(lista[i].id ?? "", lista[i].nombre ?? "", lista[i].ciudad ?? "", lista[i].contacto ?? "", lista[i].foto ?? "", lista[i].perfil ?? "");
                         //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetallePaseador(paseadorNew)));
                        },
                        onLongPress: (){
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              }
          );
        });
  }
}
