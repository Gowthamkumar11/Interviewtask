import 'package:flutter/material.dart';
import 'package:trustayur/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Maitree"),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
