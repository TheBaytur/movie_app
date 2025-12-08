import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(padding:   EdgeInsets.all(16.0),
            child: Text(
            'Series Cast',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ),           
          SizedBox(
            height: 200,
            child: Scrollbar(
              thumbVisibility: true,
            child: ListView.builder(
              
              itemCount: 10,
              itemExtent: 120,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Image (image: AssetImage(AppImages.topHeaderSubImage),
                       
                       width: 80,
                        height: 80,
                        fit: BoxFit.cover,  
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Actor ${index + 1}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ),
          TextButton(
            onPressed: () {
              // Handle "See All" button press
            },
            child: const Text('See All', style: TextStyle(color: Colors.blue)),
          ),
          
        ],
      ),
    );
  }
}
