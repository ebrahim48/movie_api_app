import 'package:flutter/material.dart';
import 'package:movie_api_project/pages/movie_page.dart';
import 'package:movie_api_project/pages/second_page.dart';
import 'package:provider/provider.dart';

import 'models/provider/movie_provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> MovieProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        SecondPage.routeName : (context) => const SecondPage(),
      },
    );
  }
}
