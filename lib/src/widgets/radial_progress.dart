import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final double primaryStrong;
  final double secundaryStrong;
  final Color primaryColor;
  final Color secondaryColor;

  RadialProgress(
      {@required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.secundaryStrong = 4,
      this.primaryStrong = 10});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percentageLast;

  @override
  void initState() {
    percentageLast = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animateDiff = widget.percentage - percentageLast;
    percentageLast = widget.percentage;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _RadialProgress(
                  (widget.percentage - animateDiff) +
                      (animateDiff * controller.value),
                  widget.primaryColor,
                  widget.secondaryColor,
                  widget.secundaryStrong,
                  widget.primaryStrong),
            ),
          );
        });
  }
}

class _RadialProgress extends CustomPainter {
  final double percentage;
  final double primaryStrong;
  final double secondaryStrong;
  final Color primaryColor;
  final Color secondaryColor;
  _RadialProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.secondaryStrong,
    this.primaryStrong,
  );

  @override
  void paint(Canvas canvas, Size size) {

    final rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180
    );

    final Gradient gradient = new LinearGradient(colors: <Color>[
      Color(0xFFC012FF),
      Color(0xFF6D05E8),
      Colors.red,
    ]);

    // circulo completado
    final paint = new Paint()
      ..strokeWidth = secondaryStrong
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // arco
    final paintArco = new Paint()
      ..strokeWidth = primaryStrong
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // parte que se debe´ra ir llenando
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
