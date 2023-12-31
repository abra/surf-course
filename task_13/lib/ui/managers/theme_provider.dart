import 'package:flutter/material.dart';

import 'theme_manager.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeManagerState state;

  const ThemeProvider({
    super.key,
    required this.state,
    required Widget child,
  }) : super(child: child);

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => true;
}
