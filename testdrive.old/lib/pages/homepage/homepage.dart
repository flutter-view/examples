// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: non_constant_identifier_names
Scaffold HomePage() {
  return Scaffold( // project://lib/pages/homepage/homepage.pug#2,2
    appBar: AppBar( // project://lib/pages/homepage/homepage.pug#3,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://lib/pages/homepage/homepage.pug#4,4
        child: Text( 
          'Welcome',
        ),
      ),
    ),
    body: Center( // project://lib/pages/homepage/homepage.pug#5,3
      child: FittedBox( // project://lib/pages/homepage/homepage.pug#6,4
        child: Column( 
          children: __flatten([

            //-- COVER ----------------------------------------------------------
            Container( // project://lib/pages/homepage/homepage.pug#7,5
              decoration: BoxDecoration( 
                image: DecorationImage( 
                  image: NetworkImage( 
                    'https://cutt.ly/Gat1ivy',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              width: 300,
              height: 300,
            ),

            //-- GREETING ----------------------------------------------------------
            Container( // project://lib/pages/homepage/homepage.pug#8,5
              child: Text( 
                'Hello world!',
              ),
            )
          ]),
        ),
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