// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddNewPerson extends StatefulWidget {
  const AddNewPerson({Key? key}) : super(key: key);

  @override
  State<AddNewPerson> createState() => _AddNewPersonState();
}

class _AddNewPersonState extends State<AddNewPerson> {
  TextEditingController nameController = TextEditingController();
  File? profilePic;

  saveData() async {
    String name = nameController.text.trim();
    nameController.clear();

    if (profilePic != null && name != "") {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("profilePictures")
          .child(Uuid().v1())
          .putFile(profilePic!);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      log(name);
      log(downloadUrl.toString());
      Map<String, dynamic> userData = {
        "name": name,
        "profilePic": downloadUrl,
      };
      FirebaseFirestore.instance.collection("Peoples").add(userData);
      log("User Save :)");
    } else {
      log("Please Fill all the data :)");
    }
    setState(() {
      profilePic = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Person Screeen")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                (profilePic != null) ? FileImage(profilePic!) : null,
          ),
          ElevatedButton(
              onPressed: () async {
                XFile? selectedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (selectedImage != null) {
                  File convertedFile = File(selectedImage.path);
                  setState(() {
                    profilePic = convertedFile;
                  });
                  log("Image Selected");
                } else {
                  log("No Image Selected");
                }
              },
              child: Text("Select Image")),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
