import 'package:flutter/material.dart';

class LectionsPage extends StatefulWidget {
  const LectionsPage({super.key});

  @override
  State<LectionsPage> createState() => _LectionsPageState();
}

class _LectionsPageState extends State<LectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lections"),
      ),
      body: Center(
        child: Text("This is main page"),
      ),
    );
  }
}
