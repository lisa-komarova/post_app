import 'package:post_app/data/post_api_provider.dart';
import 'package:post_app/models/post.dart';

///repository for fetching the data from PostProvider
///this class is an additional layer that doesn't depend on the source of data 
class PostRepository {
  final PostProvider _postProvider = PostProvider();
  Future<List<Post>> fetchPosts() => _postProvider.fetchPosts();
}
