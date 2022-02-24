import 'dart:math';

import 'package:flutter/material.dart';

class OthersStatus extends StatefulWidget {
  const OthersStatus(
      {Key key,
      this.name,
      this.time,
      this.imageName,
      this.isSeen,
      this.statusNum})
      : super(key: key);
  final String name;
  final String time;
  final String imageName;
  final bool isSeen;
  final int statusNum;

  @override
  _OthersStatusState createState() => _OthersStatusState();
}

class _OthersStatusState extends State<OthersStatus> {
  @override
  Widget build(BuildContext context) {
    var time = widget.time;
    return ListTile(
      leading: CustomPaint(
        painter:
            StatusPainter(isSeen: widget.isSeen, statusNum: widget.statusNum),
        child: CircleAvatar(
          backgroundImage: AssetImage(widget.imageName),
          radius: 26,
        ),
      ),
      title: Text(
        widget.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        "Today at,$time",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusPainter extends CustomPainter {
  bool isSeen;
  int statusNum;
  StatusPainter({this.isSeen, this.statusNum});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 8.0
      ..color = isSeen ? Colors.grey : Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusNum;
      for (int i = 0; i < statusNum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
