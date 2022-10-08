// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key}) : super(key: key);

  //function for delete people profile
  Future<void> deleteProfile(BuildContext context, String userId) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you want to delete this profile!"),
            actions: [
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("Peoples")
                        .doc(userId)
                        .delete();
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Peoples").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> userData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 1.5, bottom: 1.5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: .5,
                            )
                          ]),
                      width: 110,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(userData["profilePic"])),
                          // const SizedBox(height: 8),
                          Text(
                            userData["name"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "Source Serif Pro",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    String userId = snapshot.data!.docs[index].id;
                    deleteProfile(context, userId);
                  },
                );
              },
            );
          } else {
            return Text("No data :( ");
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
