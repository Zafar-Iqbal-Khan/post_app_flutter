import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final List data = response.data;
      return data.map((json) => PostModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
