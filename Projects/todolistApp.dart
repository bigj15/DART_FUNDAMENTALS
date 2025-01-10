import 'dart:io';

class Task {
  final int id;
  String title;
  String description;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description, 
    required this.isCompleted,
  });
}

class ToDoApp {
  final List<Task> _tasks = [];
  int _nextId = 1;
  final String filename = 'tasks.txt';


  void addTask(String title, String description) {
    final task = Task(
      id: _nextId++, 
      title: title, 
      description: description, 
      isCompleted: false
    );
    _tasks.add(task);
    saveToFile();
    print('Task added successfully!');
  }


  void viewTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
      return;
    }

    print('\nTask List:');
    for (var task in _tasks) {
      print('ID: ${task.id} | Title: ${task.title} | Completed: ${task.isCompleted}');
      print('Description: ${task.description}\n');
    }
  }

  void updateTask(int id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isCompleted = !task.isCompleted;
    print('Task status updated.');
  }

   void deleteTask(int id) {
    int initialLength = _tasks.length;
    _tasks.removeWhere((task) => task.id == id);
    if (_tasks.length < initialLength) {
      print('Task deleted successfully.');
      saveToFile();
    } else {
      print('Task not found.');
    }
  }

  
  void saveToFile() {
    final file = File(filename);
    final lines = _tasks.map((task){
     return '${task.id}|${task.title}|${task.description}|${task.isCompleted}';
      }).join('\n');
    file.writeAsStringSync(lines);
    print('Tasks saved to file.');
  }

  
  List<Task> loadFromFile() {
    final file = File(filename);
    if (!file.existsSync()) {
      print('$filename does not exist. Starting with an empty list.');
      return [];
    }
    
    final lines = file.readAsLinesSync();
    return lines.map((line){
      final parts = line.split('|');
      return Task(
        id: int.parse(parts[0]),
        title: parts[1],
        description: parts[2],
        isCompleted: bool.parse(parts[3]),
      );
    }).toList();
  }
}

void main() {
  final app = ToDoApp();
  app.loadFromFile();

  while (true) {
    print('\nTo-Do List App Menu');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Update Task Status');
    print('4. Delete Task');
    print('5. Save and Exit');
    stdout.write('Choose an option: ');

    final input = stdin.readLineSync();
    if (input == '1') {
      stdout.write('Enter task title: ');
      final title = stdin.readLineSync() ?? '';
      stdout.write('Enter task description: ');
      final description = stdin.readLineSync() ?? '';
      if (title.isNotEmpty && description.isNotEmpty) {
        app.addTask(title, description);
      } else {
        print('Invalid input. Try again.');
      }
    } else if (input == '2') {
      app.viewTasks();
    } else if (input == '3') {
      stdout.write('Enter task ID to update: ');
      final id = int.tryParse(stdin.readLineSync() ?? '');
      if (id != null) {
        app.updateTask(id);
      } else {
        print('Invalid ID. Try again.');
      }
    } else if (input == '4') {
      stdout.write('Enter task ID to delete: ');
      final id = int.tryParse(stdin.readLineSync() ?? '');
      if (id != null) {
        app.deleteTask(id);
      } else {
        print('Invalid ID. Try again.');
      }
    } else if (input == '5') {
      app.saveToFile();
      print('Goodbye!');
      break;
    } else {
      print('Invalid option. Try again.');
    }
  }
}
