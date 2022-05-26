import 'dart:convert';

import 'package:final_project_app/Models/contact_model.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  late SharedPreferences prefs;
  Contacts? contacts;
  @override
  void initState() {
    // TODO: implement initState
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> contactJson = jsonDecode(prefs.getString("contacts")!);
    contacts = await Contacts.fromJson(contactJson);
    print(contacts!.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: contacts?.name!.length == 0
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 2,
          color: Colors.blueAccent,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "${contacts?.name}".text.xl2.bold.white.make(),
                "+92 ${contacts?.phone}".text.xl.white.make(),
              ],
            ).p(10),
          ),
        ).p(10),
        GestureDetector(
          onTap: () => showDialog(
              context: context, builder: (context) => CustomDialog()),
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_1_outlined),
              "Tap To Add Friend".text.xl2.make().p(5)
            ],
          ),
        )
      ],
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController _name = TextEditingController();
  TextEditingController _ph_no = TextEditingController();
  // final prefs = await SharedPreferences();
  // final  prefs SharedPreferences;
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> contactJson = jsonDecode(prefs.getString("contacts")!);
  }

  saveData() {
    // ContactDetail contactDetail= c;
    Contacts contacts = Contacts(name: _name.text, phone: _ph_no.text);
    String contactData = jsonEncode(contacts);
    prefs.setString("contacts", contactData);

    // ContactDetail contactDetail = ContactDetail(contacts: contacts);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            "Add contact for emergency".text.xl.make().p(10),
            TextField(
              controller: _name,
              decoration: InputDecoration(label: "Enter Name".text.make()),
            ).p(10),
            TextField(
                    controller: _ph_no,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: "Enter Phone Number".text.make(),
                        prefix: "+92 ".text.make()))
                .p(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: "Close".text.bold.xl.make().p(5))
                    .p(10),
                ElevatedButton(
                        onPressed: () {
                          saveData();
                          Navigator.pop(context);
                        },
                        child: "ADD".text.bold.xl.make().p(5))
                    .p(10)
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
