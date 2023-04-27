import 'package:advanced_expense_app/widgets/list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:advanced_expense_app/models/expense.dart';
import 'package:advanced_expense_app/widgets/list/expenses_list.dart';

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
      context: context,
      builder: (ctx) => const NewExpense(),
    );
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
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}
