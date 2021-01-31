import 'package:aman_app/model/taskstatus.dart';
import 'package:flutter/cupertino.dart';

class Task {
  int id;
  String title;
  String note;
  DateTime date;
  TaskStatus status;

  Task({@required title: String, note: String,@required date: DateTime}) {
    this.status = TaskStatus.PENDING;
  }

  Map<String, String> toMap() {
    var taskJSON= {
        "id": this.id,
        "title": this.title,
        "note": this.note,
        "date": this.date.toString(),
        "status": this.status
    };
  }

  static Task fromMap(Map<String, String> json) {
    Task t = Task(
        title: json["title"],
        note: json["note"],
        date: DateTime.parse(json["date"])
    );
    return t;
  }

}