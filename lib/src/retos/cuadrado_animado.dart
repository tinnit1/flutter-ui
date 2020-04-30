import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.25, curve: Curves.bounceIn)));

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.5, curve: Curves.bounceIn)));
    
    moverIzquierda = Tween(begin: 0.5, end: -100.0).animate(
        CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.75, curve: Curves.bounceIn)));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.bounceIn)));
    
    // moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    
    // moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        // animationController.reverse();
        animationController.repeat();
        // animationController.reset();
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
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: child);
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
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
