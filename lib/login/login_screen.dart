import 'package:flutter/material.dart';

import 'package:flutter_basic_samples/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: LoginForm(),
    );
  }
}
