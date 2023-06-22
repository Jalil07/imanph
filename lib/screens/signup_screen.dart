import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  bool _obscureText = true;
  String email = '';
  String password = '';
  String name = '';
  String surname = '';

  void _signup(BuildContext context) {
    // Show circular progress indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Use the email and password variables for signup/authentication with Firebase
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
      // Signup successful
      User? user = userCredential.user;
      // Handle the signed up user
      // Perform additional actions with the signed-up user here
      // For example, save user data to Firestore database
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'email': email,
        'name': name,
        'surname': surname,
      });
      // Navigate to LoginScreen after signup
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }).catchError((error) {
      // Signup failed
      // Hide the progress indicator
      Navigator.pop(context);

      // Show snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed: $error'),
          duration: const Duration(seconds: 3),
        ),
      );

      // Handle the error
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 32.0),
              _textBox('Username', Icons.person, nameController, onChange: (value) {
                // Handle email changes
                setState(() {
                  name = value; // Update the email variable
                });
              }),
              const SizedBox(height: 16.0),
              _textBox('Email', Icons.email, emailController,
                  onChange: (value) {
                // Handle email changes
                setState(() {
                  email = value; // Update the email variable
                });
              }),
              const SizedBox(height: 16.0),
              _textBoxPassword('Password', Icons.lock, passwordController,
                  onChange: (value) {
                // Handle email changes
                setState(() {
                  password = value; // Update the email variable
                });
              }),
              const SizedBox(height: 16.0),
              _textBoxPassword(
                  'Confirm Password', Icons.lock, confirmPasswordController,
                  onChange: (value) {
                // Handle email changes

              }),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // Perform SignUp logic here
                  _signup(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen, // Text color
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in here',
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.lightGreen,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Perform navigation to the login screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textBox(
      String label,
      IconData icon,
      TextEditingController?
      controller,
      {Function(String)? onChange}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Colors.lightGreen, // Active hint label color
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.lightGreen, // Active icon color
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightGreen), // Active border color
        ),
      ),
      cursorColor: Colors.lightGreen, // Cursor color
      onChanged: (value) {
        onChange?.call(value); // Call the provided onChange callback
      },
    );
  }

  TextFormField _textBoxPassword(
      String label,
      IconData icon,
      TextEditingController?
      controller,
      {Function(String)? onChange}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Colors.lightGreen, // Active hint label color
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.lightGreen, // Active icon color
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.lightGreen), // Active border color
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.lightGreen,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
      ),
      cursorColor: Colors.lightGreen, // Cursor color
      onChanged: (value) {
        onChange?.call(value); // Call the provided onChange callback
      },
      obscureText: _obscureText,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        splashRadius: 25,
        icon: const Icon(Icons.arrow_back),
        color: Colors.lightGreen,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Create',
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ' Account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
