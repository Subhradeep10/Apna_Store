import 'package:apna_store/constants/global_variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apna Store',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Apna Store'),
            ),
          ),
          body: const Center(
            child: Text('Flutter Demo Home Page'),
          )),
    );
  }
}
