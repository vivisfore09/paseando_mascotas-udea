import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paseando_pet/pages/menu_page.dart';

import '../modelo/modelos_modelo.dart';

class MapaPage extends StatefulWidget {

  final datosPaseador paseador;

  MapaPage(this.paseador);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {


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
        title:  Text(widget.paseador.nombre),
      ),
      drawer: MenuPage(),
      body: GoogleMap(
        initialCameraPosition: posicion,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: false,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        markers: marcador,

      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}
