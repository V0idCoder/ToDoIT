import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/add_edit_task_screen.dart';

class EditTaskItem extends StatelessWidget {
  const EditTaskItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.deleteMethod,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final Function(String) deleteMethod;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(title),
      ),
      leading: Column(
        children: [
          //child: Text(DateFormat('dd.MM.yyyy ').format(date)),
          Text(DateFormat('hh:mm').format(date)),
        ],
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AddEditTaskScreen.routeName, arguments: id);
                },
                color: Colors.grey //Theme.of(context).primaryColor,
                ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteMethod(id),
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
