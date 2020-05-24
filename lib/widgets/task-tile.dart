import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool isChecked;
  final Function onChanged;
  TaskTile({this.name, this.isChecked, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: this.onChanged,
      ),
    );
  }
}
