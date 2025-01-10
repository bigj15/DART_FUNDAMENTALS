import 'dart:io';


class Expense {
  final int id;
  final String description;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
  });

  @override
  String toString() {
    return 'ID: $id, Description: $description, Amount: $amount, Date: $date';
  }
}

class ExpenseTracker {
  List<Expense> _expenses = [];
  int _nextId = 1;
  final String filename = 'expenses.txt';

  ExpenseTracker() {
    _expenses = loadExpensesFromFile();
  }

  void addExpense(String description, double amount) {
    final expense = Expense(
      id: _nextId++,
      description: description,
      amount: amount,
      date: DateTime.now(),
    );
    _expenses.add(expense);
    saveExpensesToFile();
    print('Expense added successfully.');
  }

  void viewExpenses() {
    if (_expenses.isEmpty) {
      print('No expenses found.');
    } else {
      print('Expenses:');
      for (var expense in _expenses) {
        print(expense);
      }
    }
  }

  void deleteExpense(int id) {
    int initialLength = _expenses.length;
    _expenses.removeWhere((expense) => expense.id == id);
    if (_expenses.length < initialLength) {
      print('Expense removed successfully.');
      saveExpensesToFile();
    } else {
      print('No expense found with the given ID.');
    }
  }

  void calculateTotalExpenses() {
    final total = _expenses.fold(0.0, (sum, expense) => sum + expense.amount);
    print('Total expenses: $total');
  }

  // File Handling Methods

  void saveExpensesToFile() {
    final file = File(filename);
    final lines = _expenses.map((expense) {
      return '${expense.id}|${expense.description}|${expense.amount}|${expense.date.toIso8601String()}';
    }).join('\n');
    file.writeAsStringSync(lines);
    print('Expenses saved to $filename');
  }

  List<Expense> loadExpensesFromFile() {
    final file = File(filename);
    if (!file.existsSync()) {
      print('$filename does not exist. Starting with an empty list.');
      return [];
    }

    final lines = file.readAsLinesSync();
    return lines.map((line) {
      final parts = line.split('|');
      return Expense(
        id: int.parse(parts[0]),
        description: parts[1],
        amount: double.parse(parts[2]),
        date: DateTime.parse(parts[3]),
      );
    }).toList();
  }
}

void main() {
  final tracker = ExpenseTracker();
  tracker.loadExpensesFromFile();

  while (true) {
    print('\nExpense Tracker Menu');
    print('1. Add Expense');
    print('2. View Expenses');
    print('3. Delete Expense');
    print('4. Calculate Total Expenses');
    print('5. Save and Exit');
    stdout.write('Choose an option: ');

    final input = stdin.readLineSync();
    if (input == '1') {
      stdout.write('Enter description: ');
      final description = stdin.readLineSync() ?? '';
      stdout.write('Enter amount: ');
      final amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
      if (description.isNotEmpty && amount > 0) {
        tracker.addExpense(description, amount);
      } else {
        print('Invalid input. Try again.');
      }
    } else if (input == '2') {
      tracker.viewExpenses();
    } else if (input == '3') {
      stdout.write('Enter expense ID to delete: ');
      final id = int.tryParse(stdin.readLineSync() ?? '');
      if (id != null) {
        tracker.deleteExpense(id);
      } else {
        print('Invalid ID. Try again.');
      }
    } else if (input == '4') {
      tracker.calculateTotalExpenses();
    } else if (input == '5') {
      tracker.saveExpensesToFile();
      print('Goodbye!');
      break;
    } else {
      print('Invalid option. Try again.');
    }
  }
}
