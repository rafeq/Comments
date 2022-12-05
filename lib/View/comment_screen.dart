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
    // await new Future.delayed(const Duration(seconds: 2));

    //List.generate(20, (i) => client.getComment(i));
    verticalData = client.getComment() as List;

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

/*LazyLoadScrollView(
      isLoading: isLoadingVertical,
      onEndOfPage: () => _loadMoreVertical(),
      child: Scrollbar(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: verticalData.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                "name : ${verticalData[i].toString()}",
                style: const TextStyle(color: Colors.cyan, fontSize: 20.0),
              ),
              subtitle: Text(
                "comment : ${verticalData[i].toString()}",
                style: const TextStyle(color: Colors.lightBlueAccent),
              ),
            );
          },
        ),
      ),
    ); */

  /*ListView.builder(
      controller: _scrollController,
      itemExtent: 150,
       itemBuilder: (context, i) {
        print("myList ${myList[i]}");
        return ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              "name : ${myList[i]["name"]}",
              style: const TextStyle(color: Colors.cyan, fontSize: 20.0),
            ),
            subtitle: Text(
              "comment : ${myList[i]["body"]}",
              style: const TextStyle(color: Colors.lightBlueAccent),
            ));
      },
    ));
  }
}*/

/*FutureBuilder<List<Comments>>(
        future: myList.,
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
      ), */

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
                    ), 
                    */
}
