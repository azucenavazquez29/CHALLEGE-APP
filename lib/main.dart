import 'package:flutter/material.dart';
import 'package:flutter_application_challege/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // En este widget es para la aplicación principal 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// el debug es para quitar la sección de la aplicación
      debugShowCheckedModeBanner: false,
      title: 'COFFE APP',
      theme: ThemeData(  
     colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 206, 197, 203)),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

