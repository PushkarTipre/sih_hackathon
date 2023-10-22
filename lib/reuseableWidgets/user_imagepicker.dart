import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_hack/screens/sih_login.dart';

class sih_user_ImagePicker extends StatefulWidget {
  const sih_user_ImagePicker({super.key});

  @override
  State<sih_user_ImagePicker> createState() => _sih_user_ImagePickerState();
}

class _sih_user_ImagePickerState extends State<sih_user_ImagePicker> {
  File? _pickedImageFile;
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxWidth: 200,
        maxHeight: 200);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  void _pickImageGallery() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxWidth: 200,
        maxHeight: 200);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sih_Login(),
                ),
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text('Your Image'),
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey), // Optional: Add border to the container
            ),
            child: Center(
              child: _pickedImageFile != null
                  ? Image.file(
                      _pickedImageFile!,
                      width: 500,
                      height: 500,
                      fit: BoxFit
                          .contain, // Use BoxFit to control how the image is inscribed into the space
                    )
                  : Text('No image selected.'),
            ),
          ),
          // CircleAvatar(
          //   radius: 40.0,
          //   backgroundColor: Colors.grey,
          //   foregroundImage:
          //       _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
          // ),
          TextButton.icon(
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text(
              'Add Image using camera',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton.icon(
            onPressed: _pickImageGallery,
            icon: Icon(Icons.image),
            label: Text(
              'Add Image from gallery',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
