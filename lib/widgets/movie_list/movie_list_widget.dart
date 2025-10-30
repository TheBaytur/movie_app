import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          color: Colors.blueAccent,
          child: Text(
            'Movie Item ${index + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}