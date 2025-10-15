import 'package:fatima1/core/config/theme/app_theme.dart';
import 'package:fatima1/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:fatima1/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      theme: AppTheme.getTheme(),
      home: const CounterPage(),
    );
  }
}