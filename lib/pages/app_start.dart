import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:turbo_neptun/model/university.dart';

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  List<University> universities = List.empty();

  void getInstitutions() async {
    HttpClient client = HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    IOClient ioClient = IOClient(client);
    Response rawResponse = await ioClient.post(Uri.https("mobilecloudservice.cloudapp.net", "MobileServiceLib/MobileCloudService.svc/GetAllNeptunMobileUrls"));
    var response = jsonDecode(rawResponse.body) as List<dynamic>;

    universities = response.where((e) => e["Url"] != null).map((e) => University(name: e["Name"], omCode: e["OMCode"], baseUrl: e["Url"])).toList();
    print(universities);

    await Navigator.pushReplacementNamed(context, "/login", arguments: universities);
  }

  @override
  void initState() {
    super.initState();

    
    getInstitutions();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(color: Colors.lightBlue, size: 140),
    );
  }
}