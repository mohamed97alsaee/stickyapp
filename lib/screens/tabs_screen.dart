import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stickyapp/providers/dark_model_provider.dart';
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
  void initState() {
    Provider.of<TasksProvider>(context, listen: false).getTasksFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TasksProvider, DarkModelProvider>(
      builder: (context, tasksConsumer, mode, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Sticky App"),
            actions: [
              IconButton(
                onPressed: () {
                  mode.switchMode();
                },
                icon: Icon(mode.isDark ? Icons.light_mode : Icons.dark_mode),
              ),
            ],
          ),
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
              // Provider.of<DarkModelProvider>(
              //   context,
              //   listen: false,
              // ).switchMode();
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
