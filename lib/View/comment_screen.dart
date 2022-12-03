import '../Controller/dio.dart';
import 'package:flutter/material.dart';

import '../Model/comment.dart';
import '../Model/comments.dart';

class Comment extends StatefulWidget {
  Comment({super.key});

  @override
  _Comment createState() => _Comment();
}

class _Comment extends State<Comment> {
  late List myList;
  final ScrollController _scrollController = ScrollController();
  int maxLoad = 20;

  @override
  void initState() {
    super.initState();
    myList = List.generate(5, (index) => "null");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreComments();
      }
    });
  }

  getMoreComments() {
    print("object");
  }

  /* getMoreComments() async {
    final DioClient _client = DioClient();
    var res = _client.getComment(id: );

    print(res);
  }*/
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemExtent: 20,
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text("jjj"),
        );
      },
      itemCount: 20,
    );
  }
}


/* return ListView.builder(
      controller: _scrollController,
      itemExtent: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(myList[index]),
        );
      },
      itemCount: 20,
    ); */