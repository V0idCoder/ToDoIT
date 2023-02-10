import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoit_list/screens/add_edit_task_screen.dart';

import '../providers/tasks_provider.dart';
import '../widgets/task_item.dart';
import '../widgets/app_drawer.dart';

class TasksOverviewScreen extends StatelessWidget {
  static const routeName = '/user_tasks';
  const TasksOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);

    void deleteTask(String id) {
      //Mémoriser le produit ET son index
      final existingProduct = provider.findById(id);
      final existingProductIndex = provider.findIndexById(id);
      provider.deleteTask(id);
      //Préparer la SnackBar et l'afficher
      final snackBar = SnackBar(
        content: const Text('Deleting product...'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            provider.insertProduct(existingProductIndex, existingProduct);
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoIT List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditTaskScreen.routeName);
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (_, index) => Column(
              children: [
                UserTaskItem(
                  id: provider.tasks[index].id!,
                  title: provider.tasks[index].title,
                  description: provider.tasks[index].description,
                  deleteMethod: deleteTask,
                  date: provider.tasks[index].date!,
                ),
                const Divider(),
              ],
            ),
          )),
    );
  }
}
