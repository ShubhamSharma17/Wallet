import 'package:flutter/material.dart';
import 'package:project_wallet/models/person_model.dart';

class PersonWidget extends StatelessWidget {
  final variables vars;
  const PersonWidget({Key? key, required this.vars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 20),
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.pinkAccent[100],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                // color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(vars.image),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle),
          ),
          // const SizedBox(height: 8),
          Text(
            vars.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: "Source Serif Pro",
            ),
          )
        ],
      ),
    );
  }
}
