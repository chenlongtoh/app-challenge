import 'package:app_challenege/common/custom_text.dart';
import 'package:flutter/material.dart';

class ConnectionStatus extends StatefulWidget {
  @override
  _ConnectionStatusState createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          height: 12,
          child: CustomPaint(
            painter: CirclePainter(4.0),
          ),
        ),
        Expanded(
          child: CustomText(
            "Connected",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Icon(
          Icons.battery_full_outlined,
          size: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("96", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text("%", style: TextStyle(fontSize: 20)),
          ],
        )
      ],
    );
  }
}

// class CirlceIndicator extends Decoration {
//   final BoxPainter _painter;

//   CirlceIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

//   @override
//   BoxPainter createBoxPainter([onChanged]) => _painter;
// }

// class _CirclePainter extends BoxPainter {
//   final Paint _paint;
//   final double radius;

//   _CirclePainter(Color color, this.radius)
//       : _paint = Paint()
//           ..color = color
//           ..isAntiAlias = true;

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
//     final Offset circleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
//     canvas.drawCircle(circleOffset, radius, _paint);
//   }
// }

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset circleOffset = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.green[400]
      ..strokeWidth = radius;
    canvas.drawCircle(circleOffset, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
