// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_wallet/models/cardModel.dart';

class CardWidget extends StatelessWidget {
  // final VariableOfCard variableOfCard;

  const CardWidget({
    Key? key,
    // required this.variableOfCard
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Cards").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> userData = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Card(
                          shadowColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Card No.",
                                        style:
                                            TextStyle(color: Colors.black45)),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/640px-Visa.svg.png"),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  userData["cardNumber"],
                                  style: const TextStyle(fontSize: 25),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Expiers',
                                          style:
                                              TextStyle(color: Colors.black38),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          userData["expireDate"],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 22),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          String currentUser =
                                              snapshot.data!.docs[index].id;
                                          log(currentUser);
                                          FirebaseFirestore.instance
                                              .collection("Cards")
                                              .doc(currentUser)
                                              .delete();
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("No Data!");
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
