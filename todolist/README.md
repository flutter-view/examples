# flutter-view todolist

This is an example of how you can build a simple todo app using flutter-view and the [flutter-view-tools library](https://pub.dartlang.org/packages/flutter_view_tools).

The most important files are:

- [task.dart](lib/task.dart) : this is the model for a single task. It uses [ScopedModel](https://github.com/brianegan/scoped_model). This allows it to notify listeners of changes.
- [app-model.dart](lib/app-model.dart) : this is the model for the app. It also uses [ScopedModel](https://github.com/brianegan/scoped_model) and contains the list of tasks, and operations that can be done on them.
- [taskspage-model.dart](lib/pages/taskspage/taskspage-model.dart) : this is the model for the page that shows the task. It is responsible for keeping state that is only for the taskpage, and handling events from the taskspage. It gets a reference to the app-model, so it can call app-level methods, such as adding and removing tasks
- [taskspage.pug](lib/pages/taskspage/taskspage.pug) : contains three flutter-view functions: 
	* tasks-page creates the tasks page. It gets the taskspage-model passed, and shows information from the model and triggers events when the user performs actions, such as swiping to dismiss a task. 
	* task-entry renders a single task entry.
	* add-task-dialog renders the model dialog for entering a new task. It gets passed the TextController from the model, as well as Functions/closures for handling the *Ok* and *Cancel* button clicks.
- [taskspage.sass](lib/pages/taskspage/taskspage.sass) : adds styling to the tasks page. Uses the theme() function to assign Theme properties using CSS
- [taskspage.dart](lib/page/taskspage/taskspage.dart) : this is the code that flutter-view generated from the combination of taskspage.pug and taskspage.sass
- [main.dart](lib/main.dart) : Creates the app-model, starts it to load saved tasks, then creates the MaterialApp with the taskspage as the home. It passes a new taskspage-model to the taskspage.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help using Flutter-View, check the online
[flutter-view documentation](https://flutter-view.gitbook.io/).