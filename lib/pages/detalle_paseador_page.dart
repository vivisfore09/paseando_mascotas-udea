import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paseando_pet/modelo/modelos_modelo.dart';
import 'package:paseando_pet/modelo/paseadores_local.dart';
import 'package:paseando_pet/pages/home_page.dart';
import 'package:paseando_pet/pages/mapa_page.dart';

import '../repositorio/Boxes.dart';


class DetallePaseador extends StatefulWidget {

  final datosPaseador paseador;


  DetallePaseador(this.paseador);

  @override
  State<DetallePaseador> createState() => _DetallePaseadorState();
}

class _DetallePaseadorState extends State<DetallePaseador> {

  var favorito=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoritos();
  }
  void getFavoritos(){
  final box = Boxes.boxFavoritos();
  box.values.forEach((element) {
    if(element.id == widget.paseador.id){
      favorito=true;
    }
  });
  }


  void agregarFavoritos(){
    var paseadorFavorito = PaseadoresLocal()
        ..id = widget.paseador.id
        ..nombre= widget.paseador.nombre
        ..contacto = widget.paseador.contacto
        ..ciudad = widget.paseador.ciudad
        ..foto = widget.paseador.foto
        ..perfil = widget.paseador.perfil;
     final box = Boxes.boxFavoritos();
     //box.add(paseadorFavorito);
    if(favorito){
      box.delete(paseadorFavorito.id);
    }else{
      box.put(paseadorFavorito.id, paseadorFavorito);
    }
    setState(() {
      favorito=!favorito;
    });
  }


  @override
  Widget build(BuildContext context) {

    final posicion = CameraPosition(
        target: LatLng(widget.paseador.ubicacion.latitude, widget.paseador.ubicacion.longitude),
        zoom: 15
    );

    final Set<Marker> marcador = Set();

    setState(() {
      marcador.add(
          Marker(markerId: MarkerId(widget.paseador.id),
              position: LatLng(widget.paseador.ubicacion.latitude, widget.paseador.ubicacion.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              infoWindow: InfoWindow(
                  title: widget.paseador.nombre,
                  snippet: widget.paseador.contacto
              )
          )
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.paseador.nombre),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 30),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapaPage(widget.paseador)));
              }, icon: const Icon(Icons.map, size: 30, color: Colors.red)),
          IconButton(
              padding: const EdgeInsets.only(right: 30),
              onPressed: (){
                agregarFavoritos();
              }, icon: Icon(favorito ? FontAwesomeIcons.heartCircleBolt : FontAwesomeIcons.heart, size: 30, color: Colors.red))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              height: 500,
              child: GoogleMap(
                initialCameraPosition: posicion,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: marcador,

              ),
            ),
            miCardImage(widget.paseador.foto, widget.paseador.nombre+"\n"+widget.paseador.contacto+"\n"+widget.paseador.ciudad+"\n\n"+widget.paseador.perfil),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ]


        ),
      ),
    );
  }
}
