import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/tasks_provider.dart';
import 'screens/task_overview_screen.dart';
import 'screens/add_edit_task_screen.dart';

void main() {
  runApp(const ToDoIT());
}

class ToDoIT extends StatelessWidget {
  const ToDoIT({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDoIT',
          theme: ThemeData(
              primarySwatch: Colors.green,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green,
              ).copyWith(secondary: Colors.deepOrange)),
          routes: {
            '/': (context) => const TasksOverviewScreen(),
            AddEditTaskScreen.routeName: ((context) =>
                const AddEditTaskScreen())
          }),
    );
  }
}
