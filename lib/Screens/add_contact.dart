import 'dart:convert';

import 'package:final_project_app/Models/contact_model.dart';
import 'package:final_project_app/Provider/provider_store.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  late SharedPreferences prefs;
  // List<Contacts> contactList = [];
  @override
  void initState() {
    // TODO: implement initState
    initPrefs();
    // Provider.of<ContactProvider>(context, listen: false).getContacts();

    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("contacts", "[]");
    // Map<String, dynamic> contactJson = jsonDecode(prefs.getString("contacts")!);
    // contacts = await Contacts.fromJson(contactJson);
    // prefs = await SharedPreferences.getInstance();
    // final String contactJson = await prefs.getString("contacts")!;
    // contactList = Contacts.decode(contactJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contacts, child) => Column(
        mainAxisAlignment: contacts.getContactList?.length == 0
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
              itemCount: contacts.getContactList?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  color: Colors.redAccent,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListTile(
                      title: contacts
                          .getContactList?[index].name!.text.xl2.bold.white
                          .make(),
                      subtitle: "+92 ${contacts.getContactList?[index].phone}"
                          .text
                          .xl
                          .white
                          .make(),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          contacts.deleteContact(index);
                        },
                      ),
                    ).p(3),
                  ),
                ).p(10);
              }),
          contacts.getContactList!.length < 3
              ? GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                            contactsData: contacts.getContactList,
                          )),
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add_alt_1_outlined),
                      "Tap To Add Friend".text.xl2.make().p(5)
                    ],
                  ),
                )
              : Text(
                  "Only three contacts can be added",
                  style: TextStyle(fontSize: 18),
                )
        ],
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  List<Contacts>? contactsData;
  CustomDialog({Key? key, required this.contactsData}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController _name = TextEditingController();
  TextEditingController _ph_no = TextEditingController();
  Contacts? contacts;
  List<Contacts>? contactList = [];

  // final prefs = await SharedPreferences();
  // final  prefs SharedPreferences;
  late SharedPreferences prefs;
  @override
  void initState() {
    contactList = widget.contactsData;

    // TODO: implement initState

    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveData() async {
    // contactList?.add(Contacts(name: _name.text, phone: _ph_no.text));
    // final String encodedData = Contacts.encode(contactList!);
    // prefs.setString("contacts", encodedData);
    Provider.of<ContactProvider>(context, listen: false)
        .saveContact(contactList!, _name.text, _ph_no.text);
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
                          // prefs.clear();
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
