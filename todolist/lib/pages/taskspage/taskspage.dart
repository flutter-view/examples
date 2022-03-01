// ignore_for_file: prefer_const_constructors
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: dead_code
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_string_interpolations
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: sized_box_for_whitespace
	
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_view_widgets/flutter_view_widgets.dart';
import 'package:todolist/model/task.dart';
import 'taskspage-model.dart';
	
Builder TasksPage({ required TasksPageModel model }) {
  return Builder( // project://todolist/lib/pages/taskspage/taskspage.pug#8,2
    builder: (context) {
      return Scaffold( // project://todolist/lib/pages/taskspage/taskspage.pug#9,3
        appBar: AppBar( // project://todolist/lib/pages/taskspage/taskspage.pug#10,4
          title: 
          //-- TITLE ----------------------------------------------------------
          Container( // project://todolist/lib/pages/taskspage/taskspage.pug#11,5
            child: Text( 
              'Tasks',
            ),
          ),
        ),
        body: ReactiveWidget( // project://todolist/lib/pages/taskspage/taskspage.pug#13,4
          watch: model.app as Listenable,
          builder: (context, $) {
            return (!model.app.tasks.isEmpty) ?

              //-- TASKS ----------------------------------------------------------
              ListView( // project://todolist/lib/pages/taskspage/taskspage.pug#15,6
                children: __flatten([
                  (model.app.tasks as List).map((task) {
                    return
                    TaskEntry( // project://todolist/lib/pages/taskspage/taskspage.pug#16,7
                      task: task,
                      model: model,
                    );
                  }).toList()
                ]),
              ):
            (model.app.tasks.isEmpty) ?

              //-- EMPTY ----------------------------------------------------------
              Center( // project://todolist/lib/pages/taskspage/taskspage.pug#17,6
                child: 
                //-- EMPTY-MESSAGE ----------------------------------------------------------
                Container( // project://todolist/lib/pages/taskspage/taskspage.pug#18,7
                  child: Text( 
                    'Press + to create a task',
                  ),
                ),
              )
            : Container();
          },
        ),
        floatingActionButton: FloatingActionButton( // project://todolist/lib/pages/taskspage/taskspage.pug#20,4
          onPressed: () { model.onAddButtonPressed(context); },
          child: Icon( // project://todolist/lib/pages/taskspage/taskspage.pug#23,5
            Icons.add,
          ),
        ),
      );
    },
  );
}

ReactiveWidget TaskEntry({ required Task task, required TasksPageModel model }) {
  return ReactiveWidget( // project://todolist/lib/pages/taskspage/taskspage.pug#28,2
    watch: task as Listenable,
    builder: (context, $) {
      return Dismissible( // project://todolist/lib/pages/taskspage/taskspage.pug#29,3
        key: ValueKey(task),
        onDismissed: (direction) { model.onTaskDismissed(task); },
        background: DefaultTextStyle.merge( 
          child: 
          //-- DISMISS ----------------------------------------------------------
          Container( // project://todolist/lib/pages/taskspage/taskspage.pug#39,4
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
            color: Colors.white,
          ),
        ),
        child: Card( // project://todolist/lib/pages/taskspage/taskspage.pug#32,4
          child: Row( // project://todolist/lib/pages/taskspage/taskspage.pug#33,5
            children: __flatten([
              DefaultTextStyle.merge( 
                child: 
                //-- TITLE ----------------------------------------------------------
                Container( // project://todolist/lib/pages/taskspage/taskspage.pug#34,6
                  child: Text( 
                    '${task.name}',
                  ),
                  margin: EdgeInsets.only(left: 20),
                ),
                style: TextStyle( 
                  fontSize: Theme.of(context).textTheme?.titleMedium?.fontSize,
                  decoration: model.taskTextDecoration(task),
                ),
              ),
              Checkbox( // project://todolist/lib/pages/taskspage/taskspage.pug#36,6
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

AlertDialog AddTaskDialog({ required controller, required onOk, required onCancel }) {
  return AlertDialog( // project://todolist/lib/pages/taskspage/taskspage.pug#44,2
    title: 
    //-- TITLE ----------------------------------------------------------
    Container( // project://todolist/lib/pages/taskspage/taskspage.pug#45,3
      child: Text( 
        'Add Task',
      ),
    ),
    content: 
    //-- CONTENT ----------------------------------------------------------
    Container( // project://todolist/lib/pages/taskspage/taskspage.pug#46,3
      child: TextField( // project://todolist/lib/pages/taskspage/taskspage.pug#47,4
        autofocus: true,
        controller: controller,
      ),
    ),
    actions: [
      TextButton( // project://todolist/lib/pages/taskspage/taskspage.pug#49,4
        onPressed: () { onOk(); },
        child: Text( 
          'Ok',
        ),
      ),
      TextButton( // project://todolist/lib/pages/taskspage/taskspage.pug#50,4
        onPressed: () { onCancel(); },
        child: Text( 
          'Cancel',
        ),
      )
    ],
  );
}
	
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}