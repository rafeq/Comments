import 'package:flutter/material.dart';
import './Controller/dio.dart';
import 'package:comments/View/comment_screen.dart';

import 'View/comment_add.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DioClient _client = DioClient();

  get children => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Comments"),
      ),
      body: Center(child: Comment()),
      bottomSheet: AddComment(),
    );
  }
}
