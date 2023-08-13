import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/bloc/post_event.dart';
import 'package:post_app/bloc/post_state.dart';
import 'package:post_app/data/post_repository.dart';
import 'package:post_app/models/post.dart';

class PostBloc extends Bloc<PostLoadEvent, PostState> {
  PostBloc() : super(PostEmptyState()) {
    on<PostLoadEvent>(
      (event, emit) async {
        emit(PostLoadingState());
        try {
          PostRepository postRepository = PostRepository();
          final List<Post> posts = await postRepository.fetchPosts();
          emit(PostLoadedState(posts));
        } catch (error) {
          emit(PostErrorState());
        }
      },
    );
  }
}
