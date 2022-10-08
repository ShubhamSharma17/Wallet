// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Expenses").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Map<String, dynamic> userData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return Container(
                  // color: Colors.blue[300],
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green,
                              ),
                              margin: const EdgeInsets.all(15),
                              height: 45,
                              width: 45,
                              // child: Image.network(expensesVariable.image),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData["Place Name"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  userData["date"],
                                  // "sajdfhjsda",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ]),
                          Row(
                            children: [
                              Text(
                                "₹${userData["amount"]}",
                                // "ahjsfhjks",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  onPressed: () {
                                    String currentUser =
                                        snapshot.data!.docs[index].id;
                                    log(currentUser);
                                    FirebaseFirestore.instance
                                        .collection("Expenses")
                                        .doc(currentUser)
                                        .delete();
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                          color: Colors.black, height: 5, thickness: 2),
                    ],
                  ),
                );
              },
            );
          } else {
            return Text("There are no date :)");
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
