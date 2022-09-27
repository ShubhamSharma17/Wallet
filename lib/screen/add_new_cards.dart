// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();

  saveData() async {
    String cardNumber = cardNumberController.text.trim();
    String expireDate = expireDateController.text.trim();

    cardNumberController.clear();
    expireDateController.clear();
    Map<String, dynamic> userData = {
      "cardNumber": cardNumber,
      "expireDate": expireDate,
    };

    if (cardNumber != "" && expireDate != "") {
      await FirebaseFirestore.instance.collection("Cards").add(userData);
      log("user data saved successfully! ");
    } else {
      log("Please Carefully Enter correct data! :)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Cards")),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(labelText: "Card Number"),
              ),
              TextField(
                controller: expireDateController,
                decoration: InputDecoration(labelText: "Expire Date"),
              ),
              SizedBox(height: 10),
              CupertinoButton(
                child: Text("Save"),
                onPressed: () {
                  saveData();
                },
              )
            ]),
          )
        ],
      ),
    );
  }
}
