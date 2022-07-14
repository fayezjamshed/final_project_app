import 'dart:convert';

class ContactDetail {
  List<Contacts>? contacts;

  ContactDetail({this.contacts});

  ContactDetail.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String? name;
  String? phone;

  Contacts({required this.name, required this.phone});

  Contacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }

  static Map<String, dynamic> toMap(Contacts contacts) => {
        'name': contacts.name,
        'phone': contacts.phone,
      };

  static String encode(List<Contacts> contacts) => json.encode(
        contacts
            .map<Map<String, dynamic>>((contacts) => Contacts.toMap(contacts))
            .toList(),
      );
  static List<Contacts> decode(String contacts) =>
      (json.decode(contacts) as List<dynamic>)
          .map<Contacts>((item) => Contacts.fromJson(item))
          .toList();
}
