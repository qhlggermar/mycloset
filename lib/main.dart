import 'package:flutter/material.dart';
import 'package:my_closet/Screens/login-design.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_closet/firebase_options.dart';
import 'package:my_closet/screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "My Closet",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const MyHome(),

      debugShowCheckedModeBanner: false,
    );
  }
}

