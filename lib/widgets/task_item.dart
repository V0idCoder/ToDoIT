import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class UserTaskItem extends StatefulWidget {
  const UserTaskItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.deleteMethod,
    required this.date,
    required this.isChecked,
  });

  final String id;
  final String title;
  final String description;
  final Function(String) deleteMethod;
  final DateTime date;
  final bool isChecked;

  @override
  State<UserTaskItem> createState() => _UserTaskItemState();
}

class _UserTaskItemState extends State<UserTaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return ListTile(
      title: Center(
        child: Text(widget.title),
      ),
      leading: SizedBox(
        child: Text(DateFormat('hh:mm').format(widget.date)),
      ),
      // trailing: SizedBox(
      //   width: 50,
      //   child: Row(
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.check_box_outline_blank),
      //         onPressed: () => widget.deleteMethod(widget.id),
      //         color: Theme.of(context).primaryColor,
      //       )
      //     ],
      //   ),
      // ),
      trailing: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
