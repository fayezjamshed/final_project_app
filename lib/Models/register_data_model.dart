class Register {
  RegisterData? data;

  Register({this.data});

  Register.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new RegisterData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegisterData {
  String? name;
  String? email;
  String? phone;
  String? age;
  String? cnic;
  String? address;
  String? distric;

  RegisterData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.cnic,
      required this.address,
      required this.distric});

  RegisterData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    age = json['age'];
    cnic = json['cnic'];
    address = json['address'];
    distric = json['distric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['cnic'] = this.cnic;
    data['address'] = this.address;
    data['distric'] = this.distric;
    return data;
  }
}
