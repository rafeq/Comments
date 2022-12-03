import 'package:comments/View/comment_screen.dart';
import 'package:dio/dio.dart';
import '../Model/comments.dart';
import '../Model/comment.dart';

class DioClient {
  late final List myList;
  final Dio _dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/comments/1';

  Future<Comments?> getComment({required int id}) async {
    Comments? comment;
    try {
      Response commentData = await _dio.get(url);

      //print('comments: ${commentData.toString()}');
      comment = Comments.fromJson(commentData.data);
    } on DioError catch (e) {
      if (e.response == null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return comment;
  }
}
