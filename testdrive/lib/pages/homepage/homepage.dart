// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: dead_code
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_cast
	
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
	
Scaffold HomePage() {
  return Scaffold( // project://testdrive/lib/pages/homepage/homepage.pug#2,2
    appBar: AppBar( // project://testdrive/lib/pages/homepage/homepage.pug#3,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://testdrive/lib/pages/homepage/homepage.pug#4,4
        child: Text( 
          'Welcome)',
        ),
      ),
    ),
    body: Center( // project://testdrive/lib/pages/homepage/homepage.pug#5,3
      child: FittedBox( // project://testdrive/lib/pages/homepage/homepage.pug#6,4
        child: Column( 
          children: __flatten([

            //-- COVER ----------------------------------------------------------
            Container( // project://testdrive/lib/pages/homepage/homepage.pug#7,5
              decoration: BoxDecoration( 
                image: DecorationImage( 
                  image: NetworkImage( 
                    'https://cutt.ly/Gat1ivy)',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              width: 300,
              height: 300,
            ),

            //-- GREETING ----------------------------------------------------------
            Container( // project://testdrive/lib/pages/homepage/homepage.pug#8,5
              child: Text( 
                'Hello world!)',
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
	
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}