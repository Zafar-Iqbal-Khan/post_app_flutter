import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import 'post_state.dart';

class PostNotifier extends StateNotifier<PostState> {
  final GetPostsUseCase getPosts;

  PostNotifier(this.getPosts) : super(const PostState.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    state = const PostState.loading();
    try {
      final posts = await getPosts();
      state = PostState.data(posts);
    } catch (e) {
      state = const PostState.error("Failed to fetch posts");
    }
  }
}
