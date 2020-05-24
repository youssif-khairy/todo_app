class Task {
  String name;
  bool isFinished;
  Task({this.name, this.isFinished = false});
  toggleTask() {
    this.isFinished = !this.isFinished;
  }
}
