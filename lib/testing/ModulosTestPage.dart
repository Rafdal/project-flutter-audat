import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/widgets/ModuloCard.dart';
import 'package:test_flutter_websockets/testing/ComandosPageTest.dart';

class ModulosTestPage extends StatelessWidget {

  final Color onlineColor = Color.fromRGBO(255, 255, 255, 1);
  final Color offlineColor = Color.fromRGBO(230, 230, 230, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModuloCard(
          icon: Icons.lightbulb_outline,
          title: 'Luz habitacion',
          subtitle: 'Modulo de control',
          // internalPadding: EdgeInsets.symmetric(vertical: 15),
          background: onlineColor,
          radius: 50,
          antena: true,
          child: ComandosPageTest(),
        ),
        ModuloCard(
          icon: Icons.lightbulb_outline,
          title: 'Luz quincho',
          subtitle: 'Modulo de control',
          // internalPadding: EdgeInsets.symmetric(vertical: 15),
          background: onlineColor,
          radius: 50,
          antena: true,
        ),
        ModuloCard(
          icon: Icons.hot_tub,
          title: 'Calefaccion',
          subtitle: 'Modulo de control',
          // internalPadding: EdgeInsets.symmetric(vertical: 15),
          background: offlineColor,
          radius: 50,
          antena: true,
          online: false,
        ),
        ModuloCard(
          icon: Icons.volume_up,
          title: 'Home Theater',
          subtitle: 'Modulo de audio',
          // internalPadding: EdgeInsets.symmetric(vertical: 15),
          background: offlineColor,
          radius: 50,
          online: false,
          antena: true,
        ),
      ],
    );
  }
}