import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset('assets/images/bg1.jpeg'),
          const SafeArea(
            child: Text("Welcome"),
          )
        ],
      ),
    );
  }
}
