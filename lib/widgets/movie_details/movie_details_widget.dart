import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_details/movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key , required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Inception', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: const [
          MovieDetailsMainInfoWidget(),
        ],
      ),
    );
  }
}