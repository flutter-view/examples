# flutter-view counter

!(https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LRHVDDIma_3N68abufD%2F-LSlCEuPPoYbMZ9fBta4%2F-LSlCnKhlmxhF5InILuI%2FScreen%20Shot%202018-12-03%20at%2012.16.29%20AM.png?alt=media&token=0f73abc1-0c9c-4648-9e36-bd68d1fd09ed)

This is a flutter-view version of the Flutter starter project. 

It uses the **reactive** tag and the [flutter-view-tools library](https://pub.dartlang.org/packages/flutter_view_tools) for responding and updating the count.

Instead of having the counter state in the widgets, it is kept in the application model, and the HomePage flutter-view listenes to the model and updates itself when the user presses the + button.

The most important files are:

- [app-model.dart](lib/app-model.dart) : the application model, that receives button events from the view, updates the count, and notifies any listeners (in this case, the homepage)
- [homepage.pug](lib/pages/homepage/homepage.pug) : creates homepage that shows the count and the + button
- [homepage.sass](lib/pages/homepage/homepage.sass) : adds styling to the homepage
- [homepage.dart](lib/pages/homepage/homepage.dart) : the Dart code generated automatically from the above two files
- [main.dart](lib/main.dart) : sets up the app and the app-model, then starts with the homepage, passing the model to it

## Getting Started

For help getting started with Flutter, view the online
[Flutter documentation](https://flutter.io/).

For help using Flutter-View, check the online
[flutter-view documentation](https://flutter-view.gitbook.io/).
