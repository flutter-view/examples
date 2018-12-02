import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class TestModel extends Model {

	int counter = 10;

	incrementCounter() {
		counter++;
		notifyListeners();
	}

	decrementCounter() {
		counter--;
		notifyListeners();
	}

}	

