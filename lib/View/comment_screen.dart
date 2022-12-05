import 'package:flutter/services.dart';

import '../Controller/dio.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../Model/comment.dart';

class Comment extends StatefulWidget {
  Comment({super.key});

  @override
  _Comment createState() => _Comment();
}

class _Comment extends State<Comment> {
  final DioClient client = DioClient();
  List verticalData = [];

  final url = 'https://jsonplaceholder.typicode.com/comments/';
  bool isLoading = false;

  @override
  void initState() {
    _loadMoreComments();

    super.initState();
  }

  Future _loadMoreComments() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = true;
    });

    client.getComment();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getComment(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final commentInfo = snapshot.data;
          if (commentInfo != null) {
            return LazyLoadScrollView(
              isLoading: isLoading,
              onEndOfPage: () => _loadMoreComments(),
              child: Scrollbar(
                child: ListView.builder(
                  itemExtent: 210,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return SafeArea(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "name : ${commentInfo[i].name}",
                              style: const TextStyle(
                                  color: Colors.cyan, fontSize: 20.0),
                            ),
                          ),
                          subtitle: Text(
                            "comment : ${commentInfo[i].body}",
                            style:
                                const TextStyle(color: Colors.lightBlueAccent),
                          ),
                          isThreeLine: true,
                        ),
                      ),
                    );
                  },
                  itemCount: commentInfo.length,
                ),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
