// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  // Dio? _dio = new Dio();
  Future signUprequest(String name, String cnic, String email,
      String phonenumber, String password) async {
    final String url = "http://localhost/Rest_API/insert.php";
    Map data = {
      'full_name': name,
      'CNIC': cnic,
      'Email': email,
      'mobile number': phonenumber,
      'User_password': password,
      'password': password,
      'confirm_Password': password
    };

    var res = await http.post(Uri.parse(url),
        // headers: {
        //   "Access-Control-Allow-Origin": "*",
        //   "Content-type": "application/json",
        //   "Access-Control-Allow-Methods": "POST"
        // },
        body: json.encode(data));
    print(res);
  }

  Future loginRequest(String email, String password) async {
    final String url = "http://localhost/Rest_API/api-insert.php";
    Map data = {
      'User_Name': email,
      'password': password,
    };

    var res = await http.post(Uri.parse(url),
        // headers: {
        //   "Access-Control-Allow-Origin": "*",
        //   "Content-type": "application/json",
        //   "Access-Control-Allow-Methods": "POST"
        // },
        body: jsonEncode(data));
    print("response is");
    print(res);
  }
}
