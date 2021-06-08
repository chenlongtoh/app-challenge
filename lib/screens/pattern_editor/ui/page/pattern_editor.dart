import 'package:app_challenege/common/custom_text.dart';
import 'package:app_challenege/common/styles.dart';
import 'package:app_challenege/screens/pattern_editor/ui/widget/segment_form.dart';
import 'package:flutter/material.dart';

class PatternEditor extends StatefulWidget {
  @override
  _PatternEditorState createState() => _PatternEditorState();
}

class _PatternEditorState extends State<PatternEditor> {
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
  final String description =
      "This set represents a 2 second interval. Tap each segment to create a custom looping flash pattern. Press twice for an even short 1/2 bar.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flashing Pattern Editor",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/images/led.png", height: 70)],
            ),
          ),
          preferredSize: Size.fromHeight(200),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: new BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
            child: Column(
              children: [
                CustomText("Custom 1", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                CustomText("Flash Pattern Creator", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                SegmentForm(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomText(
                    description,
                    style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _showAlertDialog("OK"),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(width: 1, color: Colors.grey[350]),
                  color: Colors.white,
                ),
                child: Text("OK", style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
