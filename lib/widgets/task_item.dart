import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';
import '../screens/add_edit_task_screen.dart';
//import '../providers/tasks_provider.dart';

class UserTaskItem extends StatelessWidget {
  UserTaskItem({
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
      //leading: Text(title),
      title: Text(
        title,
        //style: const TextStyle(fontFamily: 'Roboto-Black'),
      ),
      leading: Text(date.toString()),
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
