import 'dart:convert';
import 'package:final_project_app/Models/register_data_model.dart';
import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../httpservice.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: appBarMain("Edit Profile"),
        ),
        body: EditProfileField());
  }
}

class EditProfileField extends StatefulWidget {
  const EditProfileField({Key? key}) : super(key: key);

  @override
  State<EditProfileField> createState() => _EditProfileFieldState();
}

class _EditProfileFieldState extends State<EditProfileField> {
  HttpService? https;
  final name = TextEditingController();
  final cnic = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final distric = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;
  // RegisterData? registerData;
  @override
  void initState() {
    // TODO: implement initState
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> register = jsonDecode(prefs.getString("register")!);
    RegisterData registerData = RegisterData.fromJson(register);
    print(registerData.name);
    name.value = TextEditingValue(text: "${registerData.name}");
    cnic.value = TextEditingValue(text: "${registerData.cnic}");
    email.value = TextEditingValue(text: "${registerData.email}");
    phoneNumber.value = TextEditingValue(text: "${registerData.phone}");
    distric.value = TextEditingValue(text: "${registerData.distric}");
    age.value = TextEditingValue(text: "${registerData.age}");
    address.value = TextEditingValue(text: "${registerData.address}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red.shade700, Colors.blue, Colors.red.shade700])),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: name,
                decoration: textfielddecoration(
                    "Enter Full Name", "Full Name", Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ).py(10),
              TextFormField(
                controller: cnic,
                decoration:
                    textfielddecoration("Enter CNIC", "CNIC", Icon(null)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'CNIC is required';
                  }
                  return null;
                },
              ).py(10),
              TextFormField(
                controller: email,
                decoration: textfielddecoration(
                    "Enter Email", "Email", Icon(Icons.email_outlined)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ).py(10),
              TextFormField(
                      controller: phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Number is required';
                        }
                        return null;
                      },
                      decoration: textfielddecoration("Enter Mobile Number",
                          "Mobile Number", Icon(Icons.send_to_mobile_outlined)),
                      keyboardType: TextInputType.number)
                  .py(10),
              TextFormField(
                controller: distric,
                decoration: textfielddecoration(
                    "Distric", "Distric", Icon(Icons.location_on)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select Area';
                  }
                  return null;
                },
              ).py(10),
              TextFormField(
                controller: age,
                decoration:
                    textfielddecoration("Enter Age", " Age", Icon(null)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  return null;
                },
              ).py(10),
              TextFormField(
                controller: address,
                decoration: textfielddecoration(
                    "Enter Address", "Address", Icon(Icons.location_on)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ).py(10),
              SizedBox(
                height: 20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(200),
                onTap: () {
                  // postdatacall();
                  // if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, MyRoutes.homeroute);
                  // postdatacall();
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.purple.shade900,
                            Colors.red.shade800,
                            Colors.purple.shade800
                          ])),
                  child: "SUBMIT".text.xl3.white.make().p(5),
                ),
              ),
            ],
          ),
        ),
      ).p(20),
    );
  }
}
