import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

enum Genero {Femenino,Masculino}

class _RegistrarPageState extends State<RegistrarPage> {

  final nombres=TextEditingController();
  final apellidos=TextEditingController();
  final telefono=TextEditingController();
  final direccion=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final passwordConf=TextEditingController();

  Genero? _genero= Genero.Femenino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fondo.jpeg"), fit: BoxFit.cover)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
              Container(
                  child: const Image(
                      image: AssetImage("assets/chico.png"),
                      width: 120,
                      height: 120),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black38, width: 4),
                      gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0.0, 1.0),
                    // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0xff76ff03),
                      Color(0xff00b8d4),
                    ],
                    // green to blue
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ))),
                      TextFormField(
                        controller: nombres,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Nombres",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: apellidos,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Apellidos",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Correo Electronico",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email_outlined, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: telefono,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            labelText: "Telefono",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.phone, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: direccion,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            labelText: "Direccion",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.add_location_alt_rounded, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Femenino'),
                              leading: Radio<Genero>(
                                value: Genero.Femenino,
                                groupValue: _genero,
                                onChanged: (Genero? value) {
                                  setState(() {
                                    _genero = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                            title: const Text('Masculino',style: TextStyle(color: Colors.white),),
                            leading: Radio<Genero>(
                              value: Genero.Masculino,
                              groupValue: _genero,
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genero = value;
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
                      TextFormField(
                        obscureText: true,
                        controller: password,
                        //keyboardType: TextInputType.emailAddress,
                        //maxLength: 8,
                        decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordConf,
                        //keyboardType: TextInputType.emailAddress,
                        //maxLength: 8,
                        decoration: const InputDecoration(
                            labelText: "Confirmar Password",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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

                          },
                          child: const Text("Registrarse"))
            ])))),
      ),
    );
  }
}
