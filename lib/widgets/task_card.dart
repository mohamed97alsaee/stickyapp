import 'package:flutter/material.dart';
import 'package:stickyapp/helpers/consts.dart';
import 'package:stickyapp/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.onSwitch,
    required this.onHold,
  });
  final TaskModel taskModel;
  final Function onSwitch;
  final Function onHold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onHold();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: primaryColor.withValues(
              alpha: taskModel.isCompleted ? 0.05 : 0.5,
            ),

            borderRadius: BorderRadius.circular(16),
          ),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskModel.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                        decoration:
                            taskModel.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.white,

                      fillColor: WidgetStatePropertyAll(primaryColor),
                      value: taskModel.isCompleted,
                      onChanged: (v) {
                        onSwitch();
                      },
                    ),
                  ],
                ),

                Text(
                  taskModel.subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: taskModel.isCompleted ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,

                    decoration:
                        taskModel.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskModel.createdAt
                          .toIso8601String()
                          .substring(0, 10)
                          .replaceAll("-", "/"),
                      style: TextStyle(
                        fontSize: 13,
                        color:
                            taskModel.isCompleted ? Colors.grey : Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration:
                            taskModel.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                    Text(
                      taskModel.createdAt.toIso8601String().substring(11, 16),
                      style: TextStyle(
                        fontSize: 13,
                        color:
                            taskModel.isCompleted ? Colors.grey : Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration:
                            taskModel.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
