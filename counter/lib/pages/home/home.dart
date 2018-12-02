// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:tester/app-model.dart';
// ignore: unused_import
import 'package:tester/util/controller_widget.dart';
// ignore: unused_import
import 'package:tester/util/reactive-model.dart';

// ignore: non_constant_identifier_names
MaterialApp HomePage({ model }) {
  return MaterialApp( // project://lib/pages/home/home.pug#8,2
    title: 'Flutter Demo!',
    home: Scaffold( // project://lib/pages/home/home.pug#9,3
      appBar: AppBar( // project://lib/pages/home/home.pug#10,4
        title: Container( // project://lib/pages/home/home.pug#11,5
          child: Text( 
            'Welcome'
          )
        )
      ),
      body: Center( // project://lib/pages/home/home.pug#12,4
        child: ReactiveModel( // project://lib/pages/home/home.pug#13,5
          model: model,
          builder: (context, model) {
            return Container( // project://lib/pages/home/home.pug#14,6
              child: Column( 
                children: __flatten([
                  Text( 
                    'You have pushed:'
                  ),
                  DefaultTextStyle( 
                    child: Container( // project://lib/pages/home/home.pug#15,7
                      child: Text( 
                        '${model.counter} times'
                      ),
                      margin: EdgeInsets.only(top: (30).toDouble())
                    ),
                    style: TextStyle( 
                      fontSize: (25).toDouble(),
                      color: Colors.black
                    )
                  )
                ])
              ),
              margin: EdgeInsets.only(top: (100).toDouble())
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton( // project://lib/pages/home/home.pug#17,4
        tooltip: 'Increment',
        onPressed: () { model.incrementCounter(); },
        child: Icon( // project://lib/pages/home/home.pug#21,5
          Icons.add
        )
      )
    )
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}