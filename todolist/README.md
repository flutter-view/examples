# tester

A new Flutter project, based on [flutter-view](https://github.com/blueneogeo/flutter-view), [scoped-model](https://github.com/brianegan/scoped_model) and *reactive-model*.

## Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

To generate and auto-update the home.dart file, install and then run the *flutter-view* tool in the project directory:

	flutter-view -w lib

## Differences from the standard Flutter starter app

In *lib/main.dart*, the only code you see is the code that launches the app, using the view (from *lib/pages/home/home.dart*) and the model (from *lib/app-model.dart*).

The directory *lib/pages* contains all the pages, in this case only the *HomePage*. This directory contains 3 files:
- home.pug: flutter-view pug file, that contains our homepage widget structure
- home.sass: flutter-view sass file, that contains styling for the home.pug
- home.dart: flutter-view automatically builds this file, by combining home.pug with home.sass
