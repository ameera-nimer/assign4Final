
import 'package:assignment4final/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';
import 'new_task.dart';

class ToDoApp extends StatefulWidget {
  List<Task> tasks  ;
  ToDoApp(this.tasks);

  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: Drawer(child: Column(children: [
       UserAccountsDrawerHeader(
         currentAccountPicture: CircleAvatar(child:Text("T".toUpperCase())),
          accountName:Text("Task"),
          accountEmail:Text("task@gmail.com")),
          ListTile(
            onTap: (){
              tabController.animateTo(0);
              Navigator.pop(context);
            },
            title: Text('All Tasks '),
            subtitle: Text('All user’s task '),
            trailing: Icon(Icons.arrow_right),),
              ListTile(
                onTap: (){
              tabController.animateTo(1);
              Navigator.pop(context);
            },
            title: Text('Complete Tasks '),
            subtitle: Text('All user’s Complete task '),
            trailing: Icon(Icons.arrow_right),),
              ListTile(
                onTap: (){
              tabController.animateTo(2);
              Navigator.pop(context);
            },
            title: Text('Incomplete Tasks '),
            subtitle: Text('All user’s Incomplete task '),
            trailing: Icon(Icons.arrow_right),),
       

     ],),),
       appBar: AppBar(
         
    title:Text('Todo'), 
    bottom:TabBar(
      controller: tabController,
      tabs: [
      Tab(
        text:'all tasks ',
        
        ),
        Tab(
        text:'complete tasks ',
        ),
        Tab(
        text:'Incomplete tasks ',
        )
       
    ],isScrollable: true,) ,
    ),
       body: Column(
    children: [
      Expanded(
        child: TabBarView(
          controller: tabController,
          children: [AllTasks(widget.tasks),CompleteTasks(widget.tasks),IncompleteTasks(widget.tasks)]),
          )


      
    ],
    ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
             Navigator.push(context, MaterialPageRoute(builder: (context){
                return NewTask();

             },));
          });
        },
      ),
     );
  }
}

class AllTasks  extends StatelessWidget {
  List<Task> tasks  ;
  AllTasks(this.tasks);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:Container(child:Consumer<AppProvider>(
        builder:(context , valuee , child){
          return FutureBuilder<List<Task>>(

      future: context.watch<AppProvider>().getTask(),
      builder: (context  , snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
            return Container();
           
        }else if (!snapshot.hasData || snapshot.data == null){
                                  return Container();

           
        }else{
          List<Task> data = snapshot.data;
          return ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (context, index) {
               return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 24.0,
                        color: Colors.grey,
                        onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                 return Center(
                                   child: AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("You Will Delete A Task , are you \n sure? "), 
                                      actions: <Widget>[
                                         FlatButton(
                                           child: Text("Ok"),
                                           onPressed: () {
                                             Task task = Task(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             context.read<AppProvider>().deleteTask(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             
                                           Navigator.pop(context, false);
                                           },
                                          ),
                                         FlatButton(
                                           child: Text("NO"),
                                           onPressed: () {
                                           Navigator.pop(context, true);
                                           },
                                            ),
                                            ],
                                           )
      
                                 
                                 
                                 
                                 
                                 
                                 );
                               },
                              );
                   },
               ),
       Text(snapshot?.data[index].taskName),
       Checkbox(
         value: snapshot?.data[index].isComplete , 
         onChanged: (value){
          Task task = Task(snapshot?.data[index].taskName,value );
          context.read<AppProvider>().updateTask(task);
          snapshot?.data[index].isComplete=snapshot?.data[index].isComplete;
          context.read<AppProvider>().update();


       }),
],);
        },
      );
        }
      }
    ,);
        } ,
      )
      ),
  ); 
  }
}

class CompleteTasks  extends StatelessWidget {
   List<Task> tasks  ;
  CompleteTasks(this.tasks);
  @override
  Widget build(BuildContext context) {

     return  Scaffold(
    body:Container(child:Consumer<AppProvider>(
        builder:(context , valuee , child){
          return FutureBuilder<List<Task>>(

      future: context.watch<AppProvider>().getSpecificTask(1),
      builder: (context  , snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
            return Container();
           
        }else if (!snapshot.hasData || snapshot.data == null){
                                  return Container();

           
        }else{
          List<Task> data = snapshot.data;
          return ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (context, index) {
               return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 24.0,
                        color: Colors.grey,
                        onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                 return Center(
                                   child: AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("You Will Delete A Task , are you \n sure? "), 
                                      actions: <Widget>[
                                         FlatButton(
                                           child: Text("Ok"),
                                           onPressed: () {
                                             Task task = Task(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             context.read<AppProvider>().deleteTask(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             
                                           Navigator.pop(context, false);
                                           },
                                          ),
                                         FlatButton(
                                           child: Text("NO"),
                                           onPressed: () {
                                           Navigator.pop(context, true);
                                           },
                                            ),
                                            ],
                                           )
      
                                 
                                 
                                 
                                 
                                 
                                 );
                               },
                              );
                   },
               ),
       Text(snapshot?.data[index].taskName),
       Checkbox(
         value: snapshot?.data[index].isComplete , 
         onChanged: (value){
          Task task = Task(snapshot?.data[index].taskName,value );
          context.read<AppProvider>().updateTask(task);
          snapshot?.data[index].isComplete=snapshot?.data[index].isComplete;
          context.read<AppProvider>().update();


       }),
],);
        },
      );
        }
      }
    ,);
        } ,
      )
      ),
  ); 
  }
}

class IncompleteTasks  extends StatelessWidget {
 
 List<Task> tasks  ;
  IncompleteTasks(this.tasks);
  
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body:Container(child:Consumer<AppProvider>(
        builder:(context , valuee , child){
          return FutureBuilder<List<Task>>(

      future: context.watch<AppProvider>().getSpecificTask(0),
      builder: (context  , snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
            return Container();
           
        }else if (!snapshot.hasData || snapshot.data == null){
                                  return Container();

          
        }else{
          List<Task> data = snapshot.data;
          return ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (context, index) {
               return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 24.0,
                        color: Colors.grey,
                        onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                 return Center(
                                   child: AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("You Will Delete A Task , are you \n sure? "), 
                                      actions: <Widget>[
                                         FlatButton(
                                           child: Text("Ok"),
                                           onPressed: () {
                                             Task task = Task(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             context.read<AppProvider>().deleteTask(snapshot?.data[index].taskName,snapshot?.data[index].isComplete );
                                             
                                           Navigator.pop(context, false);
                                           },
                                          ),
                                         FlatButton(
                                           child: Text("NO"),
                                           onPressed: () {
                                           Navigator.pop(context, true);
                                           },
                                            ),
                                            ],
                                           )
      
                                 
                                 
                                 
                                 
                                 
                                 );
                               },
                              );
                   },
               ),
       Text(snapshot?.data[index].taskName),
       Checkbox(
         value: snapshot?.data[index].isComplete , 
         onChanged: (value){
          Task task = Task(snapshot?.data[index].taskName,value );
          context.read<AppProvider>().updateTask(task);
          snapshot?.data[index].isComplete=snapshot?.data[index].isComplete;
          context.read<AppProvider>().update();


       }),
],);
        },
      );
        }
      }
    ,);
        } ,
      )
      ),
  ); 
  }
}



