import 'package:app_challenege/screens/helmet/ui/widget/connection_status.dart';
import 'package:app_challenege/screens/helmet/ui/widget/long_icon_button.dart';
import 'package:app_challenege/screens/helmet/ui/widget/remote_status.dart';
import 'package:app_challenege/screens/pattern_editor/ui/page/pattern_editor.dart';
import 'package:flutter/material.dart';

class Helmet extends StatefulWidget {
  @override
  _HelmetState createState() => _HelmetState();
}

class _HelmetState extends State<Helmet> {
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

  List<Widget> widgetList = [];
  @override
  void initState() {
    super.initState();
    widgetList = [
      Image.asset("assets/images/helmet.png"),
      ConnectionStatus(),
      RemoteStatus(),
      Column(
        children: [
          SizedBox(height: 10),
          LongIconButton(
            buttonText: "Customize Light Modes",
            leadingIcon: Icons.wb_sunny_outlined,
            onPressed: () => _showAlertDialog("Customize Light Modes"),
          ),
          SizedBox(height: 20),
          LongIconButton(
            buttonText: "Helmet Settings",
            leadingIcon: Icons.settings_outlined,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatternEditor(),
              ),
            ),
          ),
          SizedBox(height: 20),
          LongIconButton(
            buttonText: "Product Support",
            leadingIcon: Icons.help_outline_rounded,
            onPressed: () => _showAlertDialog("Product Support"),
          ),
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: GestureDetector(
              child: Icon(
                Icons.grid_view,
                color: Colors.black,
              ),
              onTap: () => null,
            ),
          ),
        ],
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lumos",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(" Matrix", style: TextStyle(fontSize: 24)),
            ],
          ),
          preferredSize: Size.fromHeight(15),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        itemCount: widgetList.length,
        separatorBuilder: (context, index) => index == 0 ? SizedBox() : Divider(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: widgetList[index],
        ),
      ),
    );
  }
}
