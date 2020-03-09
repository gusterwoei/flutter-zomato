// 1
import 'package:flutter/material.dart';
import 'bloc.dart';

class BlocProviderx<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProviderx({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  // 2
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProviderx<T>>();
    final BlocProviderx<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderxState();
}

class _BlocProviderxState extends State<BlocProviderx> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
