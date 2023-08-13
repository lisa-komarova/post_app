import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/bloc/post_bloc.dart';
import 'package:post_app/bloc/post_state.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(builder: (context, state) {
      if (state is PostEmptyState) {
        return const Text("No data");
      } else if (state is PostLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 62, 77, 156),
          ),
        );
      } else if (state is PostLoadedState) {
        return ListView.builder(
          itemCount: state.posts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 223, 227, 247)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          state.posts[index].title,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                        Text(
                          'User ID',
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 99, 99, 99)),
                        ),
                        Text(
                          '${state.posts[index].userId}',
                          style: GoogleFonts.lato(),
                        )
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Post ID',
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 99, 99, 99)),
                          ),
                          Text(
                            '${state.posts[index].id}',
                            style: GoogleFonts.lato(),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        );
      }
      return const SizedBox.shrink();
    }, listener: (context, state) {
      if (state is PostErrorState) {
        // return const Center(child: Text('Something went wrong'));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
    });
  }
}
