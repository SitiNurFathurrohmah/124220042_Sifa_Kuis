import 'package:flutter/material.dart';
import 'package:sifa_kuis/pages/LoginPage.dart';

void main(){
  runApp(const MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp();

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "Bank Sampah",
    theme: ThemeData(
      primarySwatch: Colors.purple
    ),
    home: LoginPage()
  );
}
}

