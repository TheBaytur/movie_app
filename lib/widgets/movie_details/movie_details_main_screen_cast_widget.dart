import 'package:flutter/material.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Series Cast',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('See All', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
