import 'package:booktaxi/2_application/base/base_app.dart';
import 'package:booktaxi/core/dependency_container.dart' as container;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await container.init();

  runApp(const BaseAppProvider());
}
