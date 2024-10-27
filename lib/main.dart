import 'package:flutter/material.dart';
import 'package:wtfeua/src/features/auth/presentation/sign_in.dart';
import 'package:wtfeua/src/features/home/presentation/home_page.dart';
import 'package:wtfeua/src/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignIn(),
      routes: routeList,
    );
  }
}
