import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_wallet/screen/menu.dart';

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
            WavyAnimatedText("Home",
                speed: Duration(milliseconds: 700),
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))
          ],
          repeatForever: true,
        ),
        actions: [
          FloatingActionButton(
              backgroundColor: Colors.indigo,
              elevation: 0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuScreen()));
              },
              child: const Icon(Icons.notifications_on_sharp))
        ],
      ),
      drawer: const Drawer(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: SweepGradient(
                    center: Alignment.topCenter,
                    colors: [Colors.blue, Colors.white],
                    startAngle: 1,
                    endAngle: 2.5)),
            // color: Colors.blue[300],
            // height: 300,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Wallet",
                        style: TextStyle(fontSize: 35, color: Colors.blue)),
                    Icon(Icons.add, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ]),
          ),
          Positioned(
              top: 400,
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
                          Text("Send Money"),
                          Icon(Icons.arrow_right_outlined)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 15),
                            color: Colors.transparent,
                            // color: Colors.white,

                            // height: 150,
                            // width: 150,
                            child: Column(
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.greenAccent),
                                Text("Name")
                              ],
                            ),
                          ),
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
                          const Icon(Icons.arrow_right_outlined)
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
          Positioned(
            top: 200,
            // left: 23,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                          height: 200,
                          width: 350,
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
                                  const Text(
                                    '****  ****  **** 3712',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Text(
                                        'Expiers',
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '07/09',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 22),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
