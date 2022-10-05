// ignore_for_file: file_names, prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({Key? key}) : super(key: key);

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

//place name
//date
//amount
TextEditingController placeNameController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController dateController = TextEditingController();

getDataFromUser() {
  String placeName = placeNameController.text.trim();
  String date = dateController.text.trim();

  int amount = int.parse(amountController.text.trim());

  placeNameController.clear();
  amountController.clear();
  dateController.clear();

  Map<String, dynamic> userDate = {
    "Place Name": placeName,
    "date": date,
    "amount": amount
  };
  if (placeName != "" && amount != "" && date != "") {
    FirebaseFirestore.instance.collection("Expenses").add(userDate);
    log("User Save :)");
  } else {
    log("Enter All field Date");
  }
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expenses Screeen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //Place name
          TextFormField(
            controller: placeNameController,
            decoration: InputDecoration(label: Text("Enter Place Name ")),
          ),
          //amount
          TextFormField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(label: Text("Enter Amount "))),
          //date
          Row(
            children: [
              Container(
                child: Expanded(
                  child: TextFormField(
                      enabled: false,
                      controller: dateController,
                      decoration:
                          InputDecoration(label: Text("Select Dates "))),
                ),
              ),
              IconButton(
                onPressed: () async {
                  DateTime? currentDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2023));

                  if (currentDate != null) {
                    setState(() {
                      String time =
                          "${currentDate.day}/${currentDate.month}/${currentDate.year}";
                      dateController.text = time;
                    });
                  } else {
                    return;
                  }
                },
                icon: Icon(Icons.calendar_month),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                getDataFromUser();
              },
              child: Text("Save")),
        ]),
      ),
    );
  }
}
