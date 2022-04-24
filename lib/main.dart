import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_test/QuizScreen.dart';
import 'package:nice_buttons/nice_buttons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mathematics',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: QuizScreen(),
    );
  }
}
