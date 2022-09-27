import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project_wallet/models/cardModel.dart';
import 'package:project_wallet/models/expenses_model.dart';
import 'package:project_wallet/models/person_model.dart';
import 'package:project_wallet/screen/add_new_cards.dart';
import 'package:project_wallet/screen/drawer_Screen.dart';
import 'package:project_wallet/widgets/card_widget.dart';
import 'package:project_wallet/widgets/expenses_widget.dart';
import 'package:project_wallet/widgets/person_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tempCardNumber = "0000 0000 0000 0000";

  var tempExpireDate = "06/3";
  var tempImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Visa.svg/640px-Visa.svg.png";
  @override
  void initState() {
    // List list = AddNewCard.getData(tempCardNumber, tempExpireDate, tempImage);
    // print(list);
    super.initState();
    // DataOfCards.addList();
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
                  right: 25,
                  left: 25,
                  child: Container(
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
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: DataOfPerson.data.length,
                              itemBuilder: (context, index) {
                                return PersonWidget(
                                  vars: DataOfPerson.data[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "All",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Received",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Send",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_right_rounded)
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "09-Sep-2022",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // const SizedBox(height: 15),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: DataofExpenses.expensesVariable.length,
                              itemBuilder: (context, index) {
                                return ExpensesWidget(
                                  expensesVariable:
                                      DataofExpenses.expensesVariable[index],
                                );
                              },
                            ),
                          )
                        ]),
                  )),

              //card
              Positioned(
                top: 50,
                // left: 23,
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataOfCards.data.length,
                      itemBuilder: ((context, index) {
                        return CardWidget(
                          variableOfCard: DataOfCards.data[index],
                        );
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
