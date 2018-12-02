// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:tester/test-model.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:tester/util/reactive-model.dart';

// ignore: non_constant_identifier_names
MaterialApp TestPage({ model }) {
  return MaterialApp( // project://lib/pages/test/test.pug#7,2
    title: 'Flutter Demo!',
    home: Scaffold( // project://lib/pages/test/test.pug#8,3
      appBar: AppBar( // project://lib/pages/test/test.pug#9,4
        title: Container( // project://lib/pages/test/test.pug#10,5
          child: Text( 
            'Welcome'
          )
        )
      ),
      body: Center( // project://lib/pages/test/test.pug#11,4
        child: ReactiveModel( // project://lib/pages/test/test.pug#12,5
          model: model,
          builder: (context, model) {
            return DefaultTextStyle( 
              child: AnimatedContainer( // project://lib/pages/test/test.pug#13,6
                duration: Duration(milliseconds: 200),
                child: Column( 
                  children: __flatten([
                    Text( 
                      'Count: ${model.counter}'
                    ),
                    PlatformButton( // project://lib/pages/test/test.pug#15,7
                      onPressed: () { model.incrementCounter(); },
                      child: Text( 
                        'increase'
                      )
                    ),
                    PlatformButton( // project://lib/pages/test/test.pug#16,7
                      onPressed: () { model.decrementCounter(); },
                      child: Text( 
                        'decrease'
                      )
                    )
                  ])
                ),
                margin: EdgeInsets.only(top: (model.counter * 10).toDouble())
              ),
              style: TextStyle( 
                fontSize: (20).toDouble(),
                color: Colors.black
              )
            );
          }
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