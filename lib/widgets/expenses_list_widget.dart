import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
//import 'package:flutter/widgets.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expenseObject;

  const ExpenseCard({required this.expenseObject, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: CardThemeData().margin,
      //margin: EdgeInsets.all(20),
      //color: Colors.pink[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Text(expenseObject.title),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\$${expenseObject.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expenseObject.category]),
                    SizedBox(width: 8),
                    Text(expenseObject.getFormattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
