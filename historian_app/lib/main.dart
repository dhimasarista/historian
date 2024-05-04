import 'package:flutter/material.dart';
import 'package:historian_app/providers/histories.dart';
import 'package:historian_app/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Histories(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
