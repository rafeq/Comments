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
  bool isLoadingVertical = false;

  @override
  void initState() {
    _loadMoreVertical();

    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));

    client.getComment();
    //verticalData = client.getComment() as List;

    setState(() {
      isLoadingVertical = false;
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
              isLoading: isLoadingVertical,
              onEndOfPage: () => _loadMoreVertical(),
              child: Scrollbar(
                child: ListView.builder(
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
