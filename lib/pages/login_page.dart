import 'package:flutter/material.dart';
import 'package:paseando_pet/pages/home_page.dart';
import 'package:paseando_pet/pages/registrar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email=TextEditingController();
  final password=TextEditingController();
  FirebaseAuth auth= FirebaseAuth.instance;
  late final mensaje msg;

  void validarUsuario() async{

    try {

        final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
        if(user != null){
          msg.mostrarMensaje("Bienvenido!!!!");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
    } on FirebaseAuthException catch (e) {
      //most-rarMensaje("${e.code}");

      if(e.code=="invalid-email"){
        msg.mostrarMensaje("El formato del Email no es correcto.");
      }else
      if(e.code=="user-not-found"){
        msg.mostrarMensaje("El usuario no esta registrado.");
      }else
      if(e.code=="wrong-password"){
        msg.mostrarMensaje("Contraseña Incorrecta.");
      }else
      if(e.code=="unknown"){
        msg.mostrarMensaje("Complete los datos.");
      }else
      if(e.code=="network-request-failed"){
        msg.mostrarMensaje("Revise la conexion a internet.");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    msg= mensaje(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image( image: AssetImage("assets/chico.png"), width: 120, height: 120),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black38, width: 4),
                      color: Colors.green
                  ),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Correo Electronico",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  //keyboardType: TextInputType.emailAddress,
                  //maxLength: 8,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.blue, size: 24),

                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarPage()));
                    },

                    child: const Text("Registrarse")
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      shadowColor: Colors.black26,
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20
                      )
                    ),
                    onPressed:(){
                      validarUsuario();
                    },
                    child: const Text("Ingresar"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class mensaje{

  late BuildContext context;

  mensaje(this.context);

  void mostrarMensaje(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 20),),
          backgroundColor: const Color(0xFFD50000),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
              label: 'Registrese',
              onPressed: (){
                pantalla.hideCurrentSnackBar;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrarPage()));
              }

          ),
        )
    );
  }

  void mensajeOk(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 20),),
          backgroundColor: const Color(0xFF4CAF50),
          duration: const Duration(seconds: 10),
        )
    );
  }
}

