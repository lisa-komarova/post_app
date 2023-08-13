import 'package:post_app/models/post.dart';

abstract class PostState {}

class PostEmptyState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<Post> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {}
