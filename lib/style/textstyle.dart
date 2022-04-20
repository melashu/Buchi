import 'package:flutter/material.dart';

class Style {
  TextStyle get getWelcomeStyle => const TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent);

  TextStyle get appbarstyle =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  get getDetailStyle => const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent);

  get featureDetail => TextStyle(
      fontSize: 18, color: Colors.black, backgroundColor: Colors.amber[100]);
}
