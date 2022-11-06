import 'package:flutter/material.dart';

class CamaraPage extends StatefulWidget {
  const CamaraPage({super.key});

  @override
  State<CamaraPage> createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camara"),
      ),
      body: Center(
        child: Text("This is the camera page"),
      ),
    );
  }
}
