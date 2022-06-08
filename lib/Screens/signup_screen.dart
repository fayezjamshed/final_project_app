import 'dart:convert';

import 'package:final_project_app/Models/register_data_model.dart';
import 'package:final_project_app/Screens/otp_screen.dart';
import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:final_project_app/httpservice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: appBarMain("Registration"),
        ),
        body: SignUpField());
  }
}

class SignUpField extends StatefulWidget {
  const SignUpField({Key? key}) : super(key: key);

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  HttpService? https;
  Register? register;
  RegisterData? registerData;
  final name = TextEditingController();
  final cnic = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final distric = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;

  // Future postdatacall() async {
  //   await https!.signUprequest(
  //       name.text, cnic.text, email.text, phoneNumber.text, password.text);
  // }

  @override
  void initState() {
    https = HttpService();

    super.initState();
  }

  saveData() async {
    // ContactDetail contactDetail= c;
    prefs = await SharedPreferences.getInstance();
    RegisterData registerData = RegisterData(
        address: address.text,
        age: age.text,
        cnic: cnic.text,
        distric: distric.text,
        email: email.text,
        name: name.text,
        phone: phoneNumber.text);
    // register?.data?.name = name.text;
    // register?.data?.cnic = cnic.text;
    // register?.data?.email = email.text;
    // register?.data?.address = address.text;
    // register?.data?.phone = phoneNumber.text;
    // register?.data?.distric = distric.text;
    // print(register?.data?.name);

    String registerjson = jsonEncode(registerData);
    prefs.setString("register", registerjson);

    // ContactDetail contactDetail = ContactDetail(contacts: contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.red.shade900,
            Colors.blue,
          ])),
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
                  saveData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              OtpScreen(phone_no: phoneNumber.text))));
                  // Navigator.pushNamed(context, MyRoutes.homeroute);

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
                  child: "REGISTER".text.xl3.white.make().p(5),
                ),
              ),
            ],
          ),
        ),
      ).p(20),
    );
  }
}
