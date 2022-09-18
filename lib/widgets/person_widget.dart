import 'package:flutter/material.dart';
import 'package:project_wallet/models/peoples_model.dart';

class PersonWidget extends StatelessWidget {
  final variables vars;
  const PersonWidget({Key? key, required this.vars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(vars.image),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle),
          ),
          const SizedBox(height: 8),
          Text(vars.name)
        ],
      ),
    );
  }
}
