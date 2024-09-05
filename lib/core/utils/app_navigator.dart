import 'package:flutter/material.dart';

class AppNavigator {
  final BuildContext context;

  AppNavigator(this.context);

  void pop() {
    Navigator.of(context).pop();
  }

  void pushNamed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  // show snackbar
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
