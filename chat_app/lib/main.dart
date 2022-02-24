import 'package:camera/camera.dart';
import 'package:chat_app/NewScreen/LandingScreen.dart';
import 'package:chat_app/Screens/Homescreen.dart';
import 'package:chat_app/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/CameraScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: LoginScreen(),
    );
  }
}
