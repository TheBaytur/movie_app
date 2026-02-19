import 'package:flutter/material.dart';

// last commit on 9 mon

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(
          notifier: model,
        );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
    ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()?.widget;
    return widget is NotifierProvider<Model> ? widget.model : null;
  }
}

class Provider<Model> extends InheritedWidget {
  final Model model;
  
  const Provider({
    super.key, 
    required this.model,
   required super.child
   }) : super(
   );

  

  static Provider? of<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>();
  }

  static Model? watch<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()
    ?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<Provider<Model>>()?.widget;
    return widget is Provider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(Provider<Model> oldWidget) {
    return model != oldWidget.model;
  }
}
  
