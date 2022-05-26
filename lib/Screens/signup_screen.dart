import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:final_project_app/httpservice.dart';
import 'package:flutter/material.dart';
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
  final name = TextEditingController();
  final cnic = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future postdatacall() async {
    await https!.signUprequest(
        name.text, cnic.text, email.text, phoneNumber.text, password.text);
  }

  @override
  void initState() {
    https = HttpService();
    super.initState();
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
                controller: password,
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
                controller: confirmPassword,
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
                controller: confirmPassword,
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
