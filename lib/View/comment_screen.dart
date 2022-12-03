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
  List<Comments> myList = [];
  final ScrollController _scrollController = ScrollController();
  int maxLoad = 0;
  final DioClient client = DioClient();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreComments();
      }
    });
    build(context);
  }

  getMoreComments() {
    //print("Hiiiii");
    return client.getComment();
  }

  /* getMoreComments() async {
    final DioClient _client = DioClient();
    var res = _client.getComment(id: );

    print(res);
  }*/
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Comments>>(
        future: getMoreComments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final commentInfo = snapshot.data;
            if (commentInfo != null) {
              return ListView.builder(
                controller: _scrollController,
                itemExtent: 150,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      "name : ${commentInfo[i].name}",
                      style:
                          const TextStyle(color: Colors.cyan, fontSize: 20.0),
                    ),
                    subtitle: Text(
                      "comment : ${commentInfo[i].body}",
                      style: const TextStyle(color: Colors.lightBlueAccent),
                    ),
                  );
                },
                itemCount: commentInfo.length,
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
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

    /*Text(
                      '${commentInfo.name} ${commentInfo.body}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      commentData.email,
                      style: const TextStyle(fontSize: 16.0),
                    ), */