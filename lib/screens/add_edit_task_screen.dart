import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';

import '../models/task.dart';
import '../providers/tasks_provider.dart';

class AddEditTaskScreen extends StatefulWidget {
  static const routeName = '/add_edit_task';
  const AddEditTaskScreen({super.key});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _descriptionFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedTask = Task.base();

  var _isInit = true;

  @override
  void didChangeDependecies() {
    //Récuperatin du produit --> update
    if (_isInit) {
      final taskId = ModalRoute.of(context)?.settings.arguments as String?;
      if (taskId != null && taskId.isNotEmpty) {
        _editedTask =
            Provider.of<TasksProvider>(context, listen: false).findById(taskId);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  //Méthode de sauvgarde du formulaire
  void _saveForm() {
    final isValide = _form.currentState?.validate();
    if (!isValide!) {
      return;
    }
    _form.currentState?.save();

    if (_editedTask.id != null && _editedTask.id!.isNotEmpty) {
      Provider.of<TasksProvider>(context, listen: false)
          .updateTask(_editedTask.id!, _editedTask);
    } else {
      //Nouveau produit
      Provider.of<TasksProvider>(context, listen: false).addTask(_editedTask);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      _editedTask = Provider.of<TasksProvider>(context)
          .findById(ModalRoute.of(context)?.settings.arguments as String);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add / Edit Task'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _editedTask.title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction:
                      TextInputAction.next, //Bouton bas-droit du clavier
                  onFieldSubmitted: (_) {
                    //Lorsque la valeur est saisie
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  validator: (value) {
                    //Test qui contrôle si la valeur est null
                    if (value != null && value.isEmpty) {
                      return 'Please provide a Title'; //Error Message
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedTask = _editedTask.copyWith(title: value);
                  },
                ),
                TextFormField(
                  initialValue: _editedTask.description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                  validator: (value) {
                    //Test qui contrôle si la valeur est null
                    if (value != null && value.isEmpty) {
                      return 'Please provide a Description'; //Error Message
                    }
                    // if (value != null && String.parse(value) <= 10) {
                    //   return 'Should be at least 10 characters long';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    _editedTask = _editedTask.copyWith(description: value);
                  },
                ),
                DateTimeFormField(
                  initialValue: _editedTask.date,
                  decoration: const InputDecoration(labelText: 'Date'),
                  onSaved: (value) {
                    _editedTask = _editedTask.copyWith(date: value);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
