import 'package:app_delivery/src/helpers/dependency_injection.dart';
import 'package:app_delivery/src/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyInjection.initialize();
  runApp(MyApp());
}
