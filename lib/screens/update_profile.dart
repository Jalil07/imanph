import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
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
              'Update',
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.lightGreen,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Change Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                style: const TextStyle(fontFamily: 'Poppins'),
                cursorColor: Colors.lightGreen,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.lightGreen,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                style: const TextStyle(fontFamily: 'Poppins'),
                cursorColor: Colors.lightGreen,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.lightGreen,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _positionController,
                style: const TextStyle(fontFamily: 'Poppins'),
                cursorColor: Colors.lightGreen,
                decoration: const InputDecoration(
                  labelText: 'Position',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.lightGreen,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Save button logic here
                  // Access the updated values from the text controllers
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String position = _positionController.text;

                  // Perform the necessary operations to save the updated profile

                  // Show a snackbar or navigate to another screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
