import 'package:apna_store/constants/global_variables.dart';
import 'package:apna_store/router.dart';
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
          color: GlobalVariables.selectedNavBarColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Apna Store'),
            ),
          ),
          body: Column(
            children: [
              const Center(
                child: Text('Flutter Demo Home Page'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Button pressed");
                  },
                  child: const Text('Click me')),
            ],
          )),
    );
  }
}
