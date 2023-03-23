import 'package:http/http.dart';
import 'dart:convert';

import 'package:turbo_neptun/model/university.dart';

Future<bool> authenticate(University? selectedUniversity, String neptuneCode, String password) async {
  Response response = await post( 
    Uri.parse("${selectedUniversity!.baseUrl}/GetMessages"),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'UserLogin': neptuneCode,
      'Password': password
    })
  );

  dynamic body = jsonDecode(response.body);
  return body["ErrorMessage"] == null;
}