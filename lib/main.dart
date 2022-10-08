import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_wallet/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//-----------------------fetch the data from firebase firestore--------------------
//get data for collections
  // QuerySnapshot querySnapshot =
  //     await FirebaseFirestore.instance.collection("Cards").get();

  // for (var doc in querySnapshot.docs) {
  //   log(doc.data().toString());
  // }

  //get data for a perticular document
  // DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //     .collection("Cards")
  //     .doc("5tXeNs3s5YJFHJE6ofHB")
  //     .get();
  // log(documentSnapshot.data().toString());

  //-----------------------Add the data to firebase firestore--------------------
  // //Always remember data store in firestore in the form of map
  // Map<String, dynamic> newUser = {
  //   "cardNumber": " 1548 6587 1496 2150",
  //   "expireDate": "04/07"
  // };
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

//when you don't need to give document id, it's automatically create it
  //await firestore.collection("Cards").add(newUser);

  //when you want to give a specific document id
  // await firestore.collection("Cards").doc("Add New User Here2").set(newUser);
  // log("New User Saved!");

  //-----------------    update/edit user data   -----------------------
  // await firestore.collection("Cards").doc("Add New User Here2").update({
  //   "cardNumber": "9874 6584 3251 6548",
  //   "expireDate": "01/01",
  //   "name": "Shubham"
  // });
  // log("User Update!");

  // -------------------- delete user data -------------
  // await firestore.collection("Cards").doc("Add New User Here2").delete();
  // log("User deleted!");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: "Source Serif Pro",
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
