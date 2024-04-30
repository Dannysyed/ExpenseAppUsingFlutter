import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  var _entertitle = '';
  void getEnteredTitle(String titledata) {
    _entertitle = titledata;
  }

  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    print(pickedDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Column(
        children: [
          TextField(
            onChanged: getEnteredTitle,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$', label: Text("Amount")),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? "No date Selected "
                        : formatedDate.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    print(_entertitle);
                    print(_amountController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("save"))
            ],
          )
        ],
      ),
    );
  }
}
