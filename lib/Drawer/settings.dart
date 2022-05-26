import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Settings(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: appBarMain("Settings"),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(
              Icons.notifications,
              size: 30,
            ),
            title: "Notifications".text.xl.make(),
          ),
        ).p(5),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(
              Icons.privacy_tip_outlined,
              size: 30,
            ),
            title: "Privacy Policy".text.xl.make(),
          ),
        ).p(5),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(
              Icons.contact_phone,
              size: 30,
            ),
            title: "Contact Us".text.xl.make(),
          ),
        ).p(5),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              size: 30,
            ),
            title: "About".text.xl.make(),
          ),
        ).p(5),
      ],
    );
  }
}
