import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/contact_model.dart';

class Alert extends ChangeNotifier {
  void animateButton(AnimationController _controller) {
    return _controller.reset();
  }

  Future StopAnimate(AnimationController _controller) {
    return _controller.repeat(reverse: true);
  }
}

class MessageProvider extends ChangeNotifier {
  List<String>? messagelist = [];
  mymessageslist(String message) {
    messagelist!.add(message);

    notifyListeners();
  }

  List<String>? get message => messagelist;
}

class ContactProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  List<Contacts>? contactList = [];
  saveContact(List<Contacts> contactlist, String name, String phone) async {
    prefs = await SharedPreferences.getInstance();
    contactList = contactlist;
    contactList?.add(Contacts(name: name, phone: phone));

    final String encodedData = Contacts.encode(contactList!);
    await prefs.setString("contacts", encodedData);
    notifyListeners();
  }

  // getContacts() async {
  //   prefs = await SharedPreferences.getInstance();
  //   final String contactJson = await prefs.getString("contacts")!;
  //   contactList = Contacts.decode(contactJson);

  //   notifyListeners();
  // }

  deleteContact(int i) async {
    prefs = await SharedPreferences.getInstance();
    getContactList!.removeAt(i);
    final String encodedData = Contacts.encode(getContactList!);
    await prefs.setString("contacts", encodedData);
    notifyListeners();
  }

  List<Contacts>? get getContactList {
    return contactList;
  }
}
