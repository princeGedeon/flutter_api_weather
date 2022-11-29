import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Views/pages/homeview.dart';

void main() {
  //init
  WidgetsFlutterBinding.ensureInitialized();
  //portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Prince',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 75,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
          headlineMedium: TextStyle(fontSize: 30,color: Theme.of(context).primaryColorDark),
          headlineSmall: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic)
        )
      ),
      home:  HomeView(title: 'Weather App | By princeGedeon'),
    );
  }
}
