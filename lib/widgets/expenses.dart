import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expenses_list.dart';
import 'package:expense_tracker/widgets/expense_adder_modal_form.dart';
//mport 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  //final List<Expense>? exp;
  //final Expense remove;
  //final void Function(List<Expense> expenseList) rem;
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdexpenses = [];

  void _addExpense(Expense obj) {
    setState(() {
      _registerdexpenses.add(obj);
    });
  }

  void _removeExpense(Expense obj) {
    final index = _registerdexpenses.indexOf(obj);
    setState(() {
      _registerdexpenses.remove(obj);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("expense deleted "),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "undo..",
          onPressed: () {
            setState(() {
              _registerdexpenses.insert(index, obj);
            });
          },
        ),
      ),
    );
  }

  void _openModalBox() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker App",

          style: Theme.of(context).textTheme.displayLarge,
        ),
        //backgroundColor: Colors.black,
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.onPrimary,
            icon: Icon(Icons.add),
            onPressed: _openModalBox,
          ),
        ],
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ExpensesList(
              expensesList: _registerdexpenses,
              onRemove: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
