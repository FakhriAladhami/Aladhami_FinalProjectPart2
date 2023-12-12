import 'package:crud_app/views/about_view.dart';
import 'package:crud_app/views/home_view.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Perform basic validations here
  bool validateForm() {
    if (usernameController.text.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username should be of minimum 2 characters')));
      return false;
    } else if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password should be of minimum 6 characters')));
      return false;
    } else {
      return true;
    }
  }

  /// Perform actual login here, after completing basic validation.
  Future<void> handleLogin() async {
    if (validateForm()) {
      if (usernameController.text != await storage.read(key: 'username')) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Incorrect Username')));
      } else if (passwordController.text !=
          await storage.read(key: 'password')) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Incorrect Password')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Success')));
        await Future.delayed(const Duration(seconds: 2));

        // If Login is successful, we will move to the Home Page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeView(),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                handleLogin();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue[900])),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              InkWell(
                child: const Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutView(),
                  ));
                },
              ),
              const Spacer(),
              const Text('Version 1.0.1')
            ],
          )),
    );
  }
}
