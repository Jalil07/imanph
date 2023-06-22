import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class RxPad extends StatefulWidget {
  @override
  _RxPadState createState() => _RxPadState();
}

class _RxPadState extends State<RxPad> {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController medicationController = TextEditingController();

  String? signatureImagePath;
  final _screenshotController = ScreenshotController();

  Future<void> _pickSignatureImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final signatureImage = File(pickedImage.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('signatureImagePath', signatureImage.path);
      setState(() {
        signatureImagePath = signatureImage.path;
      });
    }
  }

  Future<void> _loadSignatureImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('signatureImagePath');
    if (imagePath != null) {
      setState(() {
        signatureImagePath = imagePath;
      });
    }
  }

  Future saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final result = await ImageGallerySaver.saveImage(bytes, name: 'rx pad.jpg');
    return result['filePath'];
  }

  @override
  void initState() {
    super.initState();
    _loadSignatureImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxPad'),
      ),
      body: Column(
        children: [
          Screenshot(
            controller: _screenshotController,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Doctor Name:'),
                    TextField(
                      controller: doctorNameController,
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Patient Name:'),
                    TextField(
                      controller: patientNameController,
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Medication:'),
                    TextField(
                      controller: medicationController,
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Doctor Signature:'),
                    signatureImagePath != null
                        ? Image.file(
                            File(signatureImagePath!),
                            fit: BoxFit.contain,
                            height: 45,
                          )
                        : const Icon(Icons.image_not_supported, size: 45),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: _pickSignatureImage,
                  child: const Text('Insert Signature'),
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  onPressed: () async {
                    final image = await _screenshotController.capture();
                    if (image == null) return;
                    await saveImage(image);
                    Fluttertoast.showToast(
                        msg: "Saved to Gallery",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black87,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {});
                  },
                  child: const Text('Save Prescription'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
