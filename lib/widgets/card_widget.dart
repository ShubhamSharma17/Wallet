// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_wallet/models/cardModel.dart';

class CardWidget extends StatelessWidget {
  final VariableOfCard variableOfCard;

  const CardWidget({Key? key, required this.variableOfCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Card No.",
                          style: TextStyle(color: Colors.black45)),
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
                    variableOfCard.cardNumber,
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
                        variableOfCard.expireDate,
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
