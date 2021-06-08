import 'package:app_challenege/common/custom_text.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/section_item.dart';
import 'package:flutter/material.dart';

class ConnectWithUsSection extends StatelessWidget {
  Future<void> _showAlertDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("You pressed on ${message ?? "N/A"}!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titleList = [
      "General queries",
      "Submit suggestions/Feature request",
      "Lumos on Facebook",
      "Lumos on Instagram",
      "Feedback to Lumos",
    ];

    return SectionItem(
      sectionTitle: "Connect with us",
      sectionItems: titleList
          .map(
            (title) => GestureDetector(
              onTap: () => _showAlertDialog(context, title),
              child: CustomText(title),
            ),
          )
          .toList(),
    );
  }
}
