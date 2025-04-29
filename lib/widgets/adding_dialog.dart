import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stickyapp/models/task_model.dart';
import 'package:stickyapp/providers/tasks_provider.dart';

class AddingDialog extends StatefulWidget {
  const AddingDialog({super.key});

  @override
  State<AddingDialog> createState() => _AddingDialogState();
}

class _AddingDialogState extends State<AddingDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add New Task", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: subTitleController,
              decoration: InputDecoration(
                hintText: "Enter sub title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      Provider.of<TasksProvider>(
                        context,
                        listen: false,
                      ).addNewTask(
                        TaskModel(
                          title: titleController.text,
                          subtitle: subTitleController.text,
                          createdAt: DateTime.now(),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
