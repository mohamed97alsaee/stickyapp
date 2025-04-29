import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stickyapp/models/task_model.dart';
import 'package:stickyapp/providers/tasks_provider.dart';
import 'package:stickyapp/widgets/adding_dialog.dart';
import 'package:stickyapp/widgets/delete_dialog.dart';
import 'package:stickyapp/widgets/task_card.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
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
                          itemCount: tasksConsumer.allTasks.length,
                          itemBuilder: (context, index) {
                            return TaskCard(
                              taskModel: tasksConsumer.allTasks[index],
                              onSwitch: () {
                                tasksConsumer.switchStatus(index);
                              },
                              onHold: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => DeleteDialog(
                                        tm: tasksConsumer.allTasks[index],
                                      ),
                                );
                              },
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: tasksConsumer.allTasks.length,
                          itemBuilder: (context, index) {
                            return tasksConsumer.allTasks[index].isCompleted
                                ? SizedBox()
                                : TaskCard(
                                  taskModel: tasksConsumer.allTasks[index],
                                  onSwitch: () {
                                    tasksConsumer.switchStatus(index);
                                  },
                                  onHold: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => DeleteDialog(
                                            tm: tasksConsumer.allTasks[index],
                                          ),
                                    );
                                  },
                                );
                          },
                        ),
                        ListView.builder(
                          itemCount: tasksConsumer.allTasks.length,
                          itemBuilder: (context, index) {
                            return tasksConsumer.allTasks[index].isCompleted
                                ? TaskCard(
                                  taskModel: tasksConsumer.allTasks[index],
                                  onSwitch: () {
                                    tasksConsumer.switchStatus(index);
                                  },
                                  onHold: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => DeleteDialog(
                                            tm: tasksConsumer.allTasks[index],
                                          ),
                                    );
                                  },
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

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),

            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddingDialog(),
              );
            },
          ),
        );
      },
    );
  }
}
