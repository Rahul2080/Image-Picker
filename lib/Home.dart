import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);
      } else {
        print("No image Picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          image != null
              ? Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Image.file(
              image!,
              fit: BoxFit.cover,
            ),
          )
              : Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                "No image selected",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              getImageGallery();
            },
            child: Center(
              child: Container(
                width: 180,
                height: 50,
                decoration: ShapeDecoration( color: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: const Center(
                  child: Text("Pick image from gallery"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              getImageCamera();
            },
            child: Container(
              width: 180,
              height: 50,
             decoration: ShapeDecoration( color: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Center(
                child: Text("Take a photo with camera"),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
