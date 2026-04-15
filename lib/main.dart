import 'package:flutter/material.dart';
import 'AppRoutes/AppRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      // ✅ USE THIS
      initialRoute: AppRoutes.splash,

      // ✅ KEEP THIS
      routes: AppRoutes.routes,
    );
  }
}