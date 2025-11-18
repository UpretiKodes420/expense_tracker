import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({required this.onAddExpense, super.key});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.education;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);

    var date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectedDate = date;
    });
  }

  void _submitForm() {
    final enterdamount = double.tryParse(_amountController.text);
    final _validamount = enterdamount == null || enterdamount < 0;

    if (_titleController.text.trim().isEmpty ||
        _validamount ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Invalid input Parameters"),
            content: Text("please enter valid info in required field"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("okay"),
              ),
            ],
          );
        },
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        amount: enterdamount,
        title: _titleController.text,
        date: selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 55,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  //maxLength: 55,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount spent"),
                    prefix: Text("\$"),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? "no date selected"
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  //print(value);
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  //Navigator.pop(context);
                  // print("${_titleController.text} ${_amountController.text}");
                  Navigator.pop(context);
                },
                child: Text("cancle"),
              ),
              SizedBox(width: 8),
              ElevatedButton(onPressed: _submitForm, child: Text("save")),
            ],
          ),
        ],
      ),
    );
  }
}
