import 'package:aman_app/model/task.dart';
import 'package:aman_app/utils/repo.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:aman_app/model/taskstatus.dart';

class HomeScreen extends StatefulWidget {


  HomeScreen({this.title});
  final String title;

  @override
  State createState() => new _HomeScreenState();

}



 class _HomeScreenState extends State<HomeScreen> {
   final _biggerFont = TextStyle(fontSize: 18.0);
   Repo repo = new Repo();
   List<Task> data;
   @override
   Widget build(BuildContext context) {
     data = repo.tasks;
     return Scaffold(
       appBar: AppBar(
         title: Text(widget.title ?? "No Text Found"),
       ),
         body: renderPage(),
         floatingActionButton: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             FloatingActionButton(
               child: Icon(Icons.list),
                onPressed: () => {
                 print("Not Implemented")
             }),
             FloatingActionButton(
               child: Icon(Icons.add),
               onPressed: () => {
                 print("Not Implemented")
               },
             ),
           ],
         ),
     );
   }

   Widget _buildSuggestions() {
     return ListView.builder(
       shrinkWrap: true,
       padding: EdgeInsets.all(16.0),
       itemCount: data.length,
       itemBuilder: (context, i) {
         return _buildRow(data[i]);
       });
   }

   Widget _buildRow(Task task) {
     return ListTile(
       leading: Icon(Icons.list),
       title: Text(
         task.title ?? "Invalid Task",
         style: _biggerFont,
       ),
       /*Add check/x mark depending on task status*/
       trailing: (task.status == TaskStatus.DONE ) ? Icon(Icons.check): Icon(Icons.timelapse)
     );
   }

   Widget renderPage() {
     return _buildSuggestions();
   }

 }