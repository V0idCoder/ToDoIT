import 'package:flutter/material.dart';

import '../screens/edit_task_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('ToDoIT Drawer'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home List'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Taks'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(EditTasksOverviewScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
