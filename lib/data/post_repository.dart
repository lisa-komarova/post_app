import 'package:post_app/data/post_api_provider.dart';
import 'package:post_app/models/post.dart';

class PostRepository {
  PostProvider _postProvider = PostProvider();
  Future<List<Post>> fetchPosts() => _postProvider.fetchPosts();
}
