import 'package:assignment4final/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTask extends StatefulWidget{
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isComplete  = false;

  String taskName ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('new task'),
      ),
      body: Container(child:Consumer<AppProvider>(
        builder:(context , value2 , child){
          return  Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
          padding: EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             border: Border.all(color: Colors.blueAccent)
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Task Name",
            ),
            onChanged: (value){
            this.taskName = value;
          
          },
          ),
        ),
         CheckboxListTile(
          title: Text("Is Complete"),
          
          value: isComplete, 
          onChanged: (value){
            this.isComplete = value;
            setState(() {
            });
        },controlAffinity: ListTileControlAffinity.leading,),

        RaisedButton(
          padding: EdgeInsets.fromLTRB(20,2,20,2),
          child:  Text('add new task' , style:TextStyle(color: Colors.white , fontSize: 18),),
          color: Colors.blueAccent,
          onPressed: (){
            context.read<AppProvider>().addTask(this.taskName , this.isComplete);
           Navigator.of(context).pop();             
        },)
      ],),);
        } ,
      )
    ));
  }
}