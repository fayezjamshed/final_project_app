import 'package:final_project_app/Widget/widget.dart';
import 'package:final_project_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
        // Card(
        //   elevation: 5,
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.notifications,
        //       size: 30,
        //     ),
        //     title: "Notifications".text.xl.make(),
        //   ),
        // ).p(5),
        Card(
          elevation: 5,
          child: ListTile(
            onTap: () =>
                showDialog(context: context, builder: (context) => DialogBox()),
            leading: Icon(
              Icons.privacy_tip_outlined,
              size: 30,
            ),
            title: "Privacy Policy".text.xl.make(),
          ),
        ).p(5),
        // Card(
        //   elevation: 5,
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.contact_phone,
        //       size: 30,
        //     ),
        //     title: "Contact Us".text.xl.make(),
        //   ),
        // ).p(5),

        Card(
          elevation: 5,
          child: ListTile(
            onTap: () {
              launchUrlString('mailto:fayezjamshed26@gmail.com');
            },
            leading: Icon(
              Icons.email,
              size: 30,
            ),
            title: "Contact Us".text.xl.make(),
          ),
        ).p(5),
        Card(
          elevation: 5,
          child: ListTile(
              leading: Icon(
                Icons.android_outlined,
                size: 30,
              ),
              title: "About App".text.xl.make(),
              subtitle: "version 1.1".text.make()),
        ).p(5),
      ],
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(privacy).p(20),
    );
  }
}
