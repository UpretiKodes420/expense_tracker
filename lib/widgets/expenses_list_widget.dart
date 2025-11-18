import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expenseObject;

  const ExpenseCard({required this.expenseObject, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Card(
      margin: Theme.of(context).cardTheme.margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              expenseObject.title,
              style: theme.displayMedium, // ✅ Correct theme usage
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expenseObject.amount.toStringAsFixed(2)}',
                  style: theme.displaySmall,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcon[expenseObject.category],
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      expenseObject.getFormattedDate,
                      style: theme.displayMedium, // ✅ Correct theme usage
                    ),
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
