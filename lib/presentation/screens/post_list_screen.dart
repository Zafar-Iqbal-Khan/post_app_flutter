import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/loading_widget.dart';
import '../providers/post_providers.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: postState.when(
        loading: () => const LoadingWidget(),
        error: (msg) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(msg),
              ElevatedButton(
                onPressed: () {
                  ref.read(postNotifierProvider.notifier).fetchPosts();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (posts) => RefreshIndicator(
            onRefresh: () async {
              await ref.read(postNotifierProvider.notifier).fetchPosts();
            },
            child: ListView.builder(
              itemCount: posts.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Post ID: ${post.id}')),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.network(
                            'https://picsum.photos/id/${post.id + 10}/600/200',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const SizedBox(
                              height: 200,
                              child: Center(child: Icon(Icons.broken_image)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 8),
                              Text(post.body,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
