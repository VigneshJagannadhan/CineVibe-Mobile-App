import 'package:flutter/material.dart';

void pushToNamedRoute({required String route, required BuildContext context}) {
  Navigator.of(context).pushNamed(route);
}

void pushReplacmeentNamedRoute(
    {required String route, required BuildContext context}) {
  Navigator.of(context).pushReplacementNamed(route);
}

void pushToRoute({required Widget route, required BuildContext context}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => route,
  ));
}

void pushReplacementRoute(
    {required Widget route, required BuildContext context}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => route,
  ));
}
