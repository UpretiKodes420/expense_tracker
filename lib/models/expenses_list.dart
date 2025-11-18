import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list_widget.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;
  final void Function(Expense obj) onRemove;

  const ExpensesList({
    required this.expensesList,
    required this.onRemove,
    super.key,
  });
  // _removeExp(Expense obj) {
  //   expensesList.remove(obj);
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expensesList[index]),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            onRemove(expensesList[index]);
            //expensesList.remove(expensesList[index]);
          }
        },

        child: ExpenseCard(expenseObject: expensesList[index]),
      ),
    );
  }
}
