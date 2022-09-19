import 'package:flutter/material.dart';
import 'package:project_wallet/models/expenses_model.dart';

class ExpensesWidget extends StatelessWidget {
  final ExpensesVariable expensesVariable;
  const ExpensesWidget({Key? key, required this.expensesVariable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[300],
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                  ),
                  margin: const EdgeInsets.all(15),
                  height: 45,
                  width: 45,
                  child: Image.network(expensesVariable.image),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expensesVariable.placeName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      expensesVariable.date,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ]),
              Text(
                "Amount ${expensesVariable.spendingMoney}\$",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Divider(color: Colors.black, height: 5, thickness: 2),
        ],
      ),
    );
  }
}
