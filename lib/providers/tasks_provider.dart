import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stickyapp/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> allTasks = [];

  addNewTask(TaskModel tm) {
    allTasks.add(tm);
    storeTasksToStorage();
  }

  switchStatus(int index) {
    allTasks[index].isCompleted = !allTasks[index].isCompleted;
    storeTasksToStorage();
  }

  deleteTask(TaskModel task) {
    allTasks.remove(task);
    storeTasksToStorage();
  }

  storeTasksToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonData = allTasks.map((e) => e.toJson()).toList();
    var encodedData = jsonEncode(jsonData);
    prefs.setString("tasks", encodedData);
    getTasksFromStorage();
  }

  getTasksFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("tasks");
    if (data != null) {
      var decodedData = jsonDecode(data);

      allTasks = List<TaskModel>.from(
        decodedData.map((e) => TaskModel.fromJson(e)),
      );
    }
    notifyListeners();
  }
}
