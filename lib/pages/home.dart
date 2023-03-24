import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(
            label: "Üzenetek",
            icon: Icon(Icons.mail_outline)
          ),
          BottomNavigationBarItem(
            label: "Órarend",
            icon: Icon(Icons.calendar_month_outlined)
          ),
        ]
      ),
    );
  }
}