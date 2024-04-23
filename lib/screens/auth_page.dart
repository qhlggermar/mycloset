import 'package:flutter/material.dart';
import 'package:my_closet/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:my_closet/screens/home_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData){
              // User is logged in, navigate to the home page
              return const MyHome();
            } else {
              // User is not logged in, navigate to the login page
              return const LogIn();
            }
          }
        },
      ),
    );
  }
}