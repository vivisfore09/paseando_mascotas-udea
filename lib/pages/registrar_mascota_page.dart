import 'package:flutter/material.dart';
import 'package:paseando_pet/modelo/mascota_modelo.dart';
import 'package:paseando_pet/pages/home_page.dart';
import 'package:paseando_pet/pages/menu_page.dart';
import 'package:paseando_pet/repositorio/mascota_repositorio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';

class RegistrarMascotaPage extends StatefulWidget {
  const RegistrarMascotaPage({Key? key}) : super(key: key);


  @override
  State<RegistrarMascotaPage> createState() => _RegistrarMascotaPageState();
}


enum Sexo { Hembra, Macho}

class _RegistrarMascotaPageState extends State<RegistrarMascotaPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? correo=FirebaseAuth.instance.currentUser?.email.toString();
    print("----------------------->>>>>>>>>>>>>>>< "+correo!);
  }

  final nombre=TextEditingController();
  final tipo=TextEditingController();
  final color=TextEditingController();
  final raza=TextEditingController();
  Mascota_Registrar Mas =Mascota_Registrar();
  late mensaje msg;

  Sexo? _sexo=Sexo.Hembra;

  void registrarMascota(Mascota mascota) async{
    var respuesta= await Mas.crearMascota(mascota);
    if(respuesta=="La mascota ya existe"){
      msg.mensajeOk("La Mascota ya se encuentra registrada.");
    }else{
    msg.mensajeOk("Mascota registrada exitosamente.");
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
  }

  void traerDatos(){
    setState(() {
      String foto="https://firebasestorage.googleapis.com/v0/b/udea-mascotas.appspot.com/o/img_mascotas%2Fmascota.jpg?alt=media&token=80b37f97-4b17-4e0f-8efa-dc722cd20e49";
      if(nombre.text.isNotEmpty && tipo.text.isNotEmpty && color.text.isNotEmpty && raza.text.isNotEmpty){
        String sex="Hembra";
        if(_sexo==Sexo.Macho){
          sex="Macho";
        }
        var mascNew= Mascota("", nombre.text, tipo.text, color.text, raza.text, sex, foto);
        registrarMascota(mascNew);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    msg=mensaje(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Mascota"),
      ),
      drawer: MenuPage(),
      body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
                      TextFormField(
                        controller: nombre,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Nombre",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.pets, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: tipo,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Tipo",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.pets, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: color,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Color de la mascota",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.pets, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: raza,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Raza",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.pets, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Hembra'),
                              leading: Radio<Sexo>(
                                value: Sexo.Hembra,
                                groupValue: _sexo,
                                onChanged: (Sexo? value) {
                                  setState(() {
                                    _sexo = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: ListTile(
                                title: const Text('Macho',style: TextStyle(color: Colors.white),),
                                leading: Radio<Sexo>(
                                  value: Sexo.Macho,
                                  groupValue: _sexo,
                                  onChanged: (Sexo? value) {
                                    setState(() {
                                      _sexo = value;
                                    });
                                  },
                                ),
                              )
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black12,
                              fixedSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20)),
                          onPressed:(){
                           traerDatos();
                          },
                          child: const Text("Registrar Mascota"))
                    ])))),
      bottomNavigationBar: const menuInferior(),
    );
  }
}
