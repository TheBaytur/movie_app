import 'package:flutter/material.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super (key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopPosterWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
       
      
        Image.asset('assets/images/console.png'),
        Positioned(
          bottom: 16,
          left: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset( 'assets/images/face.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              const Text('Inception', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ],          
            ),
        ),
    ],);
  }
}