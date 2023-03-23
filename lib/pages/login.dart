import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:turbo_neptun/api/authenticate.dart';
import 'dart:convert';

import 'package:turbo_neptun/components/formfields/password_input.dart';
import 'package:turbo_neptun/model/university.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  University? selectedUniversity;
  final _formKey = GlobalKey<FormState>();
  TextEditingController neptuneCode = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final univerities = ModalRoute.of(context)!.settings.arguments as List<University>;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<University>(
                hint: const Text("Válassz egy egyetemet..."),
                isExpanded: true,
                value: selectedUniversity, 
                items: univerities.map((e) => 
                  DropdownMenuItem(
                    value: e, 
                    child: Text(e.name)
                  )).toList(), 
                onChanged: (University? e) {
                  setState(() {
                    selectedUniversity = e!;
                  });
                },
                validator: (value) => value == null ? "Az egyetem nem lehet üres!" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: neptuneCode,
                validator: (value) {
                  if (value?.length != 6) {
                    return "Helytelen Neptun kód!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Neptun kód",
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 12),
              PasswordFormField(controller: password, hintText: "Jelszó", prefixIcon: Icons.lock_outline,),
              const SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if (await authenticate(selectedUniversity, neptuneCode.text, password.text)) {
                    Navigator.pushReplacementNamed(context, "/home");
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(130, 50)
                ),
                child: const Text("Bejelentkezés"),
              ),
              const SizedBox(height: 12,)
              
            ],
          )
        ),
      ),
    );
  }
}