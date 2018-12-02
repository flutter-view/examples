// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:tester/app-model.dart';

double animate(AnimationController controller,
    {double begin = 0.0, double end = 100.0, Curve curve = Curves.linear}) {
  return Tween(begin: begin, end: end)
      .chain(CurveTween(curve: curve))
      .animate(controller)
      .value;
}

/// A [Model] that uses an [AnimationController] to animate its properties.
/// When the [AnimationController] updates, notifyListeners is called on the model.
abstract class AnimatedModel extends Model {

  AnimationController controller;

  AnimatedModel(this.controller) : assert(controller != null) {
    controller.addListener(() => this.notifyListeners());
  }

}

typedef T ModelFn<T extends AnimatedModel>(AnimationController controller);
typedef Widget AnimatedModelBuilder<T extends AnimatedModel>(BuildContext context, Widget widget, T model);

class AnimatedModelController<T extends AnimatedModel> extends StatefulWidget {
  /// the amount of time in milliseconds that the controller takes to animate
  final Duration duration;

  /// the builder function that gets called for every tick
  final AnimatedModelBuilder<T> builder;

  /// if true, automatically start the animation
  final bool autoStart;

  final ModelFn<T> modelFn;

  final Widget child;

  AnimatedModelController({
    Key key,
    @required this.duration,
    @required this.modelFn,
    @required this.builder,
    this.autoStart = false,
    this.child
  })  : assert(duration != null),
        assert(modelFn != null),
        super(key: key);

  @override
  createState() => _AnimationModelState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new IntProperty('duration', duration.inMilliseconds, unit: 'ms'));
  }
}

class _AnimationModelState<T extends AnimatedModel> extends State<AnimatedModelController<T>>
    with TickerProviderStateMixin {

  T _model;
  AnimationController _controller;
  VoidCallback _updateStateFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: this.widget.duration, vsync: this);
    _updateStateFn = () => this.setState((){});
    _model = this.widget.modelFn(_controller);
    _model.addListener(_updateStateFn);
    if (this.widget.autoStart) _controller.forward().orCancel;
  }

  @override
  build(context) => this.widget.builder(context, this.widget.child, _model);
  
  @override
  void dispose() {
    _model.removeListener(_updateStateFn);
    _controller.dispose();
    super.dispose();
  }

}
