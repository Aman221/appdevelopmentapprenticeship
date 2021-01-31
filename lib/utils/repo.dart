import 'package:aman_app/model/task.dart';
import 'package:aman_app/model/taskstatus.dart';

class Repo {

  static Map<int, Task> data = new Map<int, Task>();

  Repo() {
    if (Repo.data.length == 0) {
     List.generate(25, (index)  {
       Task t = new Task(
         title: "task $index",
         note: "task $index note",
         date: DateTime.now()
       );
       t.id = index;
       t.status = (index % 3==0) ? TaskStatus.DONE: TaskStatus.PENDING;
       // Repo.data[index] = t;
       Repo.data.putIfAbsent(t.id, () => t);
       return t;
     });
    }
  }

  List<Task> get tasks => Repo.data.values.toList();

  Task getTask(int id) {
    if (Repo.data.containsKey(id)) {
     return Repo.data[id];
    }
  }

  // If TaskStatus == Null, set it to PENDING.
  Task addTask(Task newTask) {
    if (newTask != null) {
      newTask.id = Repo.data.length;
      Repo.data[newTask.id] = newTask;
      if (newTask.status == Null) {
        newTask.status = TaskStatus.PENDING;
      }
      return newTask;
    }
  }

  Task updateTask(int id, Task task) {
    if (Repo.data.containsKey(task.id)) {
      Task currentTask = getTask(task.id);
      currentTask.title = task.title;
      currentTask.note = task.note;
      currentTask.status = task.status;
      currentTask.date = task.date;
      Repo.data[currentTask.id] = currentTask;
      return currentTask;
    }
  }

  Task deleteTask(int id, Task task) {
    if (Repo.data.containsKey(task.id)) {
      Task deletedTask = getTask(task.id);
      Repo.data.removeWhere((id, task) => task.id == id);
      return deletedTask;
    }
  }

}