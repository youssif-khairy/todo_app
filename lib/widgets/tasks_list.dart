import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task-model.dart';
import 'package:todoeyflutter/widgets/task-tile.dart';

class TaskList extends StatelessWidget {
  final int todoLength;
  final Function onBuilder;
  TaskList({this.todoLength, this.onBuilder});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: onBuilder,
      itemCount: todoLength,
    );
  }
}
