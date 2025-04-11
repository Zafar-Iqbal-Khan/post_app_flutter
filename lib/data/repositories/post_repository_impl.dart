import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import 'post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> fetchPosts() async {
    final models = await remoteDataSource.fetchPosts();
    return models
        .map((model) => Post(
              id: model.id,
              title: model.title,
              body: model.body,
            ))
        .toList();
  }
}
