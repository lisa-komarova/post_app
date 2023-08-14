import 'package:post_app/models/post.dart';

///abstracts class for all states
abstract class PostState {}
///state when list is empty
class PostEmptyState extends PostState {}
///state when list is loading
class PostLoadingState extends PostState {}
///state when list is loaded
class PostLoadedState extends PostState {
  List<Post> posts;
  PostLoadedState(this.posts);
}
///state when an error occurs
class PostErrorState extends PostState {}
