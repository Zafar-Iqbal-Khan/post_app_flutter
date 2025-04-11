import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import 'post_notifier.dart';
import 'post_state.dart';

// Remote data source
final postRemoteDataSourceProvider = Provider((ref) {
  return PostRemoteDataSource();
});

// Repository
final postRepositoryProvider = Provider((ref) {
  return PostRepositoryImpl(ref.watch(postRemoteDataSourceProvider));
});

// Use case
final getPostsUseCaseProvider = Provider((ref) {
  return GetPostsUseCase(ref.watch(postRepositoryProvider));
});

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier(ref.watch(getPostsUseCaseProvider));
});
