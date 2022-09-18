import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_wallet/models/cardModel.dart';
import 'package:project_wallet/models/peoples_model.dart';
import 'package:project_wallet/screen/drawer_Screen.dart';
import 'package:project_wallet/widgets/card_widget.dart';
import 'package:project_wallet/widgets/person_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText("Wallet",
                speed: const Duration(milliseconds: 500),
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: SweepGradient(
                    center: Alignment.topCenter,
                    colors: [Colors.blue, Colors.white],
                    startAngle: 1,
                    endAngle: 2.5)),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const AddNewCard(),
                    //     ));
                  },
                  icon: const Icon(Icons.add))),
          Positioned(
              top: 280,
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
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: DataOfPeoples.data.length,
                          itemBuilder: (context, index) {
                            return PersonWidget(
                              vars: DataOfPeoples.data[index],
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
                              Text("All"),
                              SizedBox(width: 10),
                              Text("Received"),
                              SizedBox(width: 10),
                              Text("Send"),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right_rounded)
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text("09-Sep-2022"),
                      // const SizedBox(height: 15),
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        height: 250,

                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => Container(
                            color: Colors.transparent,
                            // color: Colors.blue[300],
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        margin: const EdgeInsets.all(15),
                                        height: 40,
                                        width: 40,
                                        child: Image.network(
                                            "https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/d2fd6cbb32432311f93bc729a65c7fb0.png"),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        children: const [
                                          Text("Sunshine Restaurant"),
                                          Text("Date")
                                        ],
                                      )
                                    ]),
                                    const Text("Amount 2.25\$"),
                                  ],
                                ),
                                const Divider(
                                    color: Colors.white,
                                    height: 5,
                                    thickness: 2),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              )),

          //card
          Positioned(
            top: 80,
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
    );
  }
}
