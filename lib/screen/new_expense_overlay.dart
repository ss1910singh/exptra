import 'package:exptra/expense/category.dart';
import 'package:exptra/expense/expense.dart';
import 'package:flutter/material.dart';

int maxDescLength = 50;

var monthStringList = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class NewExpenseOverlay extends StatefulWidget {
  const NewExpenseOverlay({super.key});

  @override
  State<NewExpenseOverlay> createState() => _NewExpenseOverlayState();
}

class _NewExpenseOverlayState extends State<NewExpenseOverlay> {
  double? enteredAmount;
  ExpenseCategory? selectedCategory;
  String enteredDescription = '';
  DateTime creationTime = DateTime.now();

  bool isValid() {
    return (enteredAmount != null) &&
        (selectedCategory != null) &&
        enteredDescription.length <= maxDescLength;
  }

  void addNewExpense() {
    // we can only submit if amount and category are present
    // TODO: Add this to the database
    var expense = Expense(
        amount: enteredAmount!,
        category: selectedCategory!,
        createdOn: DateTime.now(),
        description: enteredDescription);
    print(expense);
  }

  void _selectDate() async {
    var result = await showDatePicker(
        context: context,
        firstDate: creationTime.subtract(Duration(days: 60)),
        lastDate: creationTime.add(Duration(days: 60)),
        initialDate: creationTime);
    if (result != null) {
      setState(() {
        creationTime = DateTime(result.year, result.month, result.day,
            creationTime.hour, creationTime.minute, creationTime.second);
      });
    }
  }

  void _selectTime() async {
    var result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        creationTime = DateTime(creationTime.year, creationTime.month,
            creationTime.day, result.hour, result.minute, 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text('Add a new expense',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Form(
                child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  onChanged: (value) => setState(() {
                    enteredAmount = double.tryParse(value);
                  }),
                ),
                DropdownButtonFormField(
                  items: ExpenseCategory.values
                      .map((e) => DropdownMenuItem(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [e.icon, Text(e.string)]),
                          value: e))
                      .toList(),
                  onChanged: (value) => setState(() {
                    selectedCategory = value;
                  }),
                  decoration: InputDecoration(labelText: 'Category'),
                  menuMaxHeight: 500,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description (Optional)',
                  ),
                  onChanged: (value) => setState(() {
                    enteredDescription = value.trim();
                  }),
                  validator: (value) => (value == null)
                      ? null
                      : value.length > maxDescLength
                          ? 'Description length exceeds the limit of $maxDescLength'
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: _selectDate,
                        child: Text(
                          '${monthStringList[creationTime.month - 1]} ${creationTime.day}',
                          style: TextStyle(fontSize: 18.0),
                        )),
                    Spacer(),
                    TextButton(
                        onPressed: _selectTime,
                        child: Text(
                          '${creationTime.hour.toString().padLeft(2, '0')}:${creationTime.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(fontSize: 18.0),
                        )),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: isValid()
                            ? () => addNewExpense()
                            : null, // only add if the form is valid
                        child: Text('Add expense',
                            style: TextStyle(fontSize: 22.0))))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
