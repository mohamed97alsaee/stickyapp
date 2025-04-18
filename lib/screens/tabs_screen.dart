import 'package:flutter/material.dart';
import 'package:stickyapp/models/task_model.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Pending"),
                  Tab(text: "Completed"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("all")),
                    Center(child: Text("pending")),
                    Center(child: Text("completed")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
