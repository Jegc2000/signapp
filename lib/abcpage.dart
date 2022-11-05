import 'package:flutter/material.dart';

class AbcPage extends StatefulWidget {
  const AbcPage({super.key});

  @override
  State<AbcPage> createState() => _AbcPageState();
}

class _AbcPageState extends State<AbcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABC"),
      ),
      body: Center(
        child: Text("This is abecedario page"),
      ),
    );
  }
}
