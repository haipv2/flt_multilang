import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

//generic Bloc provider
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
//    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    _BlocProviderInherited<T> provider = context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final T bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  _BlocProviderInherited({Key key, @required Widget child, @required this.bloc})
      : super(key: key, child: child);
}
