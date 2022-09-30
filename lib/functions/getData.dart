// ignore_for_file: file_names, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetCardDeta extends StatefulWidget {
  const GetCardDeta({Key? key}) : super(key: key);

  @override
  State<GetCardDeta> createState() => _GetCardDetaState();
}

class _GetCardDetaState extends State<GetCardDeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data from Firebase"),
      ),
      body: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Cards").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userData =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          return Card(
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
                                    children: [
                                      const Text(
                                        'Expiers',
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        userData["expireDate"],
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 22),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
