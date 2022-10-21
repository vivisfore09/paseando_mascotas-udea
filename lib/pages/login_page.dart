import 'package:flutter/material.dart';
import 'package:paseando_pet/pages/registrar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100,horizontal: 50),
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
                  decoration: const InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  //keyboardType: TextInputType.emailAddress,
                  //maxLength: 8,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key_sharp)
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarPage()));
                    },

                    child: const Text("Registrarse")
                ),
                ElevatedButton(
                    onPressed:(){},
                    child: const Text("Ingresar"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
