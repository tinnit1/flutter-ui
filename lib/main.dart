import 'package:diseniosapp/src/retos/cuadrado_animado.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CuadradoAnimadoPage(),
    );
  }
}