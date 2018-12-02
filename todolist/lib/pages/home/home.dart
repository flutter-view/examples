// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:tester/app-model.dart';
// ignore: unused_import
import 'package:flutter_view_tools/flutter_view_tools.dart';
// ignore: unused_import
import 'home-model.dart';
// ignore: non_constant_identifier_names
Builder HomePage({ @required model }) {
  return Builder( // project://lib/pages/home/home.pug#7,2
    builder: (context) {
      return Scaffold( // project://lib/pages/home/home.pug#8,3
        appBar: AppBar( // project://lib/pages/home/home.pug#9,4
          title: 
          //-- TITLE ----------------------------------------------------------
          Container( // project://lib/pages/home/home.pug#10,5
            child: Text( 
              'Tasks',
            ),
          ),
        ),
        body: ReactiveWidget( // project://lib/pages/home/home.pug#12,4
          watch: model.app as Listenable,
          builder: (context, $) {
            return (!model.app.tasks.isEmpty) ?
              // ignore: dead_code

              //-- TASKS ----------------------------------------------------------
              ListView( // project://lib/pages/home/home.pug#15,6
                children: __flatten([
                  (model.app.tasks as List).map((task) {
                    return
                    TaskEntry( // project://lib/pages/home/home.pug#16,7
                      task: task,
                      model: model,
                    );
                  }).toList()
                ]),
              ):
            (model.app.tasks.isEmpty) ?
              // ignore: dead_code

              //-- EMPTY ----------------------------------------------------------
              Center( // project://lib/pages/home/home.pug#18,6
                child: DefaultTextStyle.merge( 
                  child: 
                  //-- EMPTY-MESSAGE ----------------------------------------------------------
                  Container( // project://lib/pages/home/home.pug#19,7
                    child: Text( 
                      'Press the + to create a task',
                    ),
                  ),
                  style: TextStyle( 
                    fontSize: Theme.of(context).textTheme.title.fontSize,
                  ),
                ),
              )
            // ignore: dead_code
            : Container();
          },
        ),
        floatingActionButton: FloatingActionButton( // project://lib/pages/home/home.pug#21,4
          onPressed: () { model.onAddButtonPressed(context); },
          child: Icon( // project://lib/pages/home/home.pug#24,5
            Icons.add,
          ),
        ),
      );
    },
  );
}

// ignore: non_constant_identifier_names
ReactiveWidget TaskEntry({ @required task, @required model }) {
  return ReactiveWidget( // project://lib/pages/home/home.pug#28,2
    watch: task as Listenable,
    builder: (context, $) {
      return Dismissible( // project://lib/pages/home/home.pug#29,3
        key: ValueKey(task),
        onDismissed: (direction) { model.onTaskDismissed(task); },
        background: DefaultTextStyle.merge( 
          child: 
          //-- DISMISS ----------------------------------------------------------
          Container( // project://lib/pages/home/home.pug#39,4
            child: Text( 
              'Delete',
            ),
            decoration: BoxDecoration( 
              color: Colors.red,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
          ),
          style: TextStyle( 
            fontSize: Theme.of(context).textTheme.title.fontSize,
            color: Colors.white,
          ),
        ),
        child: Card( // project://lib/pages/home/home.pug#32,4
          child: Row( // project://lib/pages/home/home.pug#33,5
            children: __flatten([
              DefaultTextStyle.merge( 
                child: 
                //-- TITLE ----------------------------------------------------------
                Container( // project://lib/pages/home/home.pug#34,6
                  child: Text( 
                    '${task.name}',
                  ),
                  margin: EdgeInsets.only(left: 20),
                ),
                style: TextStyle( 
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                  decoration: model.taskTextDecoration(task),
                ),
              ),
              Checkbox( // project://lib/pages/home/home.pug#36,6
                value: task.done,
                onChanged: (checked) { model.onCheckPressed(task, checked); },
              )
            ]),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      );
    },
  );
}

// ignore: non_constant_identifier_names
AlertDialog AddTaskDialog({ @required controller, @required onOk, @required onCancel }) {
  return AlertDialog( // project://lib/pages/home/home.pug#43,2
    title: 
    //-- TITLE ----------------------------------------------------------
    Container( // project://lib/pages/home/home.pug#44,3
      child: Text( 
        'Add Task',
      ),
    ),
    content: 
    //-- CONTENT ----------------------------------------------------------
    Container( // project://lib/pages/home/home.pug#45,3
      child: TextField( // project://lib/pages/home/home.pug#46,4
        autofocus: true,
        controller: controller,
      ),
    ),
    actions: [
      FlatButton( // project://lib/pages/home/home.pug#48,4
        onPressed: () { onOk(); },
        child: Text( 
          'Ok',
        ),
      ),
      FlatButton( // project://lib/pages/home/home.pug#49,4
        onPressed: () { onCancel(); },
        child: Text( 
          'Cancel',
        ),
      )
    ],
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}