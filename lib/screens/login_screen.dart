import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imanph/screens/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

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
                'Welcome Back!',
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
              Row(
                children: [
                  Checkbox(
                    value: true, // Example value, adjust as needed
                    onChanged: (value) {
                      // Handle checkbox state change
                    },
                    activeColor: Colors.lightGreen, // Active checkbox color
                  ),
                  const Text(
                    'Keep me signed in',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Perform login logic here

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightGreen, // Text color
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: 'Forgot your password? ',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Reset here',
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.lightGreen,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Perform password reset navigation
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
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
        suffixIcon: label == 'Password'
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
        icon: const Icon(Icons.arrow_back),
        color: Colors.lightGreen,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Log In',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
