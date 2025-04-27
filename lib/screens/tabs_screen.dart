import 'package:flutter/material.dart';
import 'package:stickyapp/models/task_model.dart';
import 'package:stickyapp/widgets/task_card.dart';

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
                    ListView.builder(
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          taskModel: allTasks[index],
                          onSwitch: () {
                            setState(() {
                              allTasks[index].isCompleted =
                                  !allTasks[index].isCompleted;
                            });
                          },
                          onHold: () {},
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        return allTasks[index].isCompleted
                            ? SizedBox()
                            : TaskCard(
                              taskModel: allTasks[index],
                              onSwitch: () {
                                setState(() {
                                  allTasks[index].isCompleted =
                                      !allTasks[index].isCompleted;
                                });
                              },
                              onHold: () {},
                            );
                      },
                    ),
                    ListView.builder(
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) {
                        return allTasks[index].isCompleted
                            ? TaskCard(
                              taskModel: allTasks[index],
                              onSwitch: () {
                                setState(() {
                                  allTasks[index].isCompleted =
                                      !allTasks[index].isCompleted;
                                });
                              },
                              onHold: () {},
                            )
                            : SizedBox();
                      },
                    ),
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
