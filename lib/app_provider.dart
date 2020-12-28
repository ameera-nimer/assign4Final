

import 'package:assignment4final/db_helper.dart';
import 'package:assignment4final/task_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier{
  String taskName ;
  bool isComplete ;

  addTask(String taskName , bool isComplete){
    Task task =Task(taskName,isComplete);
    DBHelper.dbHelper.insertNewTask(task);
    notifyListeners();
  }
  Future<List<Task>>  getTask() async {
    print('trytry ${await DBHelper.dbHelper.selectAllTasks()}');
      return  await DBHelper.dbHelper.selectAllTasks();
 }
  deleteTask(String taskName , bool isComplete){
    Task task =Task(taskName,isComplete);
    DBHelper.dbHelper.deleteTask(task);
    notifyListeners();
  }
  Future<List<Task>>  getSpecificTask(int isComplete) async {
      return  await DBHelper.dbHelper.selectSpecificTask(isComplete);    
 }
 Future<List<Task>> updateTask(Task taskk) async {
      return  await DBHelper.dbHelper.updateTask(taskk);
 }

   update(){
    notifyListeners();
  }
}