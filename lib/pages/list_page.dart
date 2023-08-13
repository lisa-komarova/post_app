import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/bloc/post_bloc.dart';
import 'package:post_app/bloc/post_event.dart';
import 'package:post_app/widgets/post_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  PostBloc postBloc = PostBloc();
  @override
  void initState() {
    postBloc.add(PostLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => postBloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Messages',
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 36),
            ),
          ),
          body: const PostList()),
    );
  }
}
