import 'package:flutter/material.dart';
import 'package:outfly/widgets/custom_scaffold.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Text('Registration Screen'),
    );
  }
}
