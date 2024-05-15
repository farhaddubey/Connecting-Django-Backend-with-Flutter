import 'dart:convert';

import 'package:http/http.dart' as http;

class Student {
  // String baseUrl = "http://127.0.0.1:8000/api/student/";
  String baseUrl = "http://10.0.2.2:8000/api/student";
  // We need to install http package for connecting.
  Future<List> getAllStudent() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
