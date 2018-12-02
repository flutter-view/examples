import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

/// Widget builder function to be called when the model updates.
/// Passes the [BuildContext] and current [Model].
typedef Widget ReactiveModelBuilder<T>(
  BuildContext context, 
  T model
);

/// Widget that rebuilds when the specified [Model] updates.
///
/// Optionally typed, but the model you past must inherit [Model].
/// 
/// Internally creates a stream of model updates by listening to the passed 
/// widget [Model], and builds a [StreamBuilder] widget which consumes this stream.
class ReactiveModel<T> extends StatefulWidget {
  ReactiveModel({@required this.model, @required this.builder}) :
    assert(model != null),
    assert(builder != null);

  /// The model to react to
  final T model;

  /// Builder that gets passed the context and the current version of the model
  final ReactiveModelBuilder<T> builder;

  @override
  State<StatefulWidget> createState() => _ReactiveModelState<T>();
}

class _ReactiveModelState<T> extends State<ReactiveModel<T>> {
  // sink gets closed in dispose, bad warning suppressed:
  // ignore: close_sinks
  StreamController<T> controller;

  void onModelUpdate() {
    this.controller.add(this.widget.model);
  }

  @override
  void initState() {
    super.initState();
    this.controller = StreamController<T>();
    (this.widget.model as Model).addListener(this.onModelUpdate);
  }

  @override
  void dispose() {
    (this.widget.model as Model).removeListener(onModelUpdate);
    this.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: this.widget.model,
      stream: this.controller.stream,
      builder: (BuildContext context, AsyncSnapshot<T> snap) {
        return snap.hasData
            ? this.widget.builder(context, snap.data)
            : Container(); // should never happen, since we pass initialData
      },
    );
  }
}
