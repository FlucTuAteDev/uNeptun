import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:turbo_neptun/model/university.dart';

class Neptun {
  static final Uri INSTITUTIONS_URI = Uri.https("mobilecloudservice.cloudapp.net", "MobileServiceLib/MobileCloudService.svc/GetAllNeptunMobileUrls");

  static IOClient _getIOClientWithoutCertValidation() {
    HttpClient client = HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    IOClient ioClient = IOClient(client);

    return ioClient;
  }

  static Future<List<University>> getAllUniversities() async {
    IOClient client = _getIOClientWithoutCertValidation();
    Response rawResponse = await client.post(INSTITUTIONS_URI);
    var response = jsonDecode(rawResponse.body) as List<dynamic>;

    List<University> universities = 
      response
        .where((e) => e["Url"] != null)
        .map((e) => 
          University(
            name: e["Name"], 
            omCode: e["OMCode"], 
            baseUrl: e["Url"])
          ).toList();
    return universities;
  }

  static Future<bool> authenticate(University university, String neptuneCode, String password) async {
    Response response = await post( 
      Uri.parse("${university.baseUrl}/GetMessages"),
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
}