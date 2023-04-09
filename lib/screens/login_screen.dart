import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

import '../ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Login', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),
              _LoginForm(),
            ],
          )),
          const SizedBox(
            height: 50,
          ),
          const Text('Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded),
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '***********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline),
          ),
          const SizedBox(height: 30),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text('Ingresar',
                      style: TextStyle(color: Colors.white))),
              onPressed: () {})
        ],
      )),
    );
  }
}