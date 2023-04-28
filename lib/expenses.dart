import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpenses.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'App dev',
      amount: 85.698,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Burger',
      amount: 5.698,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Banasree',
      amount: 25.7,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'freefire',
      amount: 0,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("the chart"),
          Expanded(
            child: ExpensesList(
                expenses: _registeredExpenses, onRemoveExpense: _removeExpense),
          )
        ],
      ),
    );
  }
}
