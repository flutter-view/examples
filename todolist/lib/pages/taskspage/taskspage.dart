// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_view_widgets/flutter_view_widgets.dart';
// ignore: unused_import
import 'package:todolist/model/app-model.dart';
// ignore: unused_import
import 'package:todolist/model/task.dart';
// ignore: unused_import
import 'taskspage-model.dart';
// ignore: non_constant_identifier_names
Builder TasksPage({ @required TasksPageModel model }) {
  return Builder( // project://lib/pages/taskspage/taskspage.pug#9,2
    builder: (context) {
      return Scaffold( // project://lib/pages/taskspage/taskspage.pug#10,3
        appBar: AppBar( // project://lib/pages/taskspage/taskspage.pug#11,4
          title: 
          //-- TITLE ----------------------------------------------------------
          Container( // project://lib/pages/taskspage/taskspage.pug#12,5
            child: Text( 
              'Tasks',
            ),
          ),
        ),
        body: ReactiveWidget( // project://lib/pages/taskspage/taskspage.pug#14,4
          watch: model.app as Listenable,
          builder: (context, $) {
            return (!model.app.tasks.isEmpty) ?
              // ignore: dead_code

              //-- TASKS ----------------------------------------------------------
              ListView( // project://lib/pages/taskspage/taskspage.pug#16,6
                children: __flatten([
                  (model.app.tasks as List).map((task) {
                    return
                    TaskEntry( // project://lib/pages/taskspage/taskspage.pug#17,7
                      task: task,
                      model: model,
                    );
                  }).toList()
                ]),
              ):
            (model.app.tasks.isEmpty) ?
              // ignore: dead_code

              //-- EMPTY ----------------------------------------------------------
              Center( // project://lib/pages/taskspage/taskspage.pug#18,6
                child: 
                //-- EMPTY-MESSAGE ----------------------------------------------------------
                Container( // project://lib/pages/taskspage/taskspage.pug#19,7
                  child: Text( 
                    'Press + to create a task',
                  ),
                ),
              )
            // ignore: dead_code
            : Container();
          },
        ),
        floatingActionButton: FloatingActionButton( // project://lib/pages/taskspage/taskspage.pug#21,4
          onPressed: () { model.onAddButtonPressed(context); },
          child: Icon( // project://lib/pages/taskspage/taskspage.pug#24,5
            Icons.add,
          ),
        ),
      );
    },
  );
}

// ignore: non_constant_identifier_names
ReactiveWidget TaskEntry({ @required Task task, @required TasksPageModel model }) {
  return ReactiveWidget( // project://lib/pages/taskspage/taskspage.pug#29,2
    watch: task as Listenable,
    builder: (context, $) {
      return Dismissible( // project://lib/pages/taskspage/taskspage.pug#30,3
        key: ValueKey(task),
        onDismissed: (direction) { model.onTaskDismissed(task); },
        background: DefaultTextStyle.merge( 
          child: 
          //-- DISMISS ----------------------------------------------------------
          Container( // project://lib/pages/taskspage/taskspage.pug#40,4
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
        child: Card( // project://lib/pages/taskspage/taskspage.pug#33,4
          child: Row( // project://lib/pages/taskspage/taskspage.pug#34,5
            children: __flatten([
              DefaultTextStyle.merge( 
                child: 
                //-- TITLE ----------------------------------------------------------
                Container( // project://lib/pages/taskspage/taskspage.pug#35,6
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
              Checkbox( // project://lib/pages/taskspage/taskspage.pug#37,6
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
  return AlertDialog( // project://lib/pages/taskspage/taskspage.pug#45,2
    title: 
    //-- TITLE ----------------------------------------------------------
    Container( // project://lib/pages/taskspage/taskspage.pug#46,3
      child: Text( 
        'Add Task',
      ),
    ),
    content: 
    //-- CONTENT ----------------------------------------------------------
    Container( // project://lib/pages/taskspage/taskspage.pug#47,3
      child: TextField( // project://lib/pages/taskspage/taskspage.pug#48,4
        autofocus: true,
        controller: controller,
      ),
    ),
    actions: [
      FlatButton( // project://lib/pages/taskspage/taskspage.pug#50,4
        onPressed: () { onOk(); },
        child: Text( 
          'Ok',
        ),
      ),
      FlatButton( // project://lib/pages/taskspage/taskspage.pug#51,4
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