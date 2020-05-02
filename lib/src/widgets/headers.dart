import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xFF615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xFF615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propertis of pen
    paint.color = Color(0xFF615AAB);
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propertis of pen
    paint.color = Color(0xFF615AAB);
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propertis of pen
    paint.color = Color(0xFF615AAB);
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, 0); // lleva el pointer a dicha position sin pintar
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propertis of pen
    paint.color = Color(0xFF615AAB);
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, 0); // lleva el pointer a dicha position sin pintar
    path.lineTo(0, size.height * 0.25);
    // x1, y1 pendiente x2, y2 point final
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // propertis of pen
    paint.color = Color(0xFF615AAB);
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, 0); // lleva el pointer a dicha position sin pintar
    path.lineTo(0, size.height * 0.25);
    // x1, y1 pendiente x2, y2 point final
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 55.0), radius: 180);

    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.5, 1.0],
      colors: <Color>[
        Color(0XFF6D05E8),
        Color(0XFFC012FF),
        Color(0XFF6D05FA),
      ],
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    // propertis of pen
    // paint.color = Colors.red;
    // stroke hace la linea
    // fill hace la linea y pinta su contenido
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    // draw with pen and properties
    path.moveTo(0, 0); // lleva el pointer a dicha position sin pintar
    path.lineTo(0, size.height * 0.25);
    // x1, y1 pendiente x2, y2 point final
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader(
      {Key key,
      @required this.icon,
      @required this.titulo,
      @required this.subtitulo,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,});
  @override
  Widget build(BuildContext context) {
    final Color colorwhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(this.color1, this.color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon,
              size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(this.subtitulo,
                style: TextStyle(fontSize: 20, color: colorwhite)),
            SizedBox(
              height: 20,
            ),
            Text(this.titulo,
                style: TextStyle(
                    fontSize: 25,
                    color: colorwhite,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            FaIcon(this.icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  
  _IconHeaderBackground(
    this.color1, this.color2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.color1,
                this.color2,
              ])),
    );
  }
}
