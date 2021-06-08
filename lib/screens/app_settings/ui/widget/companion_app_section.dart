import 'package:app_challenege/common/custom_text.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/section_item.dart';
import 'package:flutter/material.dart';

class CompanionAppSection extends StatefulWidget {
  @override
  _CompanionAppSectionState createState() => _CompanionAppSectionState();
}

class _CompanionAppSectionState extends State<CompanionAppSection> {
  String unit = "Metric";

  Future<void> _showAlertDialog(String message) async {
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

  Future<void> _showModalBottomSheet() async {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text("Metric"),
              trailing: unit == "Metric" ? Icon(Icons.check) : null,
              onTap: () {
                setState(() => unit = "Metric");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Imperial"),
              trailing: unit == "Imperial" ? Icon(Icons.check) : null,
              onTap: () {
                setState(() => unit = "Imperial");
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionItem(
      sectionTitle: "Lumos Companion App",
      sectionItems: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Push notifications"),
            GestureDetector(
              child: Icon(Icons.chevron_right_sharp),
              onTap: () => _showAlertDialog("Push Notifications' chevron"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Units"),
            GestureDetector(
              onTap: () => _showModalBottomSheet(),
              child: CustomText(
                unit,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("App Version"),
            CustomText("2.5.6"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Check for update"),
            GestureDetector(
              child: Icon(Icons.chevron_right_sharp),
              onTap: () => _showAlertDialog("Check for Update's chevron"),
            )
          ],
        ),
      ],
    );
  }
}
