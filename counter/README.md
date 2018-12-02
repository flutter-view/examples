# flutter-view counter

This is a flutter-view version of the Flutter starter project. 

It shows the how instead of having the counter state in the widgets, it is kept in the application model, and how the HomePage flutter-view listenes to the model and updates itself when the user presses the + button.

The most important files are:

- [app-model.dart](lib/app-model.dart) : the application model, that receives button events from the view, updates the count, and notifies any listeners (in this case, the homepage)
- [homepage.pug](lib/screens/homepage/homepage.pug) : creates homepage that shows the count and the + button
- [homepage.sass](lib/screens/homepage/homepage.sass) : adds styling to the homepage
- [homepage.dart](lib/screens/homepage/homepage.dart) : the Dart code generated automatically from the above two files
- [main.dart](lib/main.dart) : sets up the app and the app-model, then starts with the homepage, passing the model to it

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help using Flutter-View, check the online
[flutter-view documentation](https://flutter-view.gitbook.io/).
