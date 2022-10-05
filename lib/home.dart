// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_wallet/models/expenses_model.dart';
import 'package:project_wallet/models/person_model.dart';
import 'package:project_wallet/screen/addExpensesScreen.dart';
import 'package:project_wallet/screen/add_new_cards.dart';
import 'package:project_wallet/screen/add_new_person.dart';
import 'package:project_wallet/screen/drawer_Screen.dart';
import 'package:project_wallet/widgets/card_widget.dart';
import 'package:project_wallet/widgets/expenses_widget.dart';
import 'package:project_wallet/widgets/person_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String currentDay =
    "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 5,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText("Wallet",
                speed: const Duration(milliseconds: 500),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ))
          ],
          totalRepeatCount: 10,
        ),
        actions: [
          FloatingActionButton(
              backgroundColor: Colors.indigo,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.notifications_on_sharp))
        ],
      ),
      //drawer
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: SweepGradient(
                        center: Alignment.topCenter,
                        // colors: [Colors.blue, Colors.white],
                        colors: [Colors.white38, Colors.black54],
                        startAngle: 1,
                        endAngle: 2.5)),
              ),
              Positioned(
                  right: 20,
                  top: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewCardScreen(),
                            ));
                      },
                      icon: const Icon(Icons.add))),

              Positioned(
                  top: 250,
                  // right: 25,
                  // left: 25,
                  child: SizedBox(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue[300],
                      color: Colors.transparent,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Send Money",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_right_rounded)
                            ],
                          ),
                          const SizedBox(height: 10),
                          //List of persons
                          SizedBox(
                            height: 120,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    height: 120,
                                    width: 100,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // Button for add person
                                          Container(
                                            // height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: IconButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddNewPerson(),
                                                  )),
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text("Add People")
                                        ]),
                                  ),
                                ),
                                //-------Person widget------
                                Expanded(
                                  child: PersonWidget(),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: const [
                          //         Text(
                          //           "All",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //         SizedBox(width: 10),
                          //         Text(
                          //           "Received",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //         SizedBox(width: 10),
                          //         Text(
                          //           "Send",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     const Icon(Icons.keyboard_arrow_right_rounded)
                          //   ],
                          // ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentDay,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddExpensesScreen(),
                                        ));
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                          SizedBox(
                            height: 300,
                            child: ExpensesWidget(),
                          )
                        ],
                      ),
                    ),
                  )),
              //card widget
              Positioned(
                top: 50,
                child: CardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
