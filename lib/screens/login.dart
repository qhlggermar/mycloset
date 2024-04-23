import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing Snackbars
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Signing in...'),
        duration: Duration(seconds: 2), // Show a loading message for 2 seconds
      ));

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing Snackbars
      String errorMessage = 'An error occurred.';

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid credentials. Please check your email and password.';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    }
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextFormField(
                  controller: _email,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Email is Empty!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: _password,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Password is Empty!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthService.signInWithEmailAndPassword(
                          context,
                          _email.text,
                          _password.text,
                        );
                      }
                    },
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator(color: Colors.white))
                        : const Text("Login"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement signup functionality
                      }
                    },
                    child: const Text("Signup"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
