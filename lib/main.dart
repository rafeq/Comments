import 'package:flutter/material.dart';
import './Controller/dio.dart';
import 'package:comments/Model/comment.dart';
import 'package:comments/Model/comments.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Comments"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddComment(),
            const SizedBox(height: 15.0),
            Comment(),
          ],
        ),
      ),
    );
  }
}



/*
return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Center(
        child: FutureBuilder<Comments?>(
          future: _client.getComment(id: '2'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Comments? commentInfo = snapshot.data;
              if (commentInfo != null) {
                Comments commentData = commentInfo;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8.0),
                    Text(
                      '${commentInfo.name} ${commentInfo.body}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      commentData.email,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ); */