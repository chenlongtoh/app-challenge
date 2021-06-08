import 'package:app_challenege/common/custom_text.dart';
import 'package:flutter/material.dart';

class RemoteStatus extends StatefulWidget {
  @override
  _RemoteStatusState createState() => _RemoteStatusState();
}

class _RemoteStatusState extends State<RemoteStatus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            border: Border.all(width: 3)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: CustomText(
            "L  |  R",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Expanded(
          child: CustomText(
            "  Lumos Remote",
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
            Text("89", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text("%", style: TextStyle(fontSize: 20)),
          ],
        )
      ],
    );
  }
}
