import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task-model.dart';
import 'package:todoeyflutter/screens/add-task-screen.dart';
import 'package:todoeyflutter/widgets/task-tile.dart';
import 'package:todoeyflutter/widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String text = "";
  List<Task> todo = [
    Task(name: 'buy milk'),
    Task(name: 'go to club'),
    Task(name: 'see friends'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                    onChanged: (newValue) {
                      this.text = newValue;
                    },
                    onPressed: () {
                      setState(() {
                        this.todo.add(Task(name: this.text));
                      });
                      Navigator.pop(context);
                    },
                  ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "12 Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(
                todoLength: this.todo.length,
                onBuilder: (context, index) {
                  return TaskTile(
                    name: todo[index].name,
                    isChecked: todo[index].isFinished,
                    onChanged: (newValue) {
                      setState(() {
                        todo[index].toggleTask();
                      });
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
