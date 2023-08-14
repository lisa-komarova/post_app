import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/models/post.dart';

class DetailsPage extends StatelessWidget {
  final Post post;
  const DetailsPage({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title,
          softWrap: true,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 223, 227, 247)),
          child: Column(
            children: [
              Row(children: [
                Text(
                  'User ID',
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 99, 99, 99)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${post.userId}',
                  style: GoogleFonts.lato(),
                )
              ]),
              Row(
                children: [
                  Text(
                    'Post ID',
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 99, 99, 99)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${post.id}',
                    style: GoogleFonts.lato(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                post.body,
                style: GoogleFonts.lato(),
              ),
            ],
          )),
    );
  }
}
