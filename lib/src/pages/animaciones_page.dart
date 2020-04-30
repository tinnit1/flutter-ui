import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        // animationController.reverse();
        // animationController.repeat();
        animationController.reset();
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // play
    animationController.forward();
    // animationController.repeat();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        print('opacidad: ${opacidad.status}');
        print('rotacion: ${rotacion.status}');
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(scale: agrandar.value, child: child),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.green),
    );
  }
}
