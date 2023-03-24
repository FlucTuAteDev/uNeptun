import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:u_neptun/app_secure_storage.dart';

import 'package:u_neptun/model/university.dart';
import 'package:u_neptun/api/neptun.dart';
import 'package:u_neptun/model/user.dart';

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  List<University> universities = List.empty();

  void init() async {
    User? user = await AppSecureStorage.getUser();
    if (user == null || !await Neptun.authenticate(user)) {
      universities = await Neptun.getAllUniversities();
      await Navigator.pushReplacementNamed(context, "/login", arguments: universities);
      return;
    }

    await Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(color: Colors.lightBlue, size: 140),
    );
  }
}