import 'package:flutter/material.dart';

import '../models/task.dart';

class TasksProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: 't1',
      title: 'Get Up',
      description: 'Get tf UP!',
      date: DateTime.now(),
      isChecked: false,
    ),
    Task(
      id: 't2',
      title: 'Go to school',
      description: 'Go to Ceff by Train',
      date: DateTime.now(),
      isChecked: true,
    ),
    Task(
      id: 't3',
      title: 'Study like a pro',
      description: 'Go and study like a master my man',
      date: DateTime.now(),
      isChecked: false,
    ),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  Task findById(String id) {
    return _tasks.firstWhere(
      (task) => task.id == id,
    );
  }

  //Create Methode [C]
  void addTask(Task task) {
    final newTask = task.copyWith(id: DateTime.now().toString());
    _tasks.add(newTask);
    notifyListeners();
  }

  //Update Methode [U]
  void updateTask(String id, Task newTask) {
    final taskindex = _tasks.indexWhere((task) => task.id == id);
    if (taskindex > 0) {
      _tasks[taskindex] = newTask;
      notifyListeners();
    } else {
      //Traitemnt éventuel
    }
  }

  //Delete Methode [D]
  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  //Pour l'annulation du delete (Undo Thing)
  int findIndexById(String id) {
    return _tasks.indexWhere((task) => task.id == id);
  }

  void insertProduct(int index, Task task) {
    _tasks.insert(index, task);
    notifyListeners();
  }

  void doneTask(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    _tasks[taskIndex].isChecked = true;
    notifyListeners();
  }
}
