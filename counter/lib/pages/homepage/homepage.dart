// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: dead_code
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_cast
	
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_view_tools/flutter_view_tools.dart';
import 'package:counter/app-model.dart';
	
Scaffold HomePage({ required AppModel model }) {
  return Scaffold( // project://counter/lib/pages/homepage/homepage.pug#6,2
    appBar: AppBar( // project://counter/lib/pages/homepage/homepage.pug#7,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://counter/lib/pages/homepage/homepage.pug#8,4
        child: Text( 
          'Welcome)',
        ),
      ),
    ),
    body: Center( // project://counter/lib/pages/homepage/homepage.pug#10,3
      child: ReactiveWidget( // project://counter/lib/pages/homepage/homepage.pug#11,4
        watch: model as Listenable,
        builder: (context, $) {
          return 
          //-- MESSAGE ----------------------------------------------------------
          Container( // project://counter/lib/pages/homepage/homepage.pug#12,5
            child: Column( 
              children: __flatten([
                Text( 
                  'You have pushed:)',
                ),
                DefaultTextStyle.merge( 
                  child: 
                  //-- COUNTER ----------------------------------------------------------
                  Container( // project://counter/lib/pages/homepage/homepage.pug#13,6
                    child: Text( 
                      '${model.counter} times)',
                    ),
                    margin: EdgeInsets.only(top: 30),
                  ),
                  style: TextStyle( 
                    fontSize: 25,
                  ),
                )
              ]),
            ),
            margin: EdgeInsets.only(top: 200),
          );
        },
      ),
    ),
    floatingActionButton: 
    //-- BTN ----------------------------------------------------------
    FloatingActionButton( // project://counter/lib/pages/homepage/homepage.pug#15,3
      tooltip: 'Increment)',
      onPressed: () { model.incrementCounter(); },
      child: Icon( // project://counter/lib/pages/homepage/homepage.pug#19,4
        Icons.add,
      ),
    ),
  );
}
	
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}