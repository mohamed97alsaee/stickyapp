import 'package:flutter/widgets.dart';
import 'package:stickyapp/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> allTasks = [
    TaskModel(
      title: "Lesson 1",
      subtitle: "this is lesson subtitle 1",
      createdAt: DateTime.now(),
    ),
    TaskModel(
      title: "Lesson 2",
      subtitle: "this is lesson subtitle 2",
      createdAt: DateTime.now(),
      isCompleted: true,
    ),
    TaskModel(
      title: "Lesson 3",
      subtitle: "this is lesson subtitle 3",
      createdAt: DateTime.now(),
    ),
    TaskModel(
      title: "Lesson 4",
      subtitle: "this is lesson subtitle 4",
      createdAt: DateTime.now(),
    ),
    TaskModel(
      title: "Lesson 5",
      subtitle: "this is lesson subtitle 5",
      createdAt: DateTime.now(),
    ),
    TaskModel(
      title: "Lesson 6",
      subtitle: "this is lesson subtitle 6",
      createdAt: DateTime.now(),
    ),
  ];

  addNewTask(TaskModel tm) {
    allTasks.add(tm);
    notifyListeners();
  }

  switchStatus(int index) {
    allTasks[index].isCompleted = !allTasks[index].isCompleted;
    notifyListeners();
  }

  deleteTask(TaskModel task) {
    allTasks.remove(task);
    notifyListeners();
  }
}
