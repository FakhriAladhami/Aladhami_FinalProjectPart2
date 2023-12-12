import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: const [
          Text(
            'This application helps the user to connect with the world by reading published sayings and increases the reader’s knowledge. This application is designed to suit all ages through simple control of the program tools.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Developed By Fakhri for CMSC 2204',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
