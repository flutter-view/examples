import 'package:flutter_view_tools/flutter_view_tools.dart';

class AppModel extends Model {

	int counter = 0;

	incrementCounter() {
		counter++;
		notifyListeners();
	}

}
