import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CamaraPage extends StatefulWidget {
  const CamaraPage({super.key});

  @override
  State<CamaraPage> createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

    await cameraController.initialize().then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      },
    ).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [CameraPreview(cameraController)],
        ),
      );
    }
    return Container();
  }
}