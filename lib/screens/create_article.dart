import 'package:flutter/material.dart';

class CreateArticleScreen extends StatefulWidget {
  @override
  State<CreateArticleScreen> createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(fontFamily: 'Poppins'),
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                labelText: 'Title',
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
              controller: _contentController,
              style: const TextStyle(fontFamily: 'Poppins'),
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                labelText: 'Content',
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.lightGreen,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Publish button logic here
                // Access the values from the text controllers
                String title = _titleController.text;
                String content = _contentController.text;

                // Perform necessary operations to publish the article

                // Show a snackbar or navigate to another screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Article published')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                textStyle: const TextStyle(fontFamily: 'Poppins'),
              ),
              child: const Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
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
            ' Article',
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
