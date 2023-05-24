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
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  bool _obscureText = true;
  bool _confirmObscureText = true;

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
              _textBox('Email', Icons.email, emailController, onChange: (value) {
                // Handle email changes
              }),
              const SizedBox(height: 16.0),
              _textBox('Password', Icons.lock, passwordController, onChange: (value) {
                // Handle email changes
              }),
              const SizedBox(height: 16.0),
              _textBox('Confirm Password', Icons.lock, confirmPasswordController, onChange: (value) {
                // Handle email changes
              }),
              const SizedBox(height: 16.0),
              _textBox('Name', Icons.person, nameController, onChange: (value) {
                // Handle email changes
              }),
              const SizedBox(height: 16.0),
              _textBox('Family Name', Icons.person, familyNameController, onChange: (value) {
                // Handle email changes
              }),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform login logic here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightGreen, // Text color
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
                  style: const TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Poppins',),
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
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textBox(String label, IconData icon, TextEditingController? controller, {Function(String)? onChange}) {
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
          borderSide: BorderSide(color: Colors.lightGreen), // Active border color
        ),
        suffixIcon: label == 'Password' || label == 'Confirm Password'
            ? IconButton(
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
            : null,
      ),
      cursorColor: Colors.lightGreen, // Cursor color
      onChanged: onChange,
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
      title:  const Row(
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
