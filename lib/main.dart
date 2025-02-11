import 'package:flutter/material.dart';
import '/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'FoodChooser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
