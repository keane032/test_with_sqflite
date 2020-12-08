import 'package:flutter/material.dart';
import 'package:myvocation/src/CreateQuest/CreateQuest.dart';
import 'package:myvocation/src/home/home_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeWidget(),
        '/create': (context) => CreateWidget()
      }
    );
  }
}

