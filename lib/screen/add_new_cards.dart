// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  displayMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  saveData() async {
    try {
      String expireDate = expireDateController.text.trim();

      num cNumber = int.parse(cardNumberController.text.trim());

      cardNumberController.clear();
      expireDateController.clear();
      Map<String, dynamic> userData = {
        "cardNumber": cNumber,
        "expireDate": expireDate,
      };

      if (cNumber is int && expireDate != "") {
        await FirebaseFirestore.instance.collection("Cards").add(userData);
        log("user data saved successfully! ");
        displayMessage("user data saved successfully! ");
      } else {
        displayMessage("Please Carefully Enter correct data! :)");
        log("Please Carefully Enter correct data! :)");
      }
    } on Exception catch (e) {
      displayMessage("Enter All Feild Credential ");
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add New Cards"),
        ),
        body: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: cardNumberController,
              decoration: InputDecoration(labelText: "Card Number"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Expanded(
                    child: TextField(
                      controller: expireDateController,
                      decoration: InputDecoration(
                        labelText: "Expire Date",
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      DateTime? currentDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2040),
                      );
                      if (currentDate == null) {
                        return;
                      } else {
                        setState(() {
                          String tempDate =
                              "${currentDate.year}/${currentDate.month}";
                          // log(tempDate);
                          expireDateController.text = tempDate;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month_outlined)),
              ],
            ),
            SizedBox(height: 1),
            SizedBox(height: 1),
            CupertinoButton(
              child: Text("Save"),
              onPressed: () {
                saveData();
              },
            ),
          ],
        ),

        // body: ListView(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.all(20),
        //       child: Column(children: [
        //         TextField(
        //           controller: cardNumberController,
        //           decoration: InputDecoration(labelText: "Card Number"),
        //         ),
        //         SizedBox(height: 10),
        //         Container(
        //           height: 200,
        //           width: MediaQuery.of(context).size.width,
        //           // color: Colors.cyan,
        //           child: TextField(
        //             readOnly: true,
        //             controller: expireDateController,
        //             decoration: InputDecoration(labelText: "Expire Date"),
        //           ),
        //         ),
        //         // TextField(
        //         //   readOnly: true,
        //         //   controller: expireDateController,
        //         //   decoration: InputDecoration(labelText: "Expire Date"),
        //         // ),
        //         IconButton(
        //             onPressed: () async {
        //               DateTime? currentDate = await showDatePicker(
        //                 context: context,
        //                 initialDate: DateTime.now(),
        //                 firstDate: DateTime(2022),
        //                 lastDate: DateTime(2040),
        //               );
        //               if (currentDate == null) {
        //                 return;
        //               } else {
        //                 setState(() {
        //                   // log(currentDate.toString());
        //                   String tempDate =
        //                       "${currentDate.year}/${currentDate.month}";
        //                   // log(tempDate);
        //                   expireDateController.text = tempDate;
        //                 });
        //               }
        //             },
        //             icon: Icon(Icons.calendar_month_outlined)),
        //         SizedBox(height: 10),
        //         CupertinoButton(
        //           child: Text("Save"),
        //           onPressed: () {
        //             saveData();
        //           },
        //         )
        //       ]),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
