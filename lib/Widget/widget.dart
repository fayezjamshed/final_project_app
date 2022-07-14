import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

InputDecoration textfielddecoration(String hinttext, String lable, Icon icon) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    prefixIcon: icon,
    hintText: hinttext,
    // label: lable.text.make(),
    border: OutlineInputBorder(
      // gapPadding: 5,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

Widget appBarMain(String title) {
  return AppBar(
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue, Colors.red])),
    ),
    title: title.text.xl3.bold.make(),
    leadingWidth: 80,
    // leading: GestureDetector(
    //   onTap: () {
    //     Navigator.pop(context);
    //   },
    // child: Container(
    //   width: 20,
    //   decoration: BoxDecoration(
    //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
    //   child: Row(
    //     // mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Icon(
    //         Icons.arrow_back_sharp,
    //         color: Colors.red,
    //       ),
    //       Text(
    //         "BACK",
    //         style: TextStyle(
    //             color: Colors.red, fontWeight: FontWeight.bold),
    //       )
    //     ],
    //   ),
    // ).pOnly(left: 10).py(16),
    // ),
  );
}
