import 'package:app_challenege/common/custom_text.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/section_item.dart';
import 'package:flutter/material.dart';

class AccountSettingSection extends StatelessWidget {
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
    return SectionItem(
      sectionTitle: "Account",
      sectionItems: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("bilal@lumoshelmet.co"),
            GestureDetector(
              onTap: () => _showAlertDialog(context, "Logout"),
              child: CustomText(
                "Logout",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Edit personal details"),
            GestureDetector(
              child: Icon(Icons.chevron_right_sharp),
              onTap: () => _showAlertDialog(context, "Edit Personal Details' Chevron"),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("Deactivate Account"),
            GestureDetector(
              child: Icon(Icons.chevron_right_sharp),
              onTap: () => _showAlertDialog(context, "Deactivate Account's Chevron"),
            )
          ],
        ),
      ],
    );
  }
}
