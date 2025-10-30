import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (context, index) {
        return const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child:  Row(
            children: [
              Image(image: AssetImage(AppImages.console)),],
          ),
        );
      },
    );
  }
}