// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_view_tools/flutter_view_tools.dart';
// ignore: unused_import
import 'package:counter/app-model.dart';
// ignore: non_constant_identifier_names
Scaffold HomePage({ @required model }) {
  return Scaffold( // project://lib/pages/homepage/homepage.pug#6,2
    appBar: AppBar( // project://lib/pages/homepage/homepage.pug#7,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://lib/pages/homepage/homepage.pug#8,4
        child: Text( 
          'Welcome',
        ),
      ),
    ),
    body: Center( // project://lib/pages/homepage/homepage.pug#10,3
      child: ReactiveWidget( // project://lib/pages/homepage/homepage.pug#11,4
        watch: model as Listenable,
        builder: (context, $) {
          return 
          //-- MESSAGE ----------------------------------------------------------
          Container( // project://lib/pages/homepage/homepage.pug#12,5
            child: Column( 
              children: __flatten([
                Text( 
                  'You have pushed:',
                ),
                DefaultTextStyle.merge( 
                  child: 
                  //-- COUNTER ----------------------------------------------------------
                  Container( // project://lib/pages/homepage/homepage.pug#13,6
                    child: Text( 
                      '${model.counter} times',
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
    FloatingActionButton( // project://lib/pages/homepage/homepage.pug#15,3
      tooltip: 'Increment',
      onPressed: () { model.incrementCounter(); },
      child: Icon( // project://lib/pages/homepage/homepage.pug#19,4
        Icons.add,
      ),
    ),
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}