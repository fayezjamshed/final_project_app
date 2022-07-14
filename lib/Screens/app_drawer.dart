import 'package:final_project_app/Drawer/edit_profile.dart';
import 'package:final_project_app/Drawer/help_screen.dart';
import 'package:final_project_app/Drawer/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    void toggleDarkMod(bool value) {
      setState(() {
        isSwitched = !isSwitched;
      });
    }

    return Column(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple])),
        child: Image.asset(
          'assets/panic-logo.png',
          fit: BoxFit.cover,
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.settings,
          size: 40,
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SettingScreen()));
        },
        title: "Settings".text.xl2.make(),
        // tileColor: Vx.gray200,
      ),
      // ListTile(
      //   leading: Icon(
      //     Icons.dark_mode,
      //     size: 40,
      //   ),
      //   title: "Dark Mode".text.xl2.make(),
      //   trailing: Switch(
      //     onChanged: toggleDarkMod,
      //     value: isSwitched,
      //     activeColor: Colors.black,
      //     activeTrackColor: Colors.grey,
      //     // inactiveThumbColor: Colors.redAccent,
      //     // inactiveTrackColor: Colors.orange,
      //   ),
      //   // tileColor: Vx.gray200,
      // ),
      // ListTile(
      //   onTap: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => HelpScreen()));
      //   },
      //   leading: Icon(
      //     Icons.help_outline_sharp,
      //     size: 40,
      //   ),
      //   title: "Help".text.xl2.make(),
      //   // tileColor: Vx.gray200,
      // ),
      ListTile(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditProfile()));
        },
        leading: Icon(
          Icons.mode_edit_outline_outlined,
          size: 40,
        ),
        title: "Edit Profile".text.xl2.make(),
        // tileColor: Vx.gray200,
      ),
      // ListTile(
      //   leading: Icon(
      //     Icons.notifications_active,
      //     size: 40,
      //   ),
      //   title: "Notification Settings".text.xl2.make(),
      //   // tileColor: Vx.gray200,
      // ),
    ]);
  }
}
