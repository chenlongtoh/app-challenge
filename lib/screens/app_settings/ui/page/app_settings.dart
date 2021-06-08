import 'package:app_challenege/common/styles.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/account_setting_section.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/companion_app_section.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/connect_with_us_section.dart';
import 'package:app_challenege/screens/app_settings/ui/widget/tutorial_section.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  List<Widget> widgetList = [
    AccountSettingSection(),
    CompanionAppSection(),
    TutorialSection(),
    ConnectWithUsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => index == 0 ? Container(): widgetList[index - 1],
        separatorBuilder: (context, index) => Divider(),
        itemCount: widgetList.length + 1,
      ),
    );
  }
}
