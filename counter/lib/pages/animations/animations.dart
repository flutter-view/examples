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
MaterialApp AnimationsPage({ model }) {
  return MaterialApp( // project://lib/pages/animations/animations.pug#8,2
    title: 'Flutter Demo!',
    home: Scaffold( // project://lib/pages/animations/animations.pug#9,3
      appBar: AppBar( // project://lib/pages/animations/animations.pug#10,4
        title: Container( // project://lib/pages/animations/animations.pug#11,5
          child: Text( 
            'Welcome'
          )
        )
      ),
      body: Center( // project://lib/pages/animations/animations.pug#12,4
        child: ReactiveModel( // project://lib/pages/animations/animations.pug#13,5
          model: model,
          builder: (context, model) {
            return Column( // project://lib/pages/animations/animations.pug#14,6
              children: __flatten([
                AnimatedSwitcher( // project://lib/pages/animations/animations.pug#15,7
                  duration: Duration(milliseconds: 100),
                  child: Container( // project://lib/pages/animations/animations.pug#16,8
                    key: ValueKey(model.counter),
                    child: Column( 
                      children: __flatten([
                        Container( // project://lib/pages/animations/animations.pug#17,9
                          child: Text( 
                            'You have pushed:'
                          ),
                          margin: EdgeInsets.only(top: (100).toDouble())
                        ),
                        DefaultTextStyle( 
                          child: Container( // project://lib/pages/animations/animations.pug#18,9
                            child: Text( 
                              '${model.counter} times!'
                            ),
                            margin: EdgeInsets.only(top: (30).toDouble())
                          ),
                          style: TextStyle( 
                            fontSize: (25).toDouble(),
                            color: Colors.black
                          )
                        )
                      ])
                    )
                  )
                ),
                AnimatedCrossFade( // project://lib/pages/animations/animations.pug#20,7
                  crossFadeState: model.getFadeState(),
                  duration: Duration(seconds: 1),
                  firstChild: Text( // project://lib/pages/animations/animations.pug#21,8
                    'Hello!'
                  ),
                  secondChild: Text( // project://lib/pages/animations/animations.pug#22,8
                    'Hello Again!'
                  )
                ),
                AnimatedModelController<SomeAnimationModel>( // project://lib/pages/animations/animations.pug#24,7
                  duration: Duration(seconds: 1),
                  modelFn: model.createHeightAnimModel,
                  builder: (context, widget, anim) {
                    return Column( 
                      children: __flatten([
                        PlatformButton( // project://lib/pages/animations/animations.pug#25,9
                          onPressed: () { anim.controller.forward(); },
                          child: Text( 
                            'forward'
                          )
                        ),
                        PlatformButton( // project://lib/pages/animations/animations.pug#26,9
                          onPressed: () { anim.controller.reverse(); },
                          child: Text( 
                            'reverse'
                          )
                        ),
                        Container( // project://lib/pages/animations/animations.pug#27,9
                          child: Text( 
                            'Current controller value2: ${anim.height.value}'
                          ),
                          margin: EdgeInsets.only(top: (anim.height.value).toDouble())
                        )
                      ])
                    );
                  }
                )
              ])
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton( // project://lib/pages/animations/animations.pug#30,4
        tooltip: 'Increment',
        onPressed: () { model.incrementCounter(); },
        child: Icon( // project://lib/pages/animations/animations.pug#34,5
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